#ifndef TYPOGRAPHY_TEXTS_INCLUDED
#define TYPOGRAPHY_TEXTS_INCLUDED

#include "Core.hlsl"
#include "Effects.hlsl"

// ============================================================================
// Text Structures
// ============================================================================
struct text_v2f
{
    float4 vertex : SV_POSITION;                   // 4
    float2 glyph_uv : TEXCOORD0;                   // 2 (interpolated)
    nointerpolation uint char_index : TEXCOORD1;   // 1
    nointerpolation uint packed_info : TEXCOORD2;  // 1 (font:8, dither:2, samples:8, outline_mode:1, text_id:5, world_space:1, texture_uv_mode:1)
    nointerpolation uint2 anim_packed : TEXCOORD3; // 2 (x: opacity_mult|shake.x, y: shake.y|block_fade)
    nointerpolation uint quad_packed : TEXCOORD4;  // 1 (quad_padding|rcp_sample_count as f16)
    nointerpolation uint2 text_color : TEXCOORD5;  // 2 (RGBA as f16)
    nointerpolation uint2 outline : TEXCOORD6;     // 2 (width*0.5|round, blur|_ as f16)
    nointerpolation uint2 outline_color : TEXCOORD7;// 2 (R|G, B|A as f16)
    nointerpolation uint2 shadow : TEXCOORD8;      // 2 (intensity|offset.x, offset.y|blur_radius as f16)
    nointerpolation uint2 shadow_color : TEXCOORD9;// 2 (R|G, B|_ as f16)
    nointerpolation uint2 texturing : TEXCOORD10;  // 2 (matcap_intensity|matcap_bevel, matcap_blend|texture_intensity as f16)
    float3 world_pos : TEXCOORD11;                 // 3 (world position for matcap/texture view direction)
    nointerpolation float3 surface_normal : TEXCOORD12; // 3 (surface normal for matcap, NOT normalized)
    float3 view_dir : TEXCOORD13;                  // 3 (view direction, NOT normalized - normalize in fragment)
    UNITY_VERTEX_OUTPUT_STEREO
};  // Total: 29 scalars

// Backwards compatibility alias
typedef text_v2f v2f;

// ============================================================================
// Text Parameters Structure
// ============================================================================
struct TextParams
{
    // Basic settings
    float use;
    int mode;
    int layer;
    int world_space;
    int root_index;

    // Transform
    float4 text_color;
    float4 position;
    float4 rotation;
    float4 scale;
    float4 pivot;

    // Font
    int font_index;

    // Typewriter
    int typewriter_type;
    int typewriter_mode;
    float typewriter_progress;
    float typewriter_smooth;
    float4 typewriter_direction;
    float4 typewriter_rotation;
    float4 typewriter_scale;
    int typewriter_centering;
    float typewriter_center_smooth;

    // Block mode
    int block_visible;
    int block_animating;
    float block_char_delay;

    // Spacing
    float spacing;
    int spacing_anchor;

    // Curve data (baked 8-sample curves)
    float4 curve_x_0, curve_x_1;
    float4 curve_y_0, curve_y_1;
    float4 curve_z_0, curve_z_1;
    float4 curve_tx_0, curve_tx_1;
    float4 curve_ty_0, curve_ty_1;
    float4 curve_tz_0, curve_tz_1;
    float curve_intensity;
    float curve_offset;
    float curve_speed;
    float curve_rotation;
    float4 curve_center;

    // Shake
    float shake_amplitude;
    float shake_frequency;
    float shake_blend;

    // Outline
    int outline_mode;
    float outline_width;
    float outline_round;
    float4 outline_color;

    // Shadow
    float shadow_intensity;
    float shadow_softness;
    int shadow_dither_type;
    int shadow_samples;
    float4 shadow_offset;
    float4 shadow_color;

    // MatCap (texture sampled separately)
    float matcap_intensity;
    float matcap_bevel;
    float matcap_blend;

    // Texture (texture sampled separately)
    float texture_intensity;
    int texture_uv_mode;

    // View
    float4 view_offset;
    float view_scale;
};

// ============================================================================
// Text Settings Variable Declaration Macro
// ============================================================================
#define DECLARE_TEXT_VARS(N) \
    float _Use##N; \
    int _Mode##N; \
    int _Layer##N; \
    int _WorldSpace##N; \
    int _RootIndex##N; \
    float4 _TextColor##N; \
    float4 _Position##N; \
    float4 _Rotation##N; \
    float4 _Scale##N; \
    float4 _Pivot##N; \
    int _FontIndex##N; \
    int _TypewriterType##N; \
    int _TypewriterMode##N; \
    float _TypewriterProgress##N; \
    float _TypewriterSmooth##N; \
    float4 _TypewriterDirection##N; \
    float4 _TypewriterRotation##N; \
    int _BlockVisible##N; \
    int _BlockAnimating##N; \
    float _BlockCharDelay##N; \
    float4 _TypewriterScale##N; \
    int _TypewriterCentering##N; \
    float _TypewriterCenterSmooth##N; \
    float _Spacing##N; \
    int _SpacingAnchor##N; \
    float4 _CurveDataX##N##_0; \
    float4 _CurveDataX##N##_1; \
    float4 _CurveDataY##N##_0; \
    float4 _CurveDataY##N##_1; \
    float4 _CurveDataZ##N##_0; \
    float4 _CurveDataZ##N##_1; \
    float4 _CurveDataTX##N##_0; \
    float4 _CurveDataTX##N##_1; \
    float4 _CurveDataTY##N##_0; \
    float4 _CurveDataTY##N##_1; \
    float4 _CurveDataTZ##N##_0; \
    float4 _CurveDataTZ##N##_1; \
    float _CurveIntensity##N; \
    float _CurveOffset##N; \
    float _CurveSpeed##N; \
    float _CurveRotation##N; \
    float4 _CurveCenter##N; \
    float _ShakeAmplitude##N; \
    float _ShakeFrequency##N; \
    float _ShakeBlend##N; \
    int _OutlineMode##N; \
    float _OutlineWidth##N; \
    float _OutlineRound##N; \
    float4 _OutlineColor##N; \
    float _ShadowIntensity##N; \
    float _ShadowSoftness##N; \
    int _ShadowDitherType##N; \
    int _ShadowSamples##N; \
    float4 _ShadowOffset##N; \
    float4 _ShadowColor##N; \
    float _MatCapIntensity##N; \
    float _MatCapBevel##N; \
    float _MatCapBlend##N; \
    float _TextureIntensity##N; \
    int _TextureUVMode##N; \
    float4 _ViewOffset##N; \
    float _ViewScale##N; \

// Load text parameters from uniforms
#define LOAD_TEXT_PARAMS(N, p) \
    p.use = _Use##N; \
    p.mode = _Mode##N; \
    p.layer = _Layer##N; \
    p.world_space = _WorldSpace##N; \
    p.root_index = _RootIndex##N; \
    p.text_color = _TextColor##N; \
    p.position = _Position##N; \
    p.rotation = _Rotation##N; \
    p.scale = _Scale##N; \
    p.pivot = _Pivot##N; \
    p.font_index = _FontIndex##N; \
    p.typewriter_type = _TypewriterType##N; \
    p.typewriter_mode = _TypewriterMode##N; \
    p.typewriter_progress = _TypewriterProgress##N; \
    p.typewriter_smooth = _TypewriterSmooth##N; \
    p.typewriter_direction = _TypewriterDirection##N; \
    p.typewriter_rotation = _TypewriterRotation##N; \
    p.typewriter_scale = _TypewriterScale##N; \
    p.typewriter_centering = _TypewriterCentering##N; \
    p.typewriter_center_smooth = _TypewriterCenterSmooth##N; \
    p.block_visible = _BlockVisible##N; \
    p.block_animating = _BlockAnimating##N; \
    p.block_char_delay = _BlockCharDelay##N; \
    p.spacing = _Spacing##N; \
    p.spacing_anchor = _SpacingAnchor##N; \
    p.curve_x_0 = _CurveDataX##N##_0; \
    p.curve_x_1 = _CurveDataX##N##_1; \
    p.curve_y_0 = _CurveDataY##N##_0; \
    p.curve_y_1 = _CurveDataY##N##_1; \
    p.curve_z_0 = _CurveDataZ##N##_0; \
    p.curve_z_1 = _CurveDataZ##N##_1; \
    p.curve_tx_0 = _CurveDataTX##N##_0; \
    p.curve_tx_1 = _CurveDataTX##N##_1; \
    p.curve_ty_0 = _CurveDataTY##N##_0; \
    p.curve_ty_1 = _CurveDataTY##N##_1; \
    p.curve_tz_0 = _CurveDataTZ##N##_0; \
    p.curve_tz_1 = _CurveDataTZ##N##_1; \
    p.curve_intensity = _CurveIntensity##N; \
    p.curve_offset = _CurveOffset##N; \
    p.curve_speed = _CurveSpeed##N; \
    p.curve_rotation = _CurveRotation##N; \
    p.curve_center = _CurveCenter##N; \
    p.shake_amplitude = _ShakeAmplitude##N; \
    p.shake_frequency = _ShakeFrequency##N; \
    p.shake_blend = _ShakeBlend##N; \
    p.outline_mode = _OutlineMode##N; \
    p.outline_width = _OutlineWidth##N; \
    p.outline_round = _OutlineRound##N; \
    p.outline_color = _OutlineColor##N; \
    p.shadow_intensity = _ShadowIntensity##N; \
    p.shadow_softness = _ShadowSoftness##N; \
    p.shadow_dither_type = _ShadowDitherType##N; \
    p.shadow_samples = _ShadowSamples##N; \
    p.shadow_offset = _ShadowOffset##N; \
    p.shadow_color = _ShadowColor##N; \
    p.matcap_intensity = _MatCapIntensity##N; \
    p.matcap_bevel = _MatCapBevel##N; \
    p.matcap_blend = _MatCapBlend##N; \
    p.texture_intensity = _TextureIntensity##N; \
    p.texture_uv_mode = _TextureUVMode##N; \
    p.view_offset = _ViewOffset##N; \
    p.view_scale = _ViewScale##N;

// ============================================================================
// Process Text Function (Vertex Shader)
// Returns false if character should be culled/hidden
// ============================================================================
inline bool process_text(
    inout text_v2f o,
    float2 corner_uv,
    int char_pos,
    TextParams p,
    uint text_id,
    float3 cam_pos,
    float3x3 cam_rot_inv,  // Pre-transposed camera rotation matrix
    float tan_half_fov,
    float aspect,
    float vr_scale,
    float quad_padding_global,
    float dfc_enabled,
    Texture2D<float4> data_texture,
    float4 data_texture_texel_size)
{
    if (p.use < 0.5) return false;

    float anim_factor = 0.0;
    float block_fade = 1.0;
    float3 local_pos = float3(0, 0, 0);
    uint char_count = 1;
    float spacing_val = 1.0;
    uint font_idx = 0;
    float2 shake_off = float2(0, 0);

    // Load text data from texture
    {
        int2 texture_size = int2(data_texture_texel_size.zw);
        int texel_y = texture_size.y - 1 - text_id;
        float4 meta_pixel = data_texture.Load(int3(0, texel_y, 0));
        char_count = (uint)(meta_pixel.r * UINT16_MAX + TEXTURE_DATA_EPSILON);
        uint data_font_index = (uint)(meta_pixel.g * UINT16_MAX + TEXTURE_DATA_EPSILON);

        // Pre-compute visibility for both modes
        bool is_type_sequential = (p.typewriter_type == 0);

        // Sequential mode visibility
        float seq_anim = calculate_typewriter_visibility(char_pos, char_count, p.typewriter_mode, p.typewriter_progress, p.typewriter_smooth);
        bool seq_visible = (seq_anim < 1.0 - EPSILON);

        // Block mode visibility and animation factor
        int total_display = p.block_visible + p.block_animating;
        bool block_is_animating = (char_pos >= p.block_visible) && (char_pos < total_display);
        bool block_visible_flag = (char_pos < total_display);

        // Block animation calculation
        int pos_in_anim = max(char_pos - p.block_visible, 0);
        float max_delay = p.block_char_delay;
        float char_delay = (float)pos_in_anim / max((float)p.block_animating - 1.0, 1.0) * max_delay;
        float local_progress = saturate((p.typewriter_progress - char_delay) * rcp(max(1.0 - char_delay, EPSILON)));
        float smooth_factor = (p.typewriter_smooth <= EPSILON)
            ? ((local_progress >= 1.0 - EPSILON) ? 0.0 : 1.0)
            : (1.0 - saturate(local_progress / p.typewriter_smooth));
        float block_anim_factor = block_is_animating ? smooth_factor : 0.0;

        // Unified visibility check
        bool is_visible = ((uint)char_pos < char_count) &&
                          (is_type_sequential ? seq_visible : block_visible_flag);
        if (!is_visible) return false;

        // Set anim_factor and block_fade based on mode
        anim_factor = is_type_sequential ? seq_anim : block_anim_factor;
        block_fade = is_type_sequential ? 1.0 : (1.0 - block_anim_factor);

        // Load character data (optimized: 2-level branch instead of 7-level nested)
        float char_value;
        if (char_pos < 2) {
            char_value = (char_pos == 0) ? meta_pixel.b : meta_pixel.a;
        } else {
            int adjusted_pos = char_pos - 2;
            int pixel_x = 1 + (adjusted_pos >> 2);
            uint channel = adjusted_pos & 3u;
            float4 extra_pixel = data_texture.Load(int3(pixel_x, texel_y, 0));
            char_value = extract_channel(extra_pixel, channel);
        }
        uint char_index = (uint)(char_value * UINT16_MAX + TEXTURE_DATA_EPSILON);
        if (char_index == 0) return false;
        o.char_index = char_index;
        font_idx = data_font_index;

        // Shake offset
        if (p.shake_amplitude > EPSILON)
            shake_off = calculate_shake_offset(char_pos, _Time.y, p.shake_blend, p.shake_frequency, p.shake_amplitude);

        // Spacing and positioning
        spacing_val = 1.0 + p.spacing;
        float step = spacing_val * TEXT_GLYPH_SCALE;
        float total_length = (char_count - 1) * step;
        float base_total = (char_count - 1) * TEXT_GLYPH_SCALE;
        float start_pos = (p.spacing_anchor == 1) ? -base_total * 0.5 :
                          (p.spacing_anchor == 2) ? base_total * 0.5 - total_length :
                          -total_length * 0.5;
        float char_offset = start_pos + char_pos * step;

        // Dynamic center alignment
        float alignment_offset = 0.0;
        if (p.typewriter_centering == 1) {
            float smooth = p.typewriter_center_smooth;
            float visible_start_f, visible_end_f;
            if (p.typewriter_type == 0) {
                float progress_pos = p.typewriter_progress * (float)char_count;
                float discrete_end = ceil(progress_pos) - 1.0;
                float continuous_end = progress_pos - 1.0;
                float blended_end = lerp(discrete_end, continuous_end, smooth);
                if (p.typewriter_mode == 1) {
                    visible_end_f = (float)char_count - 1.0;
                    visible_start_f = visible_end_f - blended_end;
                } else {
                    visible_start_f = 0.0;
                    visible_end_f = blended_end;
                }
            } else {
                visible_start_f = 0.0;
                visible_end_f = (float)(p.block_visible + p.block_animating) - 1.0;
            }
            visible_start_f = max(0.0, visible_start_f);
            visible_end_f = clamp(visible_end_f, 0.0, (float)char_count - 1.0);
            float visible_left = start_pos + visible_start_f * step;
            float visible_right = start_pos + visible_end_f * step;
            alignment_offset = -(visible_left + visible_right) * 0.5;
        }
        local_pos = (p.mode == 2) ? float3(0, -(char_offset + alignment_offset), 0) : float3(char_offset + alignment_offset, 0, 0);
    }

    // Typewriter rotation
    float3 typewriter_rot = float3(0, 0, 0);
    if (anim_factor > EPSILON) {
        if (dot(p.typewriter_rotation.xyz, p.typewriter_rotation.xyz) > EPSILON) {
            typewriter_rot = p.typewriter_rotation.xyz * DEG2_RAD * anim_factor;
        }
        local_pos += p.typewriter_direction.xyz * anim_factor * TEXT_GLYPH_SCALE;
    }

    // Curve deformation (optimized: 2 samples instead of 3)
    float curve_rot_z = 0.0;
    float normalized_pos = (float)char_pos / max(char_count - 1, 1);
    if (p.curve_intensity > EPSILON) {
        float curve_time = _Time.y * p.curve_speed + p.curve_offset;
        float curve_delta = rcp(max((float)char_count - 1.0, 1.0));

        // Sample current and next only (forward difference for tangent)
        float3 curve_offset = sample_baked_curve_3d(normalized_pos, curve_time,
            p.curve_x_0, p.curve_x_1, p.curve_y_0, p.curve_y_1, p.curve_z_0, p.curve_z_1);
        local_pos += (curve_offset - p.curve_center.xyz) * p.curve_intensity * TEXT_GLYPH_SCALE * spacing_val;

        if (p.curve_rotation > EPSILON) {
            float3 curve_offset_next = sample_baked_curve_3d(normalized_pos + curve_delta, curve_time,
                p.curve_x_0, p.curve_x_1, p.curve_y_0, p.curve_y_1, p.curve_z_0, p.curve_z_1);
            // Forward difference tangent (next - current), add base delta for stability
            float3 curve_tangent_raw = (curve_offset_next - curve_offset) * p.curve_intensity;
            float3 curve_tangent = curve_tangent_raw + float3(curve_delta, 0, 0);
            curve_rot_z = atan2(curve_tangent.y, curve_tangent.x) * p.curve_rotation;
        }
    }

    // Transform (conditional rotation: skip sincos when rotation is zero)
    float3 text_translation = p.position.xyz * CM_TO_METER_SCALE * vr_scale;
    bool has_text_rot = dot(p.rotation.xyz, p.rotation.xyz) > EPSILON;
    float3x3 text_rot = has_text_rot
        ? rotation_matrix(p.rotation.xyz * DEG2_RAD)
        : float3x3(1,0,0, 0,1,0, 0,0,1);
    float3 text_scale = p.scale.xyz * vr_scale;
    float3 pivot = p.pivot.xyz * TEXT_GLYPH_SCALE;
    float3x3 rotation_scale = float3x3(
        text_rot._m00 * text_scale.x, text_rot._m01 * text_scale.y, text_rot._m02 * text_scale.z,
        text_rot._m10 * text_scale.x, text_rot._m11 * text_scale.y, text_rot._m12 * text_scale.z,
        text_rot._m20 * text_scale.x, text_rot._m21 * text_scale.y, text_rot._m22 * text_scale.z);
    float3 pivot_local = local_pos - pivot;
    float3 world_pos = mul(rotation_scale, pivot_local) + text_translation;

    // Root transform
    float3x3 root_matrix_cached; float3 root_pos_cached;
    GET_ROOT_TRANSFORM(p.root_index, root_matrix_cached, root_pos_cached)
    world_pos = apply_root_transform(world_pos, p.root_index, root_matrix_cached, root_pos_cached, vr_scale);

    // Frustum culling (cam_rot_inv is pre-transposed)
    float char_half_size = TEXT_GLYPH_SCALE * 0.5;
    if (p.world_space == 0 || dfc_enabled > 0.5) {
        float3 relative_to_cam = world_pos - cam_pos;
        float3 view_pos = mul(cam_rot_inv, relative_to_cam);
        view_pos.yz = -view_pos.yz;
        if (view_pos.z >= -EPSILON) return false;
        float depth = -view_pos.z;
        float margin = char_half_size * max(text_scale.x, text_scale.y) * 2.0;
        float frustum_half_w = tan_half_fov * aspect * depth + margin;
        float frustum_half_h = tan_half_fov * depth + margin;
        if (abs(view_pos.x) > frustum_half_w || abs(view_pos.y) > frustum_half_h) return false;
    }

    // Character rotation
    float3 char_rotation = typewriter_rot + float3(0, 0, curve_rot_z);
    bool has_char_rotation = dot(char_rotation, char_rotation) > EPSILON;
    float3x3 char_rot_matrix = has_char_rotation ? rotation_matrix(char_rotation) : float3x3(1,0,0, 0,1,0, 0,0,1);
    float3x3 char_rotation_scale = has_char_rotation ? mul(rotation_scale, char_rot_matrix) : rotation_scale;
    if (p.root_index > 0) {
        char_rotation_scale = mul(root_matrix_cached, char_rotation_scale);
    }

    // Quad expansion
    float3 tw_scale = lerp(float3(1,1,1), p.typewriter_scale.xyz, anim_factor);
    float quad_padding = 1.0 + quad_padding_global;
    float3 world_right = char_rotation_scale._m00_m10_m20 * (char_half_size * tw_scale.x * quad_padding);
    float3 world_up = char_rotation_scale._m01_m11_m21 * (char_half_size * tw_scale.y * quad_padding);
    float3 corner_offset = (corner_uv.x - 0.5) * 2.0 * world_right + (corner_uv.y - 0.5) * 2.0 * world_up;
    float3 corner_world = world_pos + corner_offset;

    // Projection
    if (p.world_space == 1) {
        o.vertex = project_world_space(mul(unity_ObjectToWorld, float4(corner_world, 1.0)).xyz);
    } else {
        o.vertex = project_custom_camera(corner_world, cam_pos, cam_rot_inv, tan_half_fov, aspect, p.layer);
    }

    // Pack outputs
    o.glyph_uv = corner_uv;
    o.text_color = pack_f16x4(p.text_color);
    o.outline = uint2(pack_f16x2(p.outline_width * 0.5, p.outline_round), 0);
    o.outline_color = pack_f16x4(p.outline_color);
    o.shadow = uint2(pack_f16x2(p.shadow_intensity, p.shadow_offset.x), pack_f16x2(p.shadow_offset.y, p.shadow_softness * 0.15));
    o.shadow_color = uint2(pack_f16x2(p.shadow_color.r, p.shadow_color.g), pack_f16x2(p.shadow_color.b, 0));
    o.packed_info = (font_idx & 0xFFu) | (((uint)p.shadow_dither_type & 0x3u) << 8) | (((uint)p.shadow_samples & 0xFFu) << 10) | (((uint)p.outline_mode & 0x1u) << 18) | ((text_id & 0x1Fu) << 19) | (((uint)p.world_space & 0x1u) << 24) | (((uint)p.texture_uv_mode & 0x1u) << 25);

    float opacity_mult = (1.0 - anim_factor);
    o.anim_packed = uint2(pack_f16x2(opacity_mult, shake_off.x), pack_f16x2(shake_off.y, block_fade));
    o.quad_packed = pack_f16x2(quad_padding, rcp(max((float)p.shadow_samples, 1.0)));
    o.texturing = uint2(pack_f16x2(p.matcap_intensity, p.matcap_bevel), pack_f16x2(p.matcap_blend, p.texture_intensity));

    // World position and surface normal for matcap (normalize deferred to fragment)
    float3 matcap_normal = char_rotation_scale._m02_m12_m22;  // Skip normalize
    if (p.world_space == 1) {
        o.world_pos = mul(unity_ObjectToWorld, float4(corner_world, 1.0)).xyz;
        o.surface_normal = mul((float3x3)unity_ObjectToWorld, matcap_normal);  // Skip normalize
    } else {
        o.world_pos = corner_world;
        o.surface_normal = matcap_normal;
    }

    // View direction (world_pos to camera) - normalize in fragment shader
    o.view_dir = o.world_pos - cam_pos;

    return true;
}

#endif // TYPOGRAPHY_TEXTS_INCLUDED
