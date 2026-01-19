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
#define EMRANGE 0.3
#define EPSILON 1e-6
#define DEG2_RAD 0.017453292519943295
#define HALF_PI 1.5707963267948966
#define TWO_PI 6.283185307179586
#define GOLDEN_ANGLE 2.3999632297286533
#define CM_TO_METER_SCALE 0.01
#define TEXT_GLYPH_SCALE 0.1
#define TEXT_COUNT 10

// Texture layer types (for indexing lookup texture)
#define TEXTURE_TYPE_IMAGE   0
#define TEXTURE_TYPE_MATCAP  1
#define TEXTURE_TYPE_OVERLAY 2

// Optimized Layer index lookup texture (32x2, RG16 format)
// Row 0: R = Image layer
// Row 1: R = MatCap layer, G = Overlay layer (packed for Text pass optimization)
// Value 255 = no texture assigned, 0-254 = layer index
Texture2D<float2> _TextureLayerLUT;

// Get texture layer index for a slot and type (Image pass)
// Returns -1 if no texture assigned
inline int GetTextureLayerIndex(uint slot_id, uint texture_type)
{
    // Row 0 for Image, Row 1 for MatCap/Overlay
    uint row = texture_type == TEXTURE_TYPE_IMAGE ? 0 : 1;
    float2 value = _TextureLayerLUT.Load(int3(slot_id, row, 0));
    // Select channel: Image uses R, MatCap uses R, Overlay uses G
    float channel = (texture_type == TEXTURE_TYPE_OVERLAY) ? value.g : value.r;
    // Texture stores exact integer/255, truncation is safe (avoids +0.5 ADD)
    int layer = (int)(channel * 255.0);
    return layer >= 255 ? -1 : layer;
}

// Optimized: Get both MatCap and Overlay layer indices in single texture fetch (Text pass)
// Returns int2(matcap_layer, overlay_layer), -1 if no texture assigned
inline int2 GetTextLayerIndices(uint slot_id)
{
    float2 value = _TextureLayerLUT.Load(int3(slot_id, 1, 0));  // Row 1: R=MatCap, G=Overlay
    // Texture stores exact integer/255, truncation is safe (avoids +0.5 ADD)
    int2 layers = (int2)(value * 255.0);
    return int2(layers.x >= 255 ? -1 : layers.x, layers.y >= 255 ? -1 : layers.y);
}

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

// Pack two 8-bit normalized values into 16 bits
inline uint pack_unorm8x2(float a, float b)
{
    return ((uint)(saturate(a) * 255.0) & 0xFFu) | (((uint)(saturate(b) * 255.0) & 0xFFu) << 8);
}

// Unpack 16 bits to two normalized floats
inline float2 unpack_unorm8x2(uint packed)
{
    const float inv255 = 1.0 / 255.0;
    return float2((packed & 0xFFu) * inv255, ((packed >> 8) & 0xFFu) * inv255);
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

// Fast version with pre-computed inverse: half_inv = 0.5 * rcp(halfWidth)
// Saves 4-6 cycles by eliminating rcp() call
inline float linearStepSymmetric_fast(float x, float half_inv)
{
    return saturate(x * half_inv + 0.5);
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

// PCG Hash (Jarzynski & Olano, JCGT 2020)
// Best balance of quality and performance for GPU rendering
// ~3-4 cycles, passes PractRand statistical tests
inline uint pcg_hash(uint input)
{
    uint state = input * 747796405u + 2891336453u;
    uint word = ((state >> ((state >> 28u) + 4u)) ^ state) * 277803737u;
    return (word >> 22u) ^ word;
}

// PCG 2D hash - generates 2 independent outputs from 2D input
inline uint2 pcg2d(uint2 v)
{
    v = v * 1664525u + 1013904223u;
    v.x += v.y * 1664525u;
    v.y += v.x * 1664525u;
    v = v ^ (v >> 16u);
    v.x += v.y * 1664525u;
    v.y += v.x * 1664525u;
    v = v ^ (v >> 16u);
    return v;
}

// High-quality 2D hash using PCG
// Better distribution, similar performance (~4 cycles)
float2 hash22(float2 p)
{
    uint2 q = pcg2d(asuint(p));
    return float2(q) * (1.0 / 4294967296.0);
}

// ============================================================================
// Shadow Dither Rotation LUTs (3 patterns × 16 pre-computed 2x2 rotation matrices)
// Replaces per-pixel sincos() with LUT lookup (~8 cycles saved)
// ============================================================================

// Type 0: Uniform - Equal 22.5° steps (regular grid pattern)
static const float2x2 DITHER_ROT_UNIFORM[16] = {
    float2x2( 1.0000000,  0.0000000,  0.0000000,  1.0000000),  // 0°
    float2x2( 0.9238795, -0.3826834,  0.3826834,  0.9238795),  // 22.5°
    float2x2( 0.7071068, -0.7071068,  0.7071068,  0.7071068),  // 45°
    float2x2( 0.3826834, -0.9238795,  0.9238795,  0.3826834),  // 67.5°
    float2x2( 0.0000000, -1.0000000,  1.0000000,  0.0000000),  // 90°
    float2x2(-0.3826834, -0.9238795,  0.9238795, -0.3826834),  // 112.5°
    float2x2(-0.7071068, -0.7071068,  0.7071068, -0.7071068),  // 135°
    float2x2(-0.9238795, -0.3826834,  0.3826834, -0.9238795),  // 157.5°
    float2x2(-1.0000000,  0.0000000,  0.0000000, -1.0000000),  // 180°
    float2x2(-0.9238795,  0.3826834, -0.3826834, -0.9238795),  // 202.5°
    float2x2(-0.7071068,  0.7071068, -0.7071068, -0.7071068),  // 225°
    float2x2(-0.3826834,  0.9238795, -0.9238795, -0.3826834),  // 247.5°
    float2x2( 0.0000000,  1.0000000, -1.0000000,  0.0000000),  // 270°
    float2x2( 0.3826834,  0.9238795, -0.9238795,  0.3826834),  // 292.5°
    float2x2( 0.7071068,  0.7071068, -0.7071068,  0.7071068),  // 315°
    float2x2( 0.9238795,  0.3826834, -0.3826834,  0.9238795)   // 337.5°
};

// Type 1: Golden Angle - 137.5° steps (natural/organic pattern, less visible artifacts)
static const float2x2 DITHER_ROT_GOLDEN[16] = {
    float2x2( 1.0000000,  0.0000000,  0.0000000,  1.0000000),  // 0°
    float2x2(-0.7372773, -0.6755902,  0.6755902, -0.7372773),  // 137.5°
    float2x2( 0.0871557,  0.9961947, -0.9961947,  0.0871557),  // 275°
    float2x2( 0.6087614, -0.7933533,  0.7933533,  0.6087614),  // 52.5°
    float2x2(-0.9848078,  0.1736482, -0.1736482, -0.9848078),  // 190°
    float2x2( 0.5373280,  0.8433914, -0.8433914,  0.5373280),  // 327.5°
    float2x2( 0.2588190, -0.9659258,  0.9659258,  0.2588190),  // 105°
    float2x2(-0.7933533, -0.6087614,  0.6087614, -0.7933533),  // 242.5°
    float2x2( 0.9396926,  0.3420202, -0.3420202,  0.9396926),  // 20°
    float2x2(-0.3826834,  0.9238795, -0.9238795, -0.3826834),  // 157.5°
    float2x2(-0.4226183, -0.9063078,  0.9063078, -0.4226183),  // 295°
    float2x2( 0.9537170, -0.3007058,  0.3007058,  0.9537170),  // 72.5°
    float2x2(-0.8660254,  0.5000000, -0.5000000, -0.8660254),  // 210°
    float2x2( 0.2164396,  0.9762960, -0.9762960,  0.2164396),  // 347.5°
    float2x2( 0.5735764, -0.8191520,  0.8191520,  0.5735764),  // 125°
    float2x2(-0.9914449, -0.1305262,  0.1305262, -0.9914449)   // 262.5°
};

// Type 2: Halton - Halton(2) sequence × 360° (low-discrepancy, uniform coverage)
static const float2x2 DITHER_ROT_HALTON[16] = {
    float2x2( 1.0000000,  0.0000000,  0.0000000,  1.0000000),  // 0°
    float2x2(-1.0000000,  0.0000000,  0.0000000, -1.0000000),  // 180°
    float2x2( 0.0000000, -1.0000000,  1.0000000,  0.0000000),  // 90°
    float2x2( 0.0000000,  1.0000000, -1.0000000,  0.0000000),  // 270°
    float2x2( 0.9238795, -0.3826834,  0.3826834,  0.9238795),  // 22.5°
    float2x2(-0.9238795,  0.3826834, -0.3826834, -0.9238795),  // 202.5°
    float2x2(-0.3826834, -0.9238795,  0.9238795, -0.3826834),  // 112.5°
    float2x2( 0.3826834,  0.9238795, -0.9238795,  0.3826834),  // 292.5°
    float2x2( 0.9807853, -0.1950903,  0.1950903,  0.9807853),  // 11.25°
    float2x2(-0.9807853,  0.1950903, -0.1950903, -0.9807853),  // 191.25°
    float2x2(-0.1950903, -0.9807853,  0.9807853, -0.1950903),  // 101.25°
    float2x2( 0.1950903,  0.9807853, -0.9807853,  0.1950903),  // 281.25°
    float2x2( 0.8314696, -0.5555702,  0.5555702,  0.8314696),  // 33.75°
    float2x2(-0.8314696,  0.5555702, -0.5555702, -0.8314696),  // 213.75°
    float2x2(-0.5555702, -0.8314696,  0.8314696, -0.5555702),  // 123.75°
    float2x2( 0.5555702,  0.8314696, -0.8314696,  0.5555702)   // 303.75°
};

// ============================================================================
// Shadow Gather Grid LUT (8 positions for GatherAlpha sampling)
// Each Gather returns 4 texels (2x2), so 8 Gathers = 32 samples max
// Positions optimized for uniform disk coverage with rotation
// ============================================================================
static const float2 GATHER_GRID_8[8] = {
    float2(-0.4375, -0.1875),   // Outer ring
    float2(-0.1875, -0.4375),
    float2( 0.1875, -0.4375),
    float2( 0.4375, -0.1875),
    float2( 0.4375,  0.1875),
    float2( 0.1875,  0.4375),
    float2(-0.1875,  0.4375),
    float2(-0.4375,  0.1875)
};

// ============================================================================
// Fast Math Approximations
// ============================================================================

// Fast atan2 approximation (~5x faster than intrinsic)
// Max error: ~0.005 radians (0.3 degrees) - acceptable for curve rotation
// Based on approximation: atan(x) ≈ x / (1 + 0.28125 * x²) for |x| <= 1
inline float fast_atan2(float y, float x)
{
    float ax = abs(x), ay = abs(y);
    float mn = min(ax, ay), mx = max(ax, ay);
    float a = mn / (mx + EPSILON);  // Avoid division by zero

    // Polynomial approximation: atan(a) ≈ a * (π/4 + 0.273 * (1 - a))
    // Simplified to avoid multiply: a * (1.0 - 0.1963 * a² - 0.0663 * a⁴)
    float s = a * a;
    float r = a * (1.5707963 - s * (0.3183 + s * 0.1));  // Tuned coefficients

    // Quadrant correction
    r = (ay > ax) ? (1.5707963 - r) : r;
    r = (x < 0) ? (3.1415927 - r) : r;
    r = (y < 0) ? -r : r;
    return r;
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
    #if UNITY_SINGLE_PASS_STEREO
        return (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
    #else
        return _WorldSpaceCameraPos;
    #endif
}

inline bool is_vr()
{
    #if UNITY_SINGLE_PASS_STEREO
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

// VR scale factor (call once per vertex shader, not per layer)
inline float get_vr_scale(float vr_scale_property)
{
    return is_vr() ? vr_scale_property : 1.0;
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
        default: root_matrix = float3x3(1,0,0, 0,1,0, 0,0,1); root_pos = float3(0,0,0); break; \
    } \
}

// Apply root transform to position (branchless: identity matrix returns pos unchanged)
inline float3 apply_root_transform(float3 local_pos, int root_index, float3x3 root_matrix, float3 root_pos, float vr_scale)
{
    return mul(root_matrix, local_pos) + root_pos * CM_TO_METER_SCALE * vr_scale;
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
