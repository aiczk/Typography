#ifndef TYPOGRAPHY_EFFECTS_INCLUDED
#define TYPOGRAPHY_EFFECTS_INCLUDED

// ============================================================================
// Shake Effect
// ============================================================================
float2 calculate_shake_offset(int char_pos, float time, float blend, float frequency, float amplitude)
{
    float time_step = floor(time * frequency);
    float2 char_random = hash22(float2(char_pos, time_step));
    float2 char_offset = char_random * 2.0 - 1.0;
    float2 line_random = hash22(float2(0.0, time_step));
    float2 line_offset = line_random * 2.0 - 1.0;
    float2 blended_offset = lerp(char_offset, line_offset, blend);
    return blended_offset * amplitude * 0.02;
}

// ============================================================================
// Catmull-Rom Curve Interpolation
// ============================================================================

// Catmull-Rom spline interpolation for smooth curves (Horner method)
float catmull_rom(float p0, float p1, float p2, float p3, float t)
{
    float a = -p0 + 3.0 * p1 - 3.0 * p2 + p3;
    float b = 2.0 * p0 - 5.0 * p1 + 4.0 * p2 - p3;
    float c = -p0 + p2;
    float d = 2.0 * p1;
    return 0.5 * (((a * t + b) * t + c) * t + d);
}

float sample_baked_curve(float4 data0, float4 data1, float t)
{
    t = saturate(t) * 7.0;
    int idx = (int)t;
    float frac_t = frac(t);
    float samples[8] = { data0.x, data0.y, data0.z, data0.w,
                         data1.x, data1.y, data1.z, data1.w };
    // Catmull-Rom: need 4 points (p0, p1, p2, p3), interpolate between p1 and p2
    int i0 = max(idx - 1, 0);
    int i1 = idx;
    int i2 = min(idx + 1, 7);
    int i3 = min(idx + 2, 7);
    return catmull_rom(samples[i0], samples[i1], samples[i2], samples[i3], frac_t);
}

// Catmull-Rom derivative for smooth tangent (Horner method)
float catmull_rom_derivative(float p0, float p1, float p2, float p3, float t)
{
    float a3 = 3.0 * (-p0 + 3.0 * p1 - 3.0 * p2 + p3);
    float b2 = 2.0 * (2.0 * p0 - 5.0 * p1 + 4.0 * p2 - p3);
    float c = -p0 + p2;
    return 0.5 * ((a3 * t + b2) * t + c);
}

float sample_baked_curve_derivative(float4 data0, float4 data1, float t)
{
    t = saturate(t) * 7.0;
    int idx = (int)t;
    float frac_t = frac(t);
    float samples[8] = { data0.x, data0.y, data0.z, data0.w,
                         data1.x, data1.y, data1.z, data1.w };
    int i0 = max(idx - 1, 0);
    int i1 = idx;
    int i2 = min(idx + 1, 7);
    int i3 = min(idx + 2, 7);
    // Scale by 7.0 to account for t being in [0, 7] range
    return catmull_rom_derivative(samples[i0], samples[i1], samples[i2], samples[i3], frac_t) * 7.0;
}

float3 sample_baked_curve_3d(float normalized_pos, float phase,
    float4 dataX0, float4 dataX1, float4 dataY0, float4 dataY1, float4 dataZ0, float4 dataZ1)
{
    float t = frac(normalized_pos + phase);
    float3 offset;
    offset.x = sample_baked_curve(dataX0, dataX1, t) * 2.0 - 1.0;
    offset.y = sample_baked_curve(dataY0, dataY1, t) * 2.0 - 1.0;
    offset.z = sample_baked_curve(dataZ0, dataZ1, t) * 2.0 - 1.0;
    return offset;
}

float3 sample_baked_tangent_3d(float normalized_pos, float phase,
    float4 dataX0, float4 dataX1, float4 dataY0, float4 dataY1, float4 dataZ0, float4 dataZ1)
{
    float t = frac(normalized_pos + phase);
    float3 tangent;
    // Use analytical derivative of Catmull-Rom spline for smooth tangent
    tangent.x = sample_baked_curve_derivative(dataX0, dataX1, t) * 2.0;
    tangent.y = sample_baked_curve_derivative(dataY0, dataY1, t) * 2.0;
    tangent.z = sample_baked_curve_derivative(dataZ0, dataZ1, t) * 2.0;
    return tangent;
}

// ============================================================================
// Typewriter Effect
// ============================================================================
// fade_width: 0 = hard cut, 1 = 1 char fade (default)
float calculate_typewriter_visibility(int char_pos, int char_count, int mode, float progress, float fade_width)
{
    float display_count = char_count * saturate(progress);
    float distance_to_edge = 0.0;
    float center_offset = (char_count - 1) * 0.5;

    if (mode == TYPEWRITER_LTR)
        distance_to_edge = display_count - char_pos;
    else if (mode == TYPEWRITER_RTL)
        distance_to_edge = char_pos - (char_count - display_count) + 1;
    else
    {
        // CenterOut: expand radius must reach edge chars at progress=1
        // max_dist_from_center = center_offset, need distance_to_edge >= 1.0
        float half_display = saturate(progress) * (center_offset + 1.0);
        float dist_from_center = abs(char_pos - center_offset);
        distance_to_edge = half_display - dist_from_center;
    }

    // fade_width controls transition zone
    // 0 = hard cut (step), 1 = 1 char fade
    if (fade_width <= EPSILON)
        return (distance_to_edge > 0.0) ? 0.0 : 1.0;

    return 1.0 - saturate(distance_to_edge / fade_width);
}

// ============================================================================
// MSDF Sampling
// ============================================================================
struct MSDFSample
{
    float sd;       // Signed distance (normalized)
    float pxSize;   // Pixel size for anti-aliasing
    float opacity;  // Main text opacity
};

// Pre-computed atlas parameters (compute once per draw call, pass to functions)
struct AtlasParams
{
    float inv_size;          // rcp(atlas_size)
    uint mask;               // atlas_size - 1
    uint shift;              // log2(atlas_size)
    float cell_size;         // ATLAS_TEXTURE_SIZE / atlas_size
    float half_inv_px_range; // 0.5 / max(2.0, cell_size / 32.0)
};

// Load AtlasParams from pre-baked uniforms (editor-baked, no runtime cost)
AtlasParams load_atlas_params()
{
    AtlasParams p;
    p.inv_size = _AtlasInvSize;
    p.mask = (uint)_AtlasMask;
    p.shift = (uint)_AtlasShift;
    p.cell_size = _AtlasCellSize;
    p.half_inv_px_range = _AtlasHalfInvPxRange;
    return p;
}

// Fast atlas UV calculation using pre-computed parameters
float2 calculate_atlas_uv_fast(uint char_index, float2 glyph_uv, AtlasParams p)
{
    uint adjusted_index = char_index - 1u;
    float2 atlas_pos;
    atlas_pos.x = (float)(adjusted_index & p.mask);
    atlas_pos.y = (float)(p.mask - (adjusted_index >> p.shift));
    float2 clamped_uv = saturate(glyph_uv * ATLAS_UV_INNER_SCALE + ATLAS_UV_MARGIN);
    return (atlas_pos + clamped_uv) * p.inv_size;
}

// Compute pixel size from screen-space UV derivatives (call once per fragment)
inline float compute_pixel_size(float2 duv, AtlasParams p)
{
    return min(p.half_inv_px_range * (duv.x + duv.y) * p.cell_size, 0.25);
}

// MSDF sampling with pre-computed pxSize (avoids duplicate fwidth)
MSDFSample sample_msdf_fast(float2 uv, uint char_index, uint font_index, AtlasParams p, float pxSize)
{
    MSDFSample result;
    result.pxSize = pxSize;

    float2 atlas_uv = calculate_atlas_uv_fast(char_index, uv, p);
    half3 mtsdf = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(atlas_uv, font_index)).rgb;
    half med = median(mtsdf);
    result.sd = 2.0 * med - 1.0;
    result.opacity = linearStepSymmetric(pxSize, result.sd);

    return result;
}

// ============================================================================
// Fragment Shader Effects
// ============================================================================

// Golden angle rotation matrix (compile-time constant)
static const float2x2 GOLDEN_ROT = float2x2(
    cos(GOLDEN_ANGLE), -sin(GOLDEN_ANGLE),
    sin(GOLDEN_ANGLE), cos(GOLDEN_ANGLE)
);

// Shadow effect with Vogel spiral soft shadow sampling
// Note: Uses global _FontTextureArray declared in main shader
void apply_shadow_effect(
    inout half3 accum_color,
    inout half accum_alpha,
    float2 glyph_uv,
    uint char_index,
    uint font_index,
    AtlasParams p,
    float pxSize,               // Pre-computed pixel size
    float opacity_mult,
    float4 shadow_params,       // x=intensity, yz=offset, w=softness
    float3 shadow_color,
    float2 screen_pos,          // SV_POSITION.xy for dithering
    uint dither_type,           // 0=Hash, 1=IGN, 2=R2
    uint sample_count)          // 4-32 samples
{
    float shadow_intensity = shadow_params.x;
    float shadow_softness = shadow_params.w;

    if (shadow_intensity <= EPSILON)
        return;

    float2 shadow_uv = glyph_uv - shadow_params.yz;

    float shadow_opacity = 0.0;
    if (shadow_softness > EPSILON)
    {
        // Vogel spiral soft shadow with dithered rotation
        float blur_radius = shadow_softness * 0.15;

        // Compute only the selected dither type
        float dither_value;
        switch(dither_type) {
            case 0:  dither_value = hash22(screen_pos).x; break;
            case 1:  dither_value = InterleavedGradientNoise(screen_pos); break;
            default: dither_value = R2Noise(screen_pos); break;
        }

        // Initial direction from dither rotation
        float2 dir;
        sincos(dither_value * TWO_PI, dir.y, dir.x);

        float rcp_count = rcp((float)sample_count);
        float total_opacity = 0.0;

        // Pre-compute atlas grid position (constant for all samples)
        uint adjusted_index = char_index - 1u;
        float2 atlas_pos = float2(
            (float)(adjusted_index & p.mask),
            (float)(p.mask - (adjusted_index >> p.shift))
        );

        // Vogel spiral: accumulate rotation by golden angle each iteration
        for (uint i = 0; i < sample_count; i++)
        {
            // Radius: sqrt for uniform area distribution
            float r = sqrt((i + 0.5) * rcp_count) * blur_radius;
            float2 offset = dir * r;
            float2 sample_uv = shadow_uv + offset;

            // Inline UV calculation (atlas_pos is cached, only UV clamping per iteration)
            float2 clamped_uv = saturate(sample_uv * ATLAS_UV_INNER_SCALE + ATLAS_UV_MARGIN);
            float2 sample_atlas_uv = (atlas_pos + clamped_uv) * p.inv_size;

            half4 sample_mtsdf = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(sample_atlas_uv, font_index));
            float sample_sdf = 2.0 * sample_mtsdf.a - 1.0;
            float sample_opacity = linearStepSymmetric(pxSize * 2.0, sample_sdf);

            // Mask: zero out if original UV was out of bounds (vectorized)
            float in_bounds = (float)all(saturate(sample_uv) == sample_uv);
            total_opacity += sample_opacity * in_bounds;

            // Rotate direction by golden angle (accumulative, no sincos per iteration)
            dir = mul(GOLDEN_ROT, dir);
        }

        shadow_opacity = total_opacity * rcp_count;
    }
    else
    {
        // Hard shadow: single sample with RGB (MSDF)
        if (!all(saturate(shadow_uv) == shadow_uv))
            return;

        float2 shadow_atlas_uv = calculate_atlas_uv_fast(char_index, shadow_uv, p);
        half4 shadow_mtsdf = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(shadow_atlas_uv, font_index));
        half shadow_med = median(shadow_mtsdf.rgb);
        float shadow_sd = 2.0 * shadow_med - 1.0;
        shadow_opacity = linearStepSymmetric(pxSize, shadow_sd);
    }

    half shadow_alpha = shadow_opacity * shadow_intensity * opacity_mult;
    accum_color = shadow_color * shadow_alpha;
    accum_alpha = shadow_alpha;
}

// Outline effect with Stroke mode support
// outline_mode: 0 = Outline (fill + outline), 1 = Stroke (hollow, outline only)
void apply_outline_effect(
    inout half3 accum_color,
    inout half accum_alpha,
    float sd,
    float pxSize,
    float opacity_mult,
    float outline_width_raw,
    float3 outline_color,
    float outline_alpha_param,
    uint outline_mode)
{
    float outline_width = outline_width_raw * 0.5;  // UI 0-1 to internal 0-0.5
    float outline_opacity;

    if (outline_mode == 1) {
        // Stroke mode: ring calculation (outer - inner)
        float outer_sd = sd + outline_width;
        float outer_opacity = linearStepSymmetric(pxSize, outer_sd);
        float inner_opacity = linearStepSymmetric(pxSize, sd);
        outline_opacity = outer_opacity - inner_opacity;
    } else {
        // Outline mode: traditional solid outline
        float outline_sd = sd + outline_width;
        float outline_pxSize = pxSize * (1.0 + outline_width * 2.0);
        outline_opacity = linearStepSymmetric(outline_pxSize, outline_sd);
    }

    // Branchless: mask alpha when width is zero
    float has_outline = step(EPSILON, outline_width);
    half outline_alpha = outline_opacity * outline_alpha_param * opacity_mult * has_outline;

    accum_color = outline_color * outline_alpha + accum_color * (1.0 - outline_alpha);
    accum_alpha = outline_alpha + accum_alpha * (1.0 - outline_alpha);
}

// Main text effect
void apply_main_text(
    inout half3 accum_color,
    inout half accum_alpha,
    float main_opacity,
    float opacity_mult,
    float4 text_color)
{
    half main_alpha = main_opacity * text_color.a * opacity_mult;
    accum_color = text_color.rgb * main_alpha + accum_color * (1.0 - main_alpha);
    accum_alpha = main_alpha + accum_alpha * (1.0 - main_alpha);
}

// ============================================================================
// Combined Effects Application
// ============================================================================
struct EffectParams
{
    float4 text_color;      // ColorA (gradient start) or TextColor if intensity=0
    float4 outline;         // x=width, yzw=color.rgb
    float4 shadow;          // x=intensity, yz=offset, w=softness
    float4 shadow_color;    // rgb=shadow_color, a=outline_alpha
    float4 gradient;        // rgb=ColorB (gradient end), a=intensity
};

// Compute gradient color based on UV, direction mode, and intensity
// mode: 0=Horizontal (left→right), 1=Vertical (top→bottom)
float4 apply_gradient(float4 color_a, float4 gradient, float2 uv, uint mode)
{
    float intensity = gradient.a;
    if (intensity < EPSILON)
        return color_a;

    float t = (mode & 1u) ? (1.0 - uv.y) : uv.x;
    float3 blended_rgb = lerp(color_a.rgb, gradient.rgb, t * intensity);
    return float4(blended_rgb, color_a.a);
}

void apply_effects(
    inout half3 accum_color,
    inout half accum_alpha,
    float2 glyph_uv,
    uint char_index,
    uint font_index,
    float opacity_mult,
    EffectParams params,
    float2 screen_pos,          // SV_POSITION.xy for dithered shadow
    float quad_padding,         // Quad padding factor (1.0 = no padding)
    uint packed_info)           // bits 0-7: font_idx (skip), 8-15: dither_type, 16-23: samples, 24-25: gradient_mode, 26: outline_mode
{
    // Unpack settings (skip bits 0-7 = font_index, passed separately)
    uint dither_type = (packed_info >> 8) & 0xFFu;
    uint sample_count = (packed_info >> 16) & 0xFFu;
    uint gradient_mode = (packed_info >> 24) & 0x3u;
    uint outline_mode = (packed_info >> 26) & 0x1u;

    // Remap UV for padded quad: keep glyph centered at original size
    float2 adjusted_uv = (glyph_uv - 0.5) * quad_padding + 0.5;

    // Load pre-baked atlas parameters (no runtime cost)
    AtlasParams p = load_atlas_params();

    // Compute pxSize once (fwidth is expensive, avoid duplicate calls)
    float2 duv = fwidth(adjusted_uv);
    float pxSize = compute_pixel_size(duv, p);

    // Shadow uses adjusted_uv (can render in padding area)
    apply_shadow_effect(accum_color, accum_alpha, adjusted_uv,
        char_index, font_index, p, pxSize, opacity_mult,
        params.shadow, params.shadow_color.rgb, screen_pos, dither_type, sample_count);

    // Branchless glyph area check (avoids warp divergence from early return)
    float in_glyph = (float)all(saturate(adjusted_uv) == adjusted_uv);

    // Sample MSDF with pre-computed pxSize
    MSDFSample msdf = sample_msdf_fast(adjusted_uv, char_index, font_index, p, pxSize);

    // Mask opacity for padding area (glyph effects only render inside glyph bounds)
    float masked_opacity_mult = opacity_mult * in_glyph;

    // Outline (pass outline_mode for Stroke support)
    apply_outline_effect(accum_color, accum_alpha,
        msdf.sd, msdf.pxSize, masked_opacity_mult,
        params.outline.x, params.outline.yzw, params.shadow_color.a, outline_mode);

    // Stroke mode: skip main text fill (branchless mask)
    float fill_mask = 1.0 - (float)outline_mode;

    // Compute gradient color based on UV position
    float4 final_color = apply_gradient(params.text_color, params.gradient, adjusted_uv, gradient_mode);

    // Main text with gradient-applied color (masked for stroke mode and padding)
    apply_main_text(accum_color, accum_alpha,
        msdf.opacity, masked_opacity_mult * fill_mask, final_color);
}

#endif // TYPOGRAPHY_EFFECTS_INCLUDED
