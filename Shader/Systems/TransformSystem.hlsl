#ifndef TYPOGRAPHY_TRANSFORM_SYSTEM_INCLUDED
#define TYPOGRAPHY_TRANSFORM_SYSTEM_INCLUDED

// ============================================================================
// Transform System
// Handles world transform and root transform application
// ============================================================================

// Transform components
struct TransformData
{
    float3 translation;
    float3x3 rotation_scale;
    float3 pivot;
};

// Build transform data from parameters
inline TransformData build_transform(
    float4 position,
    float4 rotation,
    float4 scale,
    float4 pivot,
    float vr_scale)
{
    TransformData result;

    result.translation = position.xyz * CM_TO_METER_SCALE * vr_scale;
    result.pivot = pivot.xyz * TEXT_GLYPH_SCALE;

    float3 scale_val = scale.xyz * vr_scale;
    float3x3 rot_matrix = has_rotation(rotation.xyz)
        ? rotation_matrix(rotation.xyz * DEG2_RAD)
        : IDENTITY_MATRIX3;
    result.rotation_scale = build_rotation_scale_matrix(rot_matrix, scale_val);

    return result;
}

// Build transform for images (different pivot scale)
inline TransformData build_image_transform(
    float4 position,
    float4 rotation,
    float4 scale,
    float4 pivot,
    float vr_scale)
{
    TransformData result;

    result.translation = position.xyz * CM_TO_METER_SCALE * vr_scale;
    result.pivot = pivot.xyz * 0.1;  // Image pivot scale

    float3 scale_val = scale.xyz * vr_scale;
    float3x3 rot_matrix = has_rotation(rotation.xyz)
        ? rotation_matrix(rotation.xyz * DEG2_RAD)
        : IDENTITY_MATRIX3;
    result.rotation_scale = build_rotation_scale_matrix(rot_matrix, scale_val);

    return result;
}

// Transform local position to world position
inline float3 transform_to_world(
    float3 local_pos,
    TransformData transform)
{
    float3 pivot_local = local_pos - transform.pivot;
    return mul(transform.rotation_scale, pivot_local) + transform.translation;
}

// Apply root transform (wraps existing function from Core.hlsl)
inline float3 apply_root(
    float3 world_pos,
    int root_index,
    float3x3 root_matrix,
    float3 root_pos,
    float vr_scale)
{
    return apply_root_transform(world_pos, root_index, root_matrix, root_pos, vr_scale);
}

// Get cached root transform data
// Note: This is a wrapper around GET_ROOT_TRANSFORM macro
// Usage: Call GET_ROOT_TRANSFORM macro first, then pass results to apply_root

#endif // TYPOGRAPHY_TRANSFORM_SYSTEM_INCLUDED
