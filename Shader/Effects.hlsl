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

inline float2 calculate_shake_deform(
    int char_pos,
    float time,
    float shake_amplitude,
    float shake_frequency,
    float shake_blend)
{
    if (shake_amplitude <= EPSILON)
        return float2(0, 0);

    return calculate_shake_offset(char_pos, time, shake_blend, shake_frequency, shake_amplitude);
}

// ============================================================================
// Catmull-Rom Curve Interpolation
// ============================================================================

// Catmull-Rom spline interpolation (Lagrange basis optimized)
// Reduces 16-18 MAD to 8-10 MAD with better instruction pipelining
float catmull_rom(float p0, float p1, float p2, float p3, float t)
{
    float t2 = t * t;
    float t3 = t2 * t;
    // Lagrange basis functions for Catmull-Rom
    float h0 = mad(-0.5, t3, mad(1.0, t2, -0.5 * t));           // -0.5t³ + t² - 0.5t
    float h1 = mad(1.5, t3, mad(-2.5, t2, 1.0));                // 1.5t³ - 2.5t² + 1
    float h2 = mad(-1.5, t3, mad(2.0, t2, 0.5 * t));            // -1.5t³ + 2t² + 0.5t
    float h3 = mad(0.5, t3, -0.5 * t2);                          // 0.5t³ - 0.5t²
    return mad(p0, h0, mad(p1, h1, mad(p2, h2, p3 * h3)));
}

// Helper: branchless sample extraction (swizzle + dot trick)
inline float get_curve_sample(float4 data0, float4 data1, int i)
{
    float4 data = (i < 4) ? data0 : data1;
    int j = i & 3;
    float4 mask = float4(j == 0, j == 1, j == 2, j == 3);
    return dot(data, mask);
}

float sample_baked_curve(float4 data0, float4 data1, float t)
{
    t = saturate(t) * 7.0;
    int idx = (int)t;
    float frac_t = frac(t);
    // Catmull-Rom: need 4 points (p0, p1, p2, p3), interpolate between p1 and p2
    int i0 = max(idx - 1, 0);
    int i1 = idx;
    int i2 = min(idx + 1, 7);
    int i3 = min(idx + 2, 7);
    // Branchless extraction (no dynamic array allocation)
    float p0 = get_curve_sample(data0, data1, i0);
    float p1 = get_curve_sample(data0, data1, i1);
    float p2 = get_curve_sample(data0, data1, i2);
    float p3 = get_curve_sample(data0, data1, i3);
    return catmull_rom(p0, p1, p2, p3, frac_t);
}

// Catmull-Rom derivative (Lagrange basis derivative optimized)
float catmull_rom_derivative(float p0, float p1, float p2, float p3, float t)
{
    float t2 = t * t;
    // Derivatives of Lagrange basis functions
    float dh0 = mad(-1.5, t2, mad(2.0, t, -0.5));               // -1.5t² + 2t - 0.5
    float dh1 = mad(4.5, t2, -5.0 * t);                          // 4.5t² - 5t
    float dh2 = mad(-4.5, t2, mad(4.0, t, 0.5));                // -4.5t² + 4t + 0.5
    float dh3 = mad(1.5, t2, -1.0 * t);                          // 1.5t² - t
    return mad(p0, dh0, mad(p1, dh1, mad(p2, dh2, p3 * dh3)));
}

float sample_baked_curve_derivative(float4 data0, float4 data1, float t)
{
    t = saturate(t) * 7.0;
    int idx = (int)t;
    float frac_t = frac(t);
    int i0 = max(idx - 1, 0);
    int i1 = idx;
    int i2 = min(idx + 1, 7);
    int i3 = min(idx + 2, 7);
    // Branchless extraction (reuse helper)
    float p0 = get_curve_sample(data0, data1, i0);
    float p1 = get_curve_sample(data0, data1, i1);
    float p2 = get_curve_sample(data0, data1, i2);
    float p3 = get_curve_sample(data0, data1, i3);
    // Scale by 7.0 to account for t being in [0, 7] range
    return catmull_rom_derivative(p0, p1, p2, p3, frac_t) * 7.0;
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
// Curve Deformation
// ============================================================================

struct CurveDeform
{
    float3 position_offset;
    float rotation_z;
};

inline CurveDeform calculate_curve_deform(
    float normalized_pos,
    uint char_count,
    float curve_intensity,
    float curve_rotation,
    float curve_speed,
    float curve_offset,
    float4 curve_center,
    float spacing_val,
    float time,
    float4 curve_x_0, float4 curve_x_1,
    float4 curve_y_0, float4 curve_y_1,
    float4 curve_z_0, float4 curve_z_1)
{
    CurveDeform result;
    result.position_offset = float3(0, 0, 0);
    result.rotation_z = 0.0;

    if (curve_intensity > EPSILON)
    {
        float curve_time = time * curve_speed + curve_offset;
        float curve_delta = rcp(max((float)char_count - 1.0, 1.0));

        float3 curve_sample = sample_baked_curve_3d(normalized_pos, curve_time,
            curve_x_0, curve_x_1, curve_y_0, curve_y_1, curve_z_0, curve_z_1);
        result.position_offset = (curve_sample - curve_center.xyz) * curve_intensity * TEXT_GLYPH_SCALE * spacing_val;

        if (curve_rotation > EPSILON)
        {
            float3 curve_sample_next = sample_baked_curve_3d(normalized_pos + curve_delta, curve_time,
                curve_x_0, curve_x_1, curve_y_0, curve_y_1, curve_z_0, curve_z_1);
            float3 curve_tangent_raw = (curve_sample_next - curve_sample) * curve_intensity;
            float3 curve_tangent = curve_tangent_raw + float3(curve_delta, 0, 0);
            result.rotation_z = atan2(curve_tangent.y, curve_tangent.x) * curve_rotation;
        }
    }

    return result;
}

// ============================================================================
// Typewriter Effect (After Effects style)
// ============================================================================
// fade_width: 0 = hard cut, higher = smoother transition
// Returns anim_factor: 0 = fully visible, 1 = fully hidden
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
        float half_display = saturate(progress) * (center_offset + 1.0);
        float dist_from_center = abs(char_pos - center_offset);
        distance_to_edge = half_display - dist_from_center;
    }

    // Hard edge mode
    if (fade_width <= EPSILON)
        return (distance_to_edge > 0.0) ? 0.0 : 1.0;

    // After Effects-style smooth falloff with easing
    float normalized_distance = distance_to_edge / fade_width;
    float visibility = saturate(normalized_distance * 0.5 + 0.5);
    visibility = ease_smooth(visibility);

    return 1.0 - visibility;
}

// ============================================================================
// MSDF Sampling
// ============================================================================
struct MSDFSample
{
    float sd;           // Signed distance from MSDF median (sharp corners)
    float sd_rounded;   // Signed distance from SDF alpha (rounded corners)
    float softness;     // Edge softness for anti-aliasing (emrange-based)
    float opacity;      // Main text opacity
};

// Pre-computed atlas parameters (compute once per draw call, pass to functions)
struct AtlasParams
{
    float inv_size;          // rcp(atlas_size)
    uint mask;               // atlas_size - 1
    uint shift;              // log2(atlas_size)
    float half_inv_emrange;  // 0.5 / emrange (1.667 for emrange=0.3)
};

// Load AtlasParams from pre-baked uniforms (editor-baked, no runtime cost)
AtlasParams load_atlas_params()
{
    AtlasParams p;
    p.inv_size = _AtlasInvSize;
    p.mask = (uint)_AtlasMask;
    p.shift = (uint)_AtlasShift;
    p.half_inv_emrange = _AtlasHalfInvPxRange;
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

// MSDF sampling with pre-computed atlas_pos and half_inv_softness
// Returns both sharp (MSDF median) and rounded (SDF alpha) distances
MSDFSample sample_msdf_fast(float2 uv, float2 atlas_pos, uint font_index, AtlasParams p, float half_inv_softness)
{
    MSDFSample result;
    result.softness = 0.5 / half_inv_softness;  // Reconstruct for struct (rarely used)

    float2 clamped_uv = saturate(uv * ATLAS_UV_INNER_SCALE + ATLAS_UV_MARGIN);
    float2 atlas_uv = (atlas_pos + clamped_uv) * p.inv_size;
    half4 mtsdf = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(atlas_uv, font_index));
    half med = median(mtsdf.rgb);
    result.sd = 2.0 * med - 1.0;
    result.sd_rounded = 2.0 * mtsdf.a - 1.0;
    result.opacity = linearStepSymmetric_fast(result.sd, half_inv_softness);

    return result;
}

// ============================================================================
// Fragment Shader Effects
// ============================================================================

// ============================================================================
// Shadow functions
// ============================================================================

// Hard shadow: single MSDF sample (fast path, no blur)
void apply_shadow_hard(
    inout half3 accum_color,
    inout half accum_alpha,
    float2 shadow_uv,
    float2 atlas_pos,
    uint font_index,
    AtlasParams p,
    float half_inv_softness,
    float shadow_intensity,
    float opacity_mult,
    float3 shadow_color)
{
    if (!all(saturate(shadow_uv) == shadow_uv))
        return;

    float2 clamped_uv = saturate(shadow_uv * ATLAS_UV_INNER_SCALE + ATLAS_UV_MARGIN);
    float2 shadow_atlas_uv = (atlas_pos + clamped_uv) * p.inv_size;
    half4 shadow_mtsdf = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(shadow_atlas_uv, font_index));
    half shadow_med = median(shadow_mtsdf.rgb);
    float shadow_sd = 2.0 * shadow_med - 1.0;
    float shadow_opacity = linearStepSymmetric_fast(shadow_sd, half_inv_softness);

    half shadow_alpha = shadow_opacity * shadow_intensity * opacity_mult;
    accum_color = shadow_color * shadow_alpha;
    accum_alpha = shadow_alpha;
}

// Soft shadow: SDF distance-based (Red Blob Games method)
// Uses true SDF alpha channel directly - single sample, no multi-sampling needed
void apply_shadow_soft(
    inout half3 accum_color,
    inout half accum_alpha,
    float2 shadow_uv,
    float2 atlas_pos,
    uint font_index,
    AtlasParams p,
    float shadow_intensity,
    float opacity_mult,
    float3 shadow_color,
    float blur_radius)
{
    if (!all(saturate(shadow_uv) == shadow_uv))
        return;

    float2 clamped_uv = saturate(shadow_uv * ATLAS_UV_INNER_SCALE + ATLAS_UV_MARGIN);
    float2 shadow_atlas_uv = (atlas_pos + clamped_uv) * p.inv_size;

    // Use true SDF from MTSDF alpha channel (not MSDF RGB median)
    half sample_alpha = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(shadow_atlas_uv, font_index)).a;
    float sd = 2.0 * sample_alpha - 1.0;  // [-1, 1] signed distance

    // Direct distance-to-opacity conversion
    // Extended range: gradient extends into glyph interior for glow-like softness
    // pow(x, 2.5) creates gentler falloff at outer edge
    float shadow_opacity = pow(smoothstep(-blur_radius, blur_radius * 0.5, sd), 1.5);

    half shadow_alpha = shadow_opacity * shadow_intensity * opacity_mult;
    accum_color = shadow_color * shadow_alpha;
    accum_alpha = shadow_alpha;
}

// Shadow effect dispatcher (entry point)
void apply_shadow_effect(
    inout half3 accum_color,
    inout half accum_alpha,
    float2 glyph_uv,
    float2 atlas_pos,
    uint font_index,
    AtlasParams p,
    float half_inv_softness,
    float opacity_mult,
    float4 shadow_params,       // x=intensity, yz=offset, w=blur_radius
    float3 shadow_color)
{
    float shadow_intensity = shadow_params.x;
    if (shadow_intensity <= EPSILON)
        return;

    float blur_radius = shadow_params.w;
    float2 shadow_uv = glyph_uv - shadow_params.yz;

    // Dispatch to specialized function
    if (blur_radius > EPSILON)
    {
        apply_shadow_soft(accum_color, accum_alpha, shadow_uv, atlas_pos, font_index, p,
            shadow_intensity, opacity_mult, shadow_color, blur_radius);
    }
    else
    {
        apply_shadow_hard(accum_color, accum_alpha, shadow_uv, atlas_pos, font_index, p,
            half_inv_softness, shadow_intensity, opacity_mult, shadow_color);
    }
}

// Outline effect with Stroke mode and rounded corners support
// outline_mode: 0 = Outline (fill + outline), 1 = Stroke (hollow, outline only)
// outline_round: 0-1 blend between sharp corners (MSDF) and rounded corners (SDF alpha)
void apply_outline_effect(
    inout half3 accum_color,
    inout half accum_alpha,
    float sd_sharp,             // Signed distance from MSDF (sharp corners)
    float sd_rounded,           // Signed distance from SDF alpha (rounded corners)
    float half_inv_softness,
    float opacity_mult,
    float outline_width,        // Pre-computed in VS: width * 0.5 (relative to em)
    float outline_round,        // 0-1 blend between sharp and rounded
    float4 outline_color,       // rgba=color
    uint outline_mode)
{
    // Inner edge uses sharp MSDF for crisp text
    // Outer edge blends between sharp (MSDF) and rounded (SDF) based on parameter
    float sd_inner = sd_sharp;
    float sd_outer = lerp(sd_sharp, sd_rounded, outline_round);

    // Compute outer edge opacity with sharp anti-aliased edge
    float outer_opacity = linearStepSymmetric_fast(sd_outer + outline_width, half_inv_softness);

    // Branchless outline calculation:
    // outline_mode=0 (Outline): outer_opacity
    // outline_mode=1 (Stroke):  outer_opacity - inner_opacity
    float inner_opacity = linearStepSymmetric_fast(sd_inner, half_inv_softness);
    float outline_opacity = outer_opacity - inner_opacity * (float)outline_mode;

    // Branchless: mask alpha when width is zero
    float has_outline = step(EPSILON, outline_width);
    half outline_alpha = outline_opacity * outline_color.a * opacity_mult * has_outline;

    accum_color = outline_color.rgb * outline_alpha + accum_color * (1.0 - outline_alpha);
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

// Procedural Surface Effect
// Applies noise-based patterns to text color
// mode: 0=Simplex, 1=Voronoi, 2=FBM, 3=Turbulence, 4=Ridged, 5=Marble
// blend_mode: 0=Multiply, 1=Replace, 2=Add
void apply_surface_effect(
    inout half3 accum_color,
    float main_opacity,
    float2 glyph_uv,
    float3 world_pos,
    float time,
    uint mode,
    float intensity,
    float scale,
    float speed,
    float3 effect_color,
    uint blend_mode)
{
    if (intensity <= EPSILON || main_opacity <= EPSILON)
        return;

    // Use world position for seamless patterns across characters
    float2 uv = world_pos.xy * scale;
    float anim_time = time * speed;

    // Generate noise value based on mode
    float noise_value = 0.0;

    [branch]
    switch (mode)
    {
        case SURFACE_MODE_SIMPLEX:
            // Animated simplex noise
            noise_value = simplex3d(float3(uv, anim_time)) * 0.5 + 0.5;
            break;

        case SURFACE_MODE_CURL:
            // Curl noise - fluid-like swirling flow
            noise_value = curl_noise_animated(uv, anim_time);
            break;

        case SURFACE_MODE_FBM:
            // Animated fractal noise (4 octaves)
            noise_value = fbm_animated(uv, anim_time, 4) * 0.5 + 0.5;
            break;

        case SURFACE_MODE_TURBULENCE:
            // Sharp valleys - fire, smoke effect
            noise_value = turbulence_animated(uv, anim_time, 4);
            break;

        case SURFACE_MODE_RIDGED:
            // Sharp ridges - lightning, cracks
            noise_value = ridged_animated(uv, anim_time, 4);
            break;

        case SURFACE_MODE_MARBLE:
            // Classic marble veins
            noise_value = marble_animated(uv, anim_time, 2.0);
            break;

        default:
            return;
    }

    // Generate effect color from noise
    half3 noise_color = effect_color * noise_value;

    // Apply blend mode
    half3 result;
    [branch]
    switch (blend_mode)
    {
        case 0:  // Multiply
            result = accum_color * (1.0 - intensity + noise_color * intensity);
            break;
        case 1:  // Replace
            result = noise_color;
            break;
        case 2:  // Add
            result = accum_color + noise_color * intensity;
            break;
        default:
            result = accum_color;
            break;
    }

    // Apply with intensity and opacity (steepened to avoid edge bleeding)
    float effect_mask = saturate(main_opacity * 2.0);
    accum_color = lerp(accum_color, saturate(result), intensity * effect_mask);
}

// ============================================================================
// Combined Effects Application
// ============================================================================
struct EffectParams
{
    float4 text_color;      // rgba=text_color
    float4 outline;         // x=width*0.5, y=round, zw=_
    float4 outline_color;   // rgba=color
    float4 shadow;          // x=intensity, yz=offset, w=softness
    float4 shadow_color;    // rgb=shadow_color, a=_
};

void apply_effects(
    inout half3 accum_color,
    inout half accum_alpha,
    out MSDFSample msdf_out,    // Output MSDF sample for reuse
    float2 adjusted_uv,         // Pre-computed: (glyph_uv - 0.5) * quad_padding + 0.5
    AtlasParams p,              // Pre-loaded atlas parameters
    uint char_index,
    uint font_index,
    float opacity_mult,
    EffectParams params,
    uint packed_info)           // see Constants.hlsl for packed_info bit layout
{
    // Unpack settings (see Constants.hlsl for bit layout)
    uint outline_mode = UNPACK_OUTLINE_MODE(packed_info);

    // Compute softness once (fwidth is expensive, avoid duplicate calls)
    float2 duv = fwidth(adjusted_uv);
    float softness = min(p.half_inv_emrange * max(duv.x, duv.y), 0.5);
    float half_inv_softness = 0.5 * rcp(softness);

    // Pre-compute atlas_pos once
    uint adjusted_index = char_index - 1u;
    float2 atlas_pos;
    atlas_pos.x = (float)(adjusted_index & p.mask);
    atlas_pos.y = (float)(p.mask - (adjusted_index >> p.shift));

    // Shadow effect (renders behind text)
    apply_shadow_effect(accum_color, accum_alpha, adjusted_uv,
        atlas_pos, font_index, p, half_inv_softness, opacity_mult,
        params.shadow, params.shadow_color.rgb);

    // Branchless glyph area check (avoids warp divergence from early return)
    float in_glyph = all(saturate(adjusted_uv) == adjusted_uv);

    // Sample MSDF with pre-computed atlas_pos, font_index, and half_inv_softness
    MSDFSample msdf = sample_msdf_fast(adjusted_uv, atlas_pos, font_index, p, half_inv_softness);

    // Mask opacity for padding area (glyph effects only render inside glyph bounds)
    float masked_opacity_mult = opacity_mult * in_glyph;

    // Outline with width and round support (uses half_inv_softness)
    apply_outline_effect(accum_color, accum_alpha,
        msdf.sd, msdf.sd_rounded, half_inv_softness, masked_opacity_mult,
        params.outline.x, params.outline.y,
        params.outline_color, outline_mode);

    // Stroke mode: skip main text fill (branchless mask)
    float fill_mask = 1.0 - (float)outline_mode;

    // Main text (masked for stroke mode and padding)
    apply_main_text(accum_color, accum_alpha,
        msdf.opacity, masked_opacity_mult * fill_mask, params.text_color);

    // Output MSDF sample for reuse by other effects
    msdf_out = msdf;
}

#endif // TYPOGRAPHY_DEV_EFFECTS_INCLUDED
