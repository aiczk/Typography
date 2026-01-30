#ifndef TYPOGRAPHY_PROJECTION_SYSTEM_INCLUDED
#define TYPOGRAPHY_PROJECTION_SYSTEM_INCLUDED

// ============================================================================
// Projection System
// Handles screen-space and world-space projection
// ============================================================================

// Project world position to clip space
// Wraps existing projection functions from Core.hlsl
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
    {
        return project_world_space(mul(unity_ObjectToWorld, float4(corner_world, 1.0)).xyz);
    }
    return project_custom_camera(corner_world, cam_pos, cam_rot_inv, tan_half_fov, aspect, layer);
}

// Transform to world-space position (for world_space mode)
inline float3 local_to_world(float3 local_pos)
{
    return mul(unity_ObjectToWorld, float4(local_pos, 1.0)).xyz;
}

// Transform normal to world-space (for world_space mode)
inline float3 normal_to_world(float3 local_normal)
{
    return mul((float3x3)unity_ObjectToWorld, local_normal);
}

#endif // TYPOGRAPHY_PROJECTION_SYSTEM_INCLUDED
