#ifndef TYPOGRAPHY_CULLING_SYSTEM_INCLUDED
#define TYPOGRAPHY_CULLING_SYSTEM_INCLUDED

// ============================================================================
// Culling System
// Handles frustum culling for screen-space and world-space objects
// ============================================================================

// Frustum culling for screen-space text
// Returns true if object should be culled (not visible)
inline bool cull_screen_space(
    float3 world_pos,
    float3 cam_pos,
    float3x3 cam_rot_inv,
    float tan_half_fov,
    float aspect,
    float margin)
{
    return frustum_cull_screen(world_pos, margin, cam_pos, cam_rot_inv, tan_half_fov, aspect);
}

// Frustum culling for world-space text
// Returns true if object should be culled (not visible)
inline bool cull_world_space(
    float3 world_pos,
    float margin)
{
    return frustum_cull_world(world_pos, margin);
}

// Combined culling check (selects based on mode)
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
    // Screen-space mode or DFC enabled uses custom camera frustum
    if (world_space == 0 || dfc_enabled > 0.5)
    {
        return frustum_cull_screen(world_pos, margin, cam_pos, cam_rot_inv, tan_half_fov, aspect);
    }
    // World-space mode uses Unity VP matrix
    return frustum_cull_world(world_pos, margin);
}

// Calculate culling margin for text
inline float calculate_text_margin(float3 scale)
{
    float char_half_size = TEXT_GLYPH_SCALE * 0.5;
    return char_half_size * max(scale.x, scale.y) * 2.0;
}

// Calculate culling margin for image
inline float calculate_image_margin(float3 scale)
{
    float image_half_size = 0.05;
    return image_half_size * max(scale.x, scale.y) * 2.0;
}

#endif // TYPOGRAPHY_CULLING_SYSTEM_INCLUDED
