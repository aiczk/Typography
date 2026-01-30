#ifndef TYPOGRAPHY_DEFORMATION_SYSTEM_INCLUDED
#define TYPOGRAPHY_DEFORMATION_SYSTEM_INCLUDED

// ============================================================================
// Deformation System
// Handles typewriter, curve, and shake deformations
// ============================================================================

// Typewriter deformation result
struct TypewriterDeform
{
    float3 position_offset;
    float3 rotation;
};

// Calculate typewriter position and rotation offset
// Uses eased anim_factor for smoother motion (After Effects style)
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
        // Apply easing to anim_factor for smooth deceleration
        // Characters "glide" into place rather than moving linearly
        float eased_factor = ease_out_cubic(anim_factor);

        if (dot(typewriter_rotation.xyz, typewriter_rotation.xyz) > EPSILON)
        {
            result.rotation = typewriter_rotation.xyz * DEG2_RAD * eased_factor;
        }
        result.position_offset = typewriter_direction.xyz * eased_factor * TEXT_GLYPH_SCALE;
    }

    return result;
}

// Curve deformation result
struct CurveDeform
{
    float3 position_offset;
    float rotation_z;
};

// Calculate curve deformation
// Requires curve sampling functions from Effects.hlsl
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

// Calculate shake offset
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

#endif // TYPOGRAPHY_DEFORMATION_SYSTEM_INCLUDED
