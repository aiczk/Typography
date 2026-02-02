#ifndef TYPOGRAPHY_SYSTEMS_INCLUDED
#define TYPOGRAPHY_SYSTEMS_INCLUDED

// ============================================================================
// Systems.hlsl - Unified Processing Logic
// ============================================================================
// All system functions in one file.
// Replaces the previous 9-file Systems/ folder structure.
// Wrapper functions removed - use Core.hlsl functions directly in Pipeline.

// ============================================================================
// Visibility System
// ============================================================================

inline bool visibility_check(float use)
{
    return use >= 0.5;
}

// Typewriter visibility (sequential mode)
// Returns anim_factor: 0 = fully visible, 1 = fully hidden
inline float calculate_typewriter_anim(
    int char_pos,
    uint char_count,
    int mode,
    float progress,
    float smooth_width)
{
    float total_range = (float)char_count + smooth_width;
    float extended_progress = total_range * saturate(progress);
    float fade_start = extended_progress - smooth_width;

    float effective_pos;
    if (mode == TYPEWRITER_LTR)
        effective_pos = (float)char_pos;
    else if (mode == TYPEWRITER_RTL)
        effective_pos = (float)(char_count - 1 - char_pos);
    else // TYPEWRITER_CENTER_OUT
    {
        float center = (float)(char_count - 1) * 0.5;
        effective_pos = abs((float)char_pos - center) * 2.0;
    }

    float t = (effective_pos - fade_start) / max(smooth_width, EPSILON);

    if (smooth_width <= EPSILON)
        return (effective_pos < fade_start + 0.5) ? 0.0 : 1.0;

    float visibility = 1.0 - saturate(t);
    visibility = ease_smooth(visibility);
    return 1.0 - visibility;
}

struct TypewriterResult
{
    bool is_visible;
    float anim_factor;
    float block_fade;
};

inline TypewriterResult calculate_typewriter_visibility_full(
    int char_pos,
    uint char_count,
    int typewriter_type,
    int typewriter_mode,
    float typewriter_progress,
    float typewriter_smooth,
    int block_visible,
    int block_animating,
    float block_char_delay)
{
    TypewriterResult result;
    result.anim_factor = 0.0;
    result.block_fade = 1.0;
    result.is_visible = false;

    if (typewriter_type == 0)
    {
        // Sequential mode
        float anim = calculate_typewriter_anim(char_pos, char_count, typewriter_mode, typewriter_progress, typewriter_smooth);
        result.is_visible = (anim < 0.999);
        result.anim_factor = anim;
        result.block_fade = 1.0;
    }
    else
    {
        // Block mode
        int total_display = block_visible + block_animating;
        bool is_animating = (char_pos >= block_visible) && (char_pos < total_display);
        result.is_visible = (char_pos < total_display);

        int pos_in_anim = max(char_pos - block_visible, 0);
        float max_delay = block_char_delay;
        float char_delay = (float)pos_in_anim / max((float)block_animating - 1.0, 1.0) * max_delay;
        float local_progress = saturate((typewriter_progress - char_delay) * rcp(max(1.0 - char_delay, EPSILON)));
        local_progress = ease_smooth(local_progress);

        float smooth_factor;
        if (typewriter_smooth <= EPSILON)
            smooth_factor = (local_progress >= 1.0 - EPSILON) ? 0.0 : 1.0;
        else
        {
            float visibility = saturate(local_progress / min(typewriter_smooth, 1.0));
            visibility = ease_smooth(visibility);
            smooth_factor = 1.0 - visibility;
        }

        result.anim_factor = is_animating ? smooth_factor : 0.0;
        result.block_fade = 1.0 - result.anim_factor;
    }

    return result;
}

// ============================================================================
// Data Load System
// ============================================================================

struct TextDataResult
{
    uint char_count;
    uint font_index;
    uint char_index;
    bool valid;
};

inline TextDataResult load_text_data(
    Texture2D<float4> data_texture,
    float4 data_texture_texel_size,
    uint text_id,
    int char_pos)
{
    TextDataResult result;
    result.valid = false;
    result.char_count = 0;
    result.font_index = 0;
    result.char_index = 0;

    int2 texture_size = int2(data_texture_texel_size.zw);
    int texel_y = texture_size.y - 1 - text_id;

    float4 meta_pixel = data_texture.Load(int3(0, texel_y, 0));
    result.char_count = (uint)(meta_pixel.r * UINT16_MAX + TEXTURE_DATA_EPSILON);
    result.font_index = (uint)(meta_pixel.g * UINT16_MAX + TEXTURE_DATA_EPSILON);

    float char_value;
    if (char_pos < 2)
        char_value = (char_pos == 0) ? meta_pixel.b : meta_pixel.a;
    else
    {
        int adjusted_pos = char_pos - 2;
        int pixel_x = 1 + (adjusted_pos >> 2);
        uint channel = adjusted_pos & 3u;
        float4 extra_pixel = data_texture.Load(int3(pixel_x, texel_y, 0));
        char_value = extract_channel(extra_pixel, channel);
    }

    result.char_index = (uint)(char_value * UINT16_MAX + TEXTURE_DATA_EPSILON);
    result.valid = (result.char_index != 0);

    return result;
}

// ============================================================================
// Layout System
// ============================================================================

struct LayoutResult
{
    float3 local_pos;
    float normalized_pos;
    float spacing_val;
};

inline LayoutResult calculate_layout(
    int char_pos,
    uint char_count,
    float spacing,
    int spacing_anchor,
    int mode)
{
    LayoutResult result;

    float spacing_val = 1.0 + spacing;
    float step = spacing_val * TEXT_GLYPH_SCALE;
    float total_length = (char_count - 1) * step;
    float base_total = (char_count - 1) * TEXT_GLYPH_SCALE;

    float start_pos;
    if (spacing_anchor == 1)
        start_pos = -base_total * 0.5;
    else if (spacing_anchor == 2)
        start_pos = base_total * 0.5 - total_length;
    else
        start_pos = -total_length * 0.5;

    float char_offset = start_pos + char_pos * step;

    result.local_pos = (mode == 2)
        ? float3(0, -char_offset, 0)
        : float3(char_offset, 0, 0);

    result.normalized_pos = (float)char_pos / max(char_count - 1, 1);
    result.spacing_val = spacing_val;

    return result;
}

inline float calculate_center_alignment(
    uint char_count,
    float spacing_val,
    int typewriter_type,
    int typewriter_mode,
    float typewriter_progress,
    float typewriter_center_smooth,
    int block_visible,
    int block_animating)
{
    float step = spacing_val * TEXT_GLYPH_SCALE;
    float total_length = (char_count - 1) * step;
    float start_pos = -total_length * 0.5;

    float visible_start_f, visible_end_f;

    if (typewriter_type == 0)
    {
        float progress_pos = typewriter_progress * (float)char_count;
        float discrete_end = ceil(progress_pos) - 1.0;
        float continuous_end = progress_pos - 1.0;
        float blended_end = lerp(discrete_end, continuous_end, typewriter_center_smooth);

        if (typewriter_mode == 2)
            return 0.0;
        else if (typewriter_mode == 1)
        {
            visible_end_f = (float)char_count - 1.0;
            visible_start_f = visible_end_f - blended_end;
        }
        else
        {
            visible_start_f = 0.0;
            visible_end_f = blended_end;
        }
    }
    else
    {
        visible_start_f = 0.0;
        float min_end = max((float)block_visible - 1.0, 0.0);
        float max_end = (float)(block_visible + block_animating) - 1.0;
        float continuous_end = lerp(min_end, max_end, typewriter_progress);
        float discrete_end = min_end + ceil((continuous_end - min_end));
        visible_end_f = lerp(discrete_end, continuous_end, typewriter_center_smooth);
    }

    visible_start_f = max(0.0, visible_start_f);
    visible_end_f = clamp(visible_end_f, 0.0, (float)char_count - 1.0);

    float visible_left = start_pos + visible_start_f * step;
    float visible_right = start_pos + visible_end_f * step;

    return -(visible_left + visible_right) * 0.5;
}

// ============================================================================
// Deformation System
// ============================================================================

struct TypewriterDeform
{
    float3 position_offset;
    float3 rotation;
};

inline TypewriterDeform calculate_typewriter_deform(
    float anim_factor,
    float4 typewriter_direction,
    float4 typewriter_rotation)
{
    TypewriterDeform result;
    result.position_offset = float3(0, 0, 0);
    result.rotation = float3(0, 0, 0);

    if (anim_factor > EPSILON)
    {
        float eased_factor = ease_out_cubic(anim_factor);

        if (dot(typewriter_rotation.xyz, typewriter_rotation.xyz) > EPSILON)
            result.rotation = typewriter_rotation.xyz * DEG2_RAD * eased_factor;

        result.position_offset = typewriter_direction.xyz * eased_factor * TEXT_GLYPH_SCALE;
    }

    return result;
}

// Note: CurveDeform, calculate_curve_deform, and calculate_shake_deform are in Effects.hlsl
// (depend on sample_baked_curve_3d and calculate_shake_offset which are defined there)

// ============================================================================
// Transform System
// ============================================================================

struct TransformData
{
    float3 translation;
    float3x3 rotation_scale;
    float3 pivot;
};

inline TransformData build_transform_unified(
    float4 position,
    float4 rotation,
    float4 scale,
    float4 pivot,
    float vr_scale,
    float pivot_scale)
{
    TransformData result;

    result.translation = position.xyz * CM_TO_METER_SCALE * vr_scale;
    result.pivot = pivot.xyz * pivot_scale;

    float3 scale_val = scale.xyz * vr_scale;
    float3x3 rot_matrix = has_rotation(rotation.xyz)
        ? rotation_matrix(rotation.xyz * DEG2_RAD)
        : IDENTITY_MATRIX3;
    result.rotation_scale = build_rotation_scale_matrix(rot_matrix, scale_val);

    return result;
}

inline float3 transform_to_world(float3 local_pos, TransformData transform)
{
    float3 pivot_local = local_pos - transform.pivot;
    return mul(transform.rotation_scale, pivot_local) + transform.translation;
}

inline float3 apply_root(
    float3 world_pos,
    int root_index,
    float3x3 root_matrix,
    float3 root_pos,
    float vr_scale)
{
    return apply_root_transform(world_pos, root_index, root_matrix, root_pos, vr_scale);
}

// ============================================================================
// Culling System
// ============================================================================

inline bool cull_object(
    float3 world_pos,
    int world_space,
    float dfc_enabled,
    float3 cam_pos,
    float3x3 cam_rot_inv,
    float tan_half_fov,
    float aspect,
    float margin)
{
    if (world_space == 0 || dfc_enabled > 0.5)
        return frustum_cull_screen(world_pos, margin, cam_pos, cam_rot_inv, tan_half_fov, aspect);
    return frustum_cull_world(world_pos, margin);
}

inline float calculate_margin_unified(float3 scale, float base_size)
{
    return base_size * max(scale.x, scale.y) * 2.0;
}

// ============================================================================
// Quad System
// ============================================================================

inline float3x3 build_char_rotation(
    float3 typewriter_rot,
    float curve_rot_z,
    float3x3 base_rotation_scale,
    int root_index,
    float3x3 root_matrix)
{
    float3 char_rotation = typewriter_rot + float3(0, 0, curve_rot_z);
    bool has_char_rot = has_rotation(char_rotation);

    float3x3 char_rot_matrix = has_char_rot
        ? rotation_matrix(char_rotation)
        : IDENTITY_MATRIX3;

    float3x3 char_rotation_scale = has_char_rot
        ? mul(base_rotation_scale, char_rot_matrix)
        : base_rotation_scale;

    if (root_index > 0)
        char_rotation_scale = mul(root_matrix, char_rotation_scale);

    return char_rotation_scale;
}

inline float3 expand_text_quad(
    float3 world_pos,
    float2 corner_uv,
    float3x3 char_rotation_scale,
    float3 typewriter_scale,
    float anim_factor,
    float quad_padding)
{
    float char_half_size = TEXT_GLYPH_SCALE * 0.5;
    float eased_factor = ease_out_cubic(anim_factor);
    float3 tw_scale = lerp(float3(1,1,1), typewriter_scale, eased_factor);

    float3 world_right = char_rotation_scale._m00_m10_m20 * (char_half_size * tw_scale.x * quad_padding);
    float3 world_up = char_rotation_scale._m01_m11_m21 * (char_half_size * tw_scale.y * quad_padding);

    float3 corner_offset = (corner_uv.x - 0.5) * 2.0 * world_right + (corner_uv.y - 0.5) * 2.0 * world_up;
    return world_pos + corner_offset;
}

inline float3 expand_image_quad(
    float3 world_pos,
    float2 corner_uv,
    float3x3 rotation_scale)
{
    float image_half_size = 0.05;

    float3 world_right = rotation_scale._m00_m10_m20 * image_half_size;
    float3 world_up = rotation_scale._m01_m11_m21 * image_half_size;

    float3 corner_offset = (corner_uv.x - 0.5) * 2.0 * world_right + (corner_uv.y - 0.5) * 2.0 * world_up;
    return world_pos + corner_offset;
}

inline float3 get_surface_normal(float3x3 rotation_scale)
{
    return rotation_scale._m02_m12_m22;
}

// ============================================================================
// Projection System
// ============================================================================

inline float4 project_vertex(
    float3 corner_world,
    int world_space,
    float3 cam_pos,
    float3x3 cam_rot_inv,
    float tan_half_fov,
    float aspect,
    int layer)
{
    if (world_space == 1)
        return project_world_space(mul(unity_ObjectToWorld, float4(corner_world, 1.0)).xyz);
    return project_custom_camera(corner_world, cam_pos, cam_rot_inv, tan_half_fov, aspect, layer);
}

inline float3 local_to_world(float3 local_pos)
{
    return mul(unity_ObjectToWorld, float4(local_pos, 1.0)).xyz;
}

inline float3 normal_to_world(float3 local_normal)
{
    return mul((float3x3)unity_ObjectToWorld, local_normal);
}

#endif // TYPOGRAPHY_SYSTEMS_INCLUDED
