#ifndef TYPOGRAPHY_QUAD_SYSTEM_INCLUDED
#define TYPOGRAPHY_QUAD_SYSTEM_INCLUDED

// ============================================================================
// Quad System
// Handles character rotation and quad expansion
// ============================================================================

// Build character rotation matrix with combined rotation
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
    {
        char_rotation_scale = mul(root_matrix, char_rotation_scale);
    }

    return char_rotation_scale;
}

// Expand quad corners for text
// Returns world-space corner position
inline float3 expand_text_quad(
    float3 world_pos,
    float2 corner_uv,
    float3x3 char_rotation_scale,
    float3 typewriter_scale,
    float anim_factor,
    float quad_padding)
{
    float char_half_size = TEXT_GLYPH_SCALE * 0.5;
    // Apply easing to scale animation for smooth size transition (After Effects style)
    float eased_factor = ease_out_cubic(anim_factor);
    float3 tw_scale = lerp(float3(1,1,1), typewriter_scale, eased_factor);

    float3 world_right = char_rotation_scale._m00_m10_m20 * (char_half_size * tw_scale.x * quad_padding);
    float3 world_up = char_rotation_scale._m01_m11_m21 * (char_half_size * tw_scale.y * quad_padding);

    float3 corner_offset = (corner_uv.x - 0.5) * 2.0 * world_right + (corner_uv.y - 0.5) * 2.0 * world_up;
    return world_pos + corner_offset;
}

// Expand quad corners for image
// Returns world-space corner position
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

// Get surface normal from rotation matrix (Z column)
inline float3 get_surface_normal(float3x3 rotation_scale)
{
    return rotation_scale._m02_m12_m22;
}

#endif // TYPOGRAPHY_QUAD_SYSTEM_INCLUDED
