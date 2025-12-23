#ifndef TYPOGRAPHY_MACROS_INCLUDED
#define TYPOGRAPHY_MACROS_INCLUDED

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
    float4 _OutlineColor##N; \
    float _ShadowIntensity##N; \
    float _ShadowSoftness##N; \
    int _ShadowDitherType##N; \
    int _ShadowSamples##N; \
    float4 _ShadowOffset##N; \
    float4 _ShadowColor##N; \
    float _GradientIntensity##N; \
    int _GradientMode##N; \
    float4 _GradientColorA##N; \
    float4 _GradientColorB##N;

// ============================================================================
// Process Text Macro (Vertex Shader)
// ============================================================================
#define PROCESS_TEXT(N) \
{ \
    if (_Use##N < 0.5) { o.vertex = float4(0,0,-1,1); return o; } \
    float vr_scale = is_vr() ? _VRScale : 1.0; \
    float anim_factor = 0.0; \
    float3 local_pos = float3(0, 0, 0); \
    uint char_count = 1; \
    float spacing = 1.0; \
    uint font_idx = 0; \
    float2 shake_off = float2(0, 0); \
    { \
        int2 texture_size = int2(_DataTexture_TexelSize.zw); \
        int texel_y = texture_size.y - 1 - N; \
        float4 meta_pixel = _DataTexture.Load(int3(0, texel_y, 0)); \
        char_count = (uint)(meta_pixel.r * UINT16_MAX + TEXTURE_DATA_EPSILON); \
        uint data_font_index = (uint)(meta_pixel.g * UINT16_MAX + TEXTURE_DATA_EPSILON); \
        if ((uint)char_pos >= char_count) { o.vertex = float4(0,0,-1,1); return o; } \
        /* Typewriter Type: 0=Sequential, 1=Block */ \
        if (_TypewriterType##N == 0) { \
            /* Sequential mode */ \
            anim_factor = calculate_typewriter_visibility(char_pos, char_count, _TypewriterMode##N, _TypewriterProgress##N, _TypewriterSmooth##N); \
            if (anim_factor >= 1.0 - EPSILON) { o.vertex = float4(0,0,-1,1); return o; } \
        } else { \
            /* Block mode */ \
            int total_display = _BlockVisible##N + _BlockAnimating##N; \
            bool is_visible_static = (char_pos < _BlockVisible##N); \
            bool is_animating = (char_pos >= _BlockVisible##N) && (char_pos < total_display); \
            if (!is_visible_static && !is_animating) { o.vertex = float4(0,0,-1,1); return o; } \
            if (is_animating) { \
                int pos_in_anim = char_pos - _BlockVisible##N; \
                float max_delay = _BlockCharDelay##N; \
                float char_delay = (float)pos_in_anim / max((float)_BlockAnimating##N - 1.0, 1.0) * max_delay; \
                float local_progress = saturate((_TypewriterProgress##N - char_delay) * rcp(max(1.0 - char_delay, EPSILON))); \
                float block_anim_factor; \
                if (_TypewriterSmooth##N <= EPSILON) \
                    block_anim_factor = (local_progress >= 1.0 - EPSILON) ? 0.0 : 1.0; \
                else \
                    block_anim_factor = 1.0 - saturate(local_progress / _TypewriterSmooth##N); \
                o.quad_block.y = 1.0 - block_anim_factor; \
                anim_factor = block_anim_factor; \
            } \
        } \
        uint char_index = 0; \
        float char_value = 0; \
        if (char_pos == 0) char_value = meta_pixel.b; \
        else if (char_pos == 1) char_value = meta_pixel.a; \
        else { \
            int adjusted_pos = char_pos - 2; \
            int pixel_x = 1 + (adjusted_pos >> 2); \
            int channel = adjusted_pos & 3; \
            float4 char_pixel = _DataTexture.Load(int3(pixel_x, texel_y, 0)); \
            char_value = (channel == 0) ? char_pixel.r : (channel == 1) ? char_pixel.g : (channel == 2) ? char_pixel.b : char_pixel.a; \
        } \
        char_index = (uint)(char_value * UINT16_MAX + TEXTURE_DATA_EPSILON); \
        if (char_index == 0) { o.vertex = float4(0,0,-1,1); return o; } \
        o.char_index = char_index; \
        font_idx = (_FontIndex##N >= 0) ? (uint)_FontIndex##N : data_font_index; \
        if (_ShakeAmplitude##N > EPSILON) \
            shake_off = calculate_shake_offset(char_pos, _Time.y, _ShakeBlend##N, _ShakeFrequency##N, _ShakeAmplitude##N); \
        spacing = 1.0 + _Spacing##N; \
        float step = spacing * TEXT_GLYPH_SCALE; \
        float total_length = (char_count - 1) * step; \
        float base_total = (char_count - 1) * TEXT_GLYPH_SCALE; \
        float start_pos = (_SpacingAnchor##N == 1) ? -base_total * 0.5 : \
                          (_SpacingAnchor##N == 2) ? base_total * 0.5 - total_length : \
                          -total_length * 0.5; \
        float char_offset = start_pos + char_pos * step; \
        /* Dynamic center alignment during typewriter animation */ \
        float alignment_offset = 0.0; \
        if (_TypewriterCentering##N == 1) { \
            float smooth = _TypewriterSmooth##N; \
            float visible_start_f, visible_end_f; \
            if (_TypewriterType##N == 0) { /* Sequential mode */ \
                float progress_pos = _TypewriterProgress##N * (float)char_count; \
                /* Blend between discrete (ceil) and continuous based on smooth */ \
                float discrete_end = ceil(progress_pos) - 1.0; \
                float continuous_end = progress_pos - 1.0; \
                float blended_end = lerp(discrete_end, continuous_end, smooth); \
                /* RTL detection */ \
                if (_TypewriterMode##N == 1) { /* RTL */ \
                    visible_end_f = (float)char_count - 1.0; \
                    visible_start_f = visible_end_f - blended_end; \
                } else { /* LTR */ \
                    visible_start_f = 0.0; \
                    visible_end_f = blended_end; \
                } \
            } else { /* Block mode */ \
                visible_start_f = 0.0; \
                visible_end_f = (float)(_BlockVisible##N + _BlockAnimating##N) - 1.0; \
            } \
            visible_start_f = max(0.0, visible_start_f); \
            visible_end_f = clamp(visible_end_f, 0.0, (float)char_count - 1.0); \
            float visible_left = start_pos + visible_start_f * step; \
            float visible_right = start_pos + visible_end_f * step; \
            alignment_offset = -(visible_left + visible_right) * 0.5; \
        } \
        local_pos = (_Mode##N == 2) ? float3(0, -(char_offset + alignment_offset), 0) : float3(char_offset + alignment_offset, 0, 0); \
    } \
    float3 typewriter_rot = float3(0, 0, 0); \
    if (anim_factor > EPSILON) { \
        if (dot(_TypewriterRotation##N.xyz, _TypewriterRotation##N.xyz) > EPSILON) { \
            typewriter_rot = _TypewriterRotation##N.xyz * DEG2RAD * anim_factor; \
        } \
        local_pos += _TypewriterDirection##N.xyz * anim_factor * TEXT_GLYPH_SCALE; \
    } \
    float curve_rot_z = 0.0; \
    float normalized_pos = (float)char_pos / max(char_count - 1, 1); \
    if (_CurveIntensity##N > EPSILON) { \
        float curve_time = _Time.y * _CurveSpeed##N + _CurveOffset##N; \
        float3 curve_offset = sample_baked_curve_3d(normalized_pos, curve_time, \
            _CurveDataX##N##_0, _CurveDataX##N##_1, _CurveDataY##N##_0, _CurveDataY##N##_1, _CurveDataZ##N##_0, _CurveDataZ##N##_1); \
        float3 curve_center = _CurveCenter##N.xyz; \
        local_pos += (curve_offset - curve_center) * _CurveIntensity##N * TEXT_GLYPH_SCALE * spacing; \
        if (_CurveRotation##N > EPSILON) { \
            /* Numerical derivative for natural tangent (v1 style: 2-point sampling) */ \
            float curve_delta = 1.0 / max((float)char_count - 1.0, 1.0); \
            float3 curve_offset_prev = sample_baked_curve_3d(normalized_pos - curve_delta, curve_time, \
                _CurveDataX##N##_0, _CurveDataX##N##_1, _CurveDataY##N##_0, _CurveDataY##N##_1, _CurveDataZ##N##_0, _CurveDataZ##N##_1); \
            float3 curve_offset_next = sample_baked_curve_3d(normalized_pos + curve_delta, curve_time, \
                _CurveDataX##N##_0, _CurveDataX##N##_1, _CurveDataY##N##_0, _CurveDataY##N##_1, _CurveDataZ##N##_0, _CurveDataZ##N##_1); \
            float3 curve_tangent_raw = (curve_offset_next - curve_offset_prev) * _CurveIntensity##N; \
            float3 curve_tangent = normalize(curve_tangent_raw + float3(curve_delta * 2.0, 0, 0)); \
            curve_rot_z = atan2(curve_tangent.y, curve_tangent.x) * _CurveRotation##N; \
        } \
    } \
    float3 text_translation = _Position##N.xyz * CM_TO_METER_SCALE * vr_scale; \
    float3x3 text_rot = rotation_matrix(_Rotation##N.xyz * DEG2RAD); \
    float3 text_scale = _Scale##N.xyz * vr_scale; \
    float3 pivot = _Pivot##N.xyz * TEXT_GLYPH_SCALE; \
    float3x3 rotation_scale = float3x3( \
        text_rot._m00 * text_scale.x, text_rot._m01 * text_scale.y, text_rot._m02 * text_scale.z, \
        text_rot._m10 * text_scale.x, text_rot._m11 * text_scale.y, text_rot._m12 * text_scale.z, \
        text_rot._m20 * text_scale.x, text_rot._m21 * text_scale.y, text_rot._m22 * text_scale.z); \
    float3 pivot_local = local_pos - pivot; \
    float3 world_pos = mul(rotation_scale, pivot_local) + text_translation; \
    float3x3 root_matrix_cached = (float3x3)0; \
    float3 root_pos_cached = float3(0, 0, 0); \
    if (_RootIndex##N > 0) { \
        switch(_RootIndex##N) { \
            case 1: root_matrix_cached = float3x3(_RootMatrix0_Row0.xyz, _RootMatrix0_Row1.xyz, _RootMatrix0_Row2.xyz); root_pos_cached = _RootPosition0.xyz; break; \
            case 2: root_matrix_cached = float3x3(_RootMatrix1_Row0.xyz, _RootMatrix1_Row1.xyz, _RootMatrix1_Row2.xyz); root_pos_cached = _RootPosition1.xyz; break; \
            case 3: root_matrix_cached = float3x3(_RootMatrix2_Row0.xyz, _RootMatrix2_Row1.xyz, _RootMatrix2_Row2.xyz); root_pos_cached = _RootPosition2.xyz; break; \
            case 4: root_matrix_cached = float3x3(_RootMatrix3_Row0.xyz, _RootMatrix3_Row1.xyz, _RootMatrix3_Row2.xyz); root_pos_cached = _RootPosition3.xyz; break; \
            default: root_matrix_cached = float3x3(_RootMatrix4_Row0.xyz, _RootMatrix4_Row1.xyz, _RootMatrix4_Row2.xyz); root_pos_cached = _RootPosition4.xyz; break; \
        } \
        world_pos = mul(root_matrix_cached, world_pos) + root_pos_cached * CM_TO_METER_SCALE * vr_scale; \
    } \
    float3 relative_to_cam = world_pos - cam_pos; \
    float3 view_pos = mul(transpose(cam_rot), relative_to_cam); \
    if (view_pos.z <= 0) { o.vertex = float4(0,0,-1,1); return o; } \
    float char_half_size = TEXT_GLYPH_SCALE * 0.5; \
    float3 char_rotation = typewriter_rot + float3(0, 0, curve_rot_z); \
    bool has_char_rotation = dot(char_rotation, char_rotation) > EPSILON; \
    float3x3 char_rot_matrix = has_char_rotation ? rotation_matrix(char_rotation) : float3x3(1,0,0, 0,1,0, 0,0,1); \
    float3x3 char_rotation_scale = has_char_rotation ? mul(rotation_scale, char_rot_matrix) : rotation_scale; \
    if (_RootIndex##N > 0) { \
        char_rotation_scale = mul(root_matrix_cached, char_rotation_scale); \
    } \
    float3 tw_scale = lerp(float3(1,1,1), _TypewriterScale##N.xyz, anim_factor); \
    float quad_padding = 1.0 + _QuadPadding; \
    float3 world_right = char_rotation_scale._m00_m10_m20 * (char_half_size * tw_scale.x * quad_padding); \
    float3 world_up = char_rotation_scale._m01_m11_m21 * (char_half_size * tw_scale.y * quad_padding); \
    float3 corner_offset = (v.uv2.x - 0.5) * 2.0 * world_right + (v.uv2.y - 0.5) * 2.0 * world_up; \
    o.quad_block.x = quad_padding; \
    float3 corner_world = world_pos + corner_offset; \
    if (_WorldSpace##N == 1) { \
        o.vertex = project_world_space(corner_world); \
    } else { \
        o.vertex = project_custom_camera(corner_world, cam_pos, cam_rot, tan_half_fov, aspect, _Layer##N); \
    } \
    o.text_color = (_GradientIntensity##N > EPSILON) ? _GradientColorA##N : _TextColor##N; \
    o.outline = float4(_OutlineWidth##N, _OutlineColor##N.rgb); \
    o.shadow = float4(_ShadowIntensity##N, _ShadowOffset##N.xy, _ShadowSoftness##N); \
    o.shadow_color = float4(_ShadowColor##N.rgb, _OutlineColor##N.a); \
    o.packed_info = (font_idx & 0xFFu) | (((uint)_ShadowDitherType##N & 0xFFu) << 8) | (((uint)_ShadowSamples##N & 0xFFu) << 16) | (((uint)_GradientMode##N & 0x3u) << 24) | (((uint)_OutlineMode##N & 0x1u) << 26); \
    o.anim_params = float4(anim_factor, shake_off.x, shake_off.y, 1.0); \
    o.gradient = float4(_GradientColorB##N.rgb, _GradientIntensity##N); \
}

#endif // TYPOGRAPHY_MACROS_INCLUDED
