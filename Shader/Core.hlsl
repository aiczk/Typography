#ifndef TYPOGRAPHY_CORE_INCLUDED
#define TYPOGRAPHY_CORE_INCLUDED

// Include centralized constants and noise functions
#include "Constants.hlsl"
#include "Noise.hlsl"

static const float3x3 IDENTITY_MATRIX3 = float3x3(1,0,0, 0,1,0, 0,0,1);

// Layer index lookup texture for Image pass (32x2, RG16 format)
// Value 255 = no texture assigned, 0-254 = layer index
Texture2D<float2> _TextureLayerLUT;

// Get texture layer index for Image pass
// Returns -1 if no texture assigned
inline int GetTextureLayerIndex(uint slot_id, uint texture_type)
{
    float2 value = _TextureLayerLUT.Load(int3(slot_id, 0, 0));
    int layer = (int)(value.r * 255.0);
    return layer >= 255 ? -1 : layer;
}

// ============================================================================
// VRChat Shader Globals
// ============================================================================
// _VRChatMirrorMode: 0=None, 1=VR Mirror, 2=Desktop Mirror
uniform float _VRChatMirrorMode;

// ============================================================================
// Shared Structures
// ============================================================================
struct appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;      // char_index (x), text_id/image_id (y)
    float2 uv2 : TEXCOORD1;     // glyph_uv (corner)
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

// ============================================================================
// Pack/Unpack Helpers (GPU Native Instructions)
// ============================================================================

// Pack two floats into uint using f16 (native GPU instruction, ~1 cycle each)
inline uint pack_f16x2(float a, float b)
{
    return f32tof16(a) | (f32tof16(b) << 16);
}

// Unpack uint to two floats using f16 (native GPU instruction)
inline float2 unpack_f16x2(uint packed)
{
    return float2(f16tof32(packed), f16tof32(packed >> 16));
}

// Pack float4 into uint2 using f16
inline uint2 pack_f16x4(float4 v)
{
    return uint2(
        f32tof16(v.x) | (f32tof16(v.y) << 16),
        f32tof16(v.z) | (f32tof16(v.w) << 16)
    );
}

// Unpack uint2 to float4 using f16
inline float4 unpack_f16x4(uint2 packed)
{
    return float4(
        f16tof32(packed.x), f16tof32(packed.x >> 16),
        f16tof32(packed.y), f16tof32(packed.y >> 16)
    );
}

// Extract channel from float4 by index (branchless-friendly)
inline float extract_channel(float4 pixel, uint channel)
{
    return (channel == 0u) ? pixel.r :
           (channel == 1u) ? pixel.g :
           (channel == 2u) ? pixel.b : pixel.a;
}

// ============================================================================
// MSDF Functions
// ============================================================================
inline half median(half3 rgb)
{
    return max(min(rgb.r, rgb.g), min(max(rgb.r, rgb.g), rgb.b));
}

// Linear step function (Chlumsky's method for screen-independent edges)
inline float linearStep(float a, float b, float x)
{
    return saturate((x - a) / (b - a));
}

// Optimized symmetric linear step: linearStep(-halfWidth, halfWidth, x)
// Avoids division by using rcp and MAD
inline float linearStepSymmetric(float halfWidth, float x)
{
    return saturate(x * (0.5 * rcp(halfWidth)) + 0.5);
}

// ============================================================================
// Easing Functions (After Effects style)
// ============================================================================

// Smooth ease-in-out (Hermite interpolation)
inline float ease_smooth(float t)
{
    return t * t * (3.0 - 2.0 * t);
}

// Ease out cubic (deceleration)
inline float ease_out_cubic(float t)
{
    float f = 1.0 - t;
    return 1.0 - f * f * f;
}

// Gaussian falloff for smooth range transitions (After Effects "Smooth" shape)
// distance: signed distance from center of transition
// width: falloff width (sigma-like parameter)
inline float gaussian_falloff(float distance, float width)
{
    float normalized = distance / max(width, EPSILON);
    return exp(-normalized * normalized * 2.0);
}

// Smooth range selector (After Effects style)
// Returns 0-1 opacity based on position in range with smooth falloff
// position: current position (e.g., char_pos / char_count)
// range_start: where full opacity begins (0-1)
// range_end: where full opacity ends (0-1)
// falloff: width of smooth transition (0 = hard edge, 1 = full smooth)
inline float smooth_range_selector(float position, float range_start, float range_end, float falloff)
{
    if (falloff <= EPSILON)
    {
        // Hard edge
        return (position >= range_start && position <= range_end) ? 1.0 : 0.0;
    }

    float half_falloff = falloff * 0.5;

    // Smooth transition at start edge
    float start_fade = saturate((position - range_start + half_falloff) / falloff);

    // Smooth transition at end edge
    float end_fade = saturate((range_end - position + half_falloff) / falloff);

    // Apply easing for smoother result
    return ease_smooth(start_fade) * ease_smooth(end_fade);
}

// Fast version with pre-computed inverse: half_inv = 0.5 * rcp(halfWidth)
// Saves 4-6 cycles by eliminating rcp() call
inline float linearStepSymmetric_fast(float x, float half_inv)
{
    return saturate(x * half_inv + 0.5);
}

// ============================================================================
// Transform Functions
// ============================================================================

// Unity-compatible rotation matrix (ZXY intrinsic order)
float3x3 rotation_matrix(float3 rotation)
{
    float sx, cx, sy, cy, sz, cz;
    sincos(rotation.x, sx, cx);
    sincos(rotation.y, sy, cy);
    sincos(rotation.z, sz, cz);
    // R = Ry * Rx * Rz (applies as Z -> X -> Y)
    return float3x3(
        cy * cz + sy * sx * sz,  -cy * sz + sy * sx * cz, sy * cx,
        cx * sz,                  cx * cz,                -sx,
        -sy * cz + cy * sx * sz,  sy * sz + cy * sx * cz, cy * cx
    );
}

// Robust rotation detection using dot product
inline bool has_rotation(float3 rotation_vector)
{
    return dot(rotation_vector, rotation_vector) > EPSILON;
}

// Combine rotation matrix with non-uniform scale: rotation * diag(scale)
inline float3x3 build_rotation_scale_matrix(float3x3 rot, float3 scale)
{
    return float3x3(
        rot._m00 * scale.x, rot._m01 * scale.y, rot._m02 * scale.z,
        rot._m10 * scale.x, rot._m11 * scale.y, rot._m12 * scale.z,
        rot._m20 * scale.x, rot._m21 * scale.y, rot._m22 * scale.z);
}

inline float3 get_camera_position()
{
    #if UNITY_SINGLE_PASS_STEREO
        return (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
    #else
        return _WorldSpaceCameraPos;
    #endif
}

inline bool is_vr()
{
    #if defined(UNITY_SINGLE_PASS_STEREO) || defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
        return true;
    #else
        return _VRChatMirrorMode == 1.0;
    #endif
}

// Screen aspect ratio (VR SPI corrected)
inline float get_screen_aspect()
{
    return _ScreenParams.x / _ScreenParams.y;
}


// Apply VR eye offset to custom camera position for correct stereo parallax
inline float3 apply_vr_eye_offset(float3 custom_cam_pos)
{
    #if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
        float3 head_center = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
        float3 eye_pos = unity_StereoWorldSpaceCameraPos[unity_StereoEyeIndex];
        float3 eye_offset = eye_pos - head_center;
        return custom_cam_pos + eye_offset;
    #else
        return custom_cam_pos;
    #endif
}

// ============================================================================
// Root Transform Functions
// ============================================================================

// Root transform uniform declarations (must be declared in shader)
// float4 _RootPosition0-4, _RootMatrix0-4_Row0/1/2

// Get root transform by index (0 = no root, 1-5 = root 0-4)
// Returns identity if root_index == 0
#define GET_ROOT_TRANSFORM(root_index, root_matrix, root_pos) \
{ \
    [branch] switch(root_index) { \
        case 1: root_matrix = float3x3(_RootMatrix0_Row0.xyz, _RootMatrix0_Row1.xyz, _RootMatrix0_Row2.xyz); root_pos = _RootPosition0.xyz; break; \
        case 2: root_matrix = float3x3(_RootMatrix1_Row0.xyz, _RootMatrix1_Row1.xyz, _RootMatrix1_Row2.xyz); root_pos = _RootPosition1.xyz; break; \
        case 3: root_matrix = float3x3(_RootMatrix2_Row0.xyz, _RootMatrix2_Row1.xyz, _RootMatrix2_Row2.xyz); root_pos = _RootPosition2.xyz; break; \
        case 4: root_matrix = float3x3(_RootMatrix3_Row0.xyz, _RootMatrix3_Row1.xyz, _RootMatrix3_Row2.xyz); root_pos = _RootPosition3.xyz; break; \
        case 5: root_matrix = float3x3(_RootMatrix4_Row0.xyz, _RootMatrix4_Row1.xyz, _RootMatrix4_Row2.xyz); root_pos = _RootPosition4.xyz; break; \
        default: root_matrix = IDENTITY_MATRIX3; root_pos = float3(0,0,0); break; \
    } \
}

// Apply root transform to position (branchless: identity matrix returns pos unchanged)
inline float3 apply_root_transform(float3 local_pos, int root_index, float3x3 root_matrix, float3 root_pos)
{
    return mul(root_matrix, local_pos) + root_pos * CM_TO_METER_SCALE;
}

// ============================================================================
// Frustum Culling Functions
// ============================================================================

// Screen space frustum culling (custom camera)
// Returns true if should be culled (behind camera or outside frustum)
// cam_rot_inv: pre-transposed camera rotation matrix
inline bool frustum_cull_screen(float3 world_pos, float margin,
    float3 cam_pos, float3x3 cam_rot_inv, float tan_half_fov, float aspect)
{
    float3 relative = world_pos - cam_pos;
    float3 view = mul(cam_rot_inv, relative);
    view.yz = -view.yz;

    // Behind camera
    if (view.z >= -EPSILON) return true;

    // Outside frustum
    float depth = -view.z;
    float frustum_w = tan_half_fov * aspect * depth + margin;
    float frustum_h = tan_half_fov * depth + margin;

    return abs(view.x) > frustum_w || abs(view.y) > frustum_h;
}

// World space frustum culling (Unity VP matrix)
// Returns true if should be culled
inline bool frustum_cull_world(float3 world_pos, float margin)
{
    float4 clip = mul(UNITY_MATRIX_VP, float4(world_pos, 1.0));
    float w = clip.w + margin;
    return clip.x < -w || clip.x > w || clip.y < -w || clip.y > w
        || clip.z < -margin || clip.z > w;
}

// ============================================================================
// Projection Functions
// ============================================================================

// World space projection with depth remapped behind screen space
float4 project_world_space(float3 world_pos)
{
    float4 clip = mul(UNITY_MATRIX_VP, float4(world_pos, 1.0));
    float ndc_z = clip.z / clip.w;
    #if defined(UNITY_REVERSED_Z)
        // Reversed-Z: remap from [1,0] to [0.95, 0] (behind screen space)
        float remapped_z = ndc_z * (1.0 - WORLD_SPACE_DEPTH_MIN);
    #else
        // Standard Z: remap from [0,1] to [0.05, 1.0] (behind screen space)
        float remapped_z = lerp(WORLD_SPACE_DEPTH_MIN, 1.0, ndc_z);
    #endif
    return float4(clip.xy, remapped_z * clip.w, clip.w);
}

// Custom camera projection (standard camera coordinates: Z- forward, Y+ up)
// cam_rot_inv: pre-transposed camera rotation matrix (avoids redundant transpose)
float4 project_custom_camera(float3 world_pos, float3 cam_pos, float3x3 cam_rot_inv, float tan_half_fov, float aspect, int layer)
{
    float3 relative = world_pos - cam_pos;
    float3 view_pos = mul(cam_rot_inv, relative);
    view_pos.yz = -view_pos.yz;  // Convert to standard camera coords
    if (view_pos.z >= -EPSILON)  // After flip, z < 0 is in front
        return float4(0, 0, -1, 1);
    float w = -view_pos.z;  // Positive w for depth
    float2 clip;
    clip.x = view_pos.x / (tan_half_fov * aspect);
    clip.y = view_pos.y / tan_half_fov;

    float depth;
    if (layer == 0)
    {
        // Layer 0: Perspective projection depth compressed to front range [0, 0.05]
        float near = 0.01;
        float far = 1000.0;
        float ndc_z = (far + near - 2.0 * near * far / w) / (far - near);
        float linear_depth = (0.5 + ndc_z * 0.5) * SCREEN_SPACE_DEPTH_MAX;
        #if defined(UNITY_REVERSED_Z)
            depth = 1.0 - linear_depth;
        #else
            depth = linear_depth;
        #endif
    }
    else
    {
        // Layer 1+: Fixed layer-based depth ordering
        float layer_depth = layer / 32.0 * SCREEN_SPACE_DEPTH_MAX;
        #if defined(UNITY_REVERSED_Z)
            depth = 1.0 - layer_depth;
        #else
            depth = layer_depth;
        #endif
    }
    return float4(clip.x, clip.y, depth * w, w);
}

#endif // TYPOGRAPHY_DEV_CORE_INCLUDED
