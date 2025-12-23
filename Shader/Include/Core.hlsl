#ifndef TYPOGRAPHY_CORE_INCLUDED
#define TYPOGRAPHY_CORE_INCLUDED

// ============================================================================
// Constants
// ============================================================================
#define UINT16_MAX 65535.0
#define TEXTURE_DATA_EPSILON 0.5
#define ATLAS_UV_INNER_SCALE 0.9375
#define ATLAS_UV_MARGIN 0.03125
#define ATLAS_TEXTURE_SIZE 4096.0
#define MSDF_FIXED_DYNAMIC_RANGE 2.0
#define EPSILON 1e-6
#define DEG2RAD 0.017453292519943295
#define HALF_PI 1.5707963267948966
#define TWO_PI 6.283185307179586
#define GOLDEN_ANGLE 2.3999632297286533
#define CM_TO_METER_SCALE 0.01
#define TEXT_GLYPH_SCALE 0.1
#define TEXT_COUNT 32

// Depth range constants for screen/world space separation
#define SCREEN_SPACE_DEPTH_MAX 0.05
#define WORLD_SPACE_DEPTH_MIN 0.05

#define TYPEWRITER_LTR 0
#define TYPEWRITER_RTL 1
#define TYPEWRITER_CENTER_OUT 2

// ============================================================================
// VRChat Shader Globals
// ============================================================================
// _VRChatMirrorMode: 0=None, 1=VR Mirror, 2=Desktop Mirror
uniform float _VRChatMirrorMode;

// ============================================================================
// Structures
// ============================================================================
struct appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;      // char_index (x), text_id (y)
    float2 uv2 : TEXCOORD1;     // glyph_uv (corner)
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct v2f
{
    float4 vertex : SV_POSITION;
    float2 glyph_uv : TEXCOORD0;
    nointerpolation uint char_index : TEXCOORD1;
    nointerpolation uint packed_info : TEXCOORD2;   // font_index:8, dither:8, samples:8, gradient_mode:2, outline_mode:1, reserved:5
    nointerpolation float4 anim_params : TEXCOORD3; // x=anim_factor, y=shake.x, z=shake.y, w=fade
    nointerpolation float2 quad_block : TEXCOORD4;  // x=quad_padding, y=block_fade
    nointerpolation float4 text_color : TEXCOORD5;
    nointerpolation float4 outline : TEXCOORD6;     // width, color.rgb
    nointerpolation float4 shadow : TEXCOORD7;      // intensity, offset.xy, softness
    nointerpolation float4 shadow_color : TEXCOORD8; // color.rgb, outline_alpha
    nointerpolation float4 gradient : TEXCOORD9;    // rgb=ColorB, a=intensity
    UNITY_VERTEX_OUTPUT_STEREO
};

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
// Noise Functions
// ============================================================================

// Interleaved Gradient Noise (Jorge Jimenez, 2014)
// Produces diagonal hatching pattern, optimized for TAA
float InterleavedGradientNoise(float2 screen_pos)
{
    return frac(52.9829189 * frac(dot(screen_pos, float2(0.06711056, 0.00583715))));
}

// R2 Sequence (Martin Roberts, 2018)
// Low-discrepancy sequence with blue noise-like uniform distribution
// No visible patterns, organic appearance
float R2Noise(float2 screen_pos)
{
    const float2 alpha = float2(0.7548776662466927, 0.5698402909980532);
    return frac(dot(screen_pos, alpha));
}

// Integer-based hash / White noise (no sin() for better ALU performance)
float2 hash22(float2 p)
{
    uint2 q = uint2(int2(p) * int2(1597334677, 3812015801));
    q = (q.x ^ q.y) * uint2(1597334677, 3812015801);
    return float2(q) * (1.0 / 4294967296.0);
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

inline float3 get_camera_position()
{
    #if defined(USING_STEREO_MATRICES)
        return (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
    #else
        return _WorldSpaceCameraPos;
    #endif
}

inline bool is_vr()
{
    #if defined(USING_STEREO_MATRICES)
        return true;
    #else
        return _VRChatMirrorMode == 1.0;
    #endif
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
float4 project_custom_camera(float3 world_pos, float3 cam_pos, float3x3 cam_rot, float tan_half_fov, float aspect, int layer)
{
    float3 relative = world_pos - cam_pos;
    float3 view_pos = mul(transpose(cam_rot), relative);
    view_pos.yz = -view_pos.yz;  // Convert to standard camera coords
    if (view_pos.z >= -EPSILON)  // After flip, z < 0 is in front
        return float4(0, 0, -1, 1);
    float w = -view_pos.z;  // Positive w for depth
    float2 clip;
    clip.x = view_pos.x / (tan_half_fov * aspect);
    clip.y = view_pos.y / tan_half_fov;
    float layer_depth = (layer + 0.5) / 32.0 * SCREEN_SPACE_DEPTH_MAX;
    #if defined(UNITY_REVERSED_Z)
        float depth = 1.0 - layer_depth;
    #else
        float depth = layer_depth;
    #endif
    return float4(clip.x, clip.y, depth * w, w);
}

#endif // TYPOGRAPHY_CORE_INCLUDED
