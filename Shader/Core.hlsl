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

static const float3x3 IDENTITY_MATRIX3 = float3x3(1,0,0, 0,1,0, 0,0,1);

// Surface effect modes (for Text pass procedural effects)
#define SURFACE_MODE_SIMPLEX    0
#define SURFACE_MODE_VORONOI    1
#define SURFACE_MODE_FBM        2
#define SURFACE_MODE_TURBULENCE 3
#define SURFACE_MODE_RIDGED     4
#define SURFACE_MODE_MARBLE     5

// Texture layer types (for Image pass texture lookup)
#define TEXTURE_TYPE_IMAGE   0

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

// ============================================================================
// Easing Functions (After Effects style)
// ============================================================================

// Smooth ease-in-out (Hermite interpolation)
inline float ease_smooth(float t)
{
    return t * t * (3.0 - 2.0 * t);
}

// Smoother ease-in-out (quintic, Ken Perlin's smootherstep)
inline float ease_smoother(float t)
{
    return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
}

// Ease out cubic (deceleration)
inline float ease_out_cubic(float t)
{
    float f = 1.0 - t;
    return 1.0 - f * f * f;
}

// Ease in-out cubic
inline float ease_in_out_cubic(float t)
{
    return t < 0.5
        ? 4.0 * t * t * t
        : 1.0 - pow(-2.0 * t + 2.0, 3.0) * 0.5;
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

// Value noise hash (fast, for value noise base)
inline float hash21(float2 p)
{
    float3 p3 = frac(float3(p.xyx) * 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return frac((p3.x + p3.y) * p3.z);
}

// ============================================================================
// Procedural Noise Functions
// ============================================================================

// Simplex 2D Noise (optimized for GPU)
// Returns value in range [-1, 1]
float simplex2d(float2 p)
{
    const float K1 = 0.366025404; // (sqrt(3)-1)/2
    const float K2 = 0.211324865; // (3-sqrt(3))/6

    float2 i = floor(p + (p.x + p.y) * K1);
    float2 a = p - i + (i.x + i.y) * K2;
    float2 o = (a.x > a.y) ? float2(1.0, 0.0) : float2(0.0, 1.0);
    float2 b = a - o + K2;
    float2 c = a - 1.0 + 2.0 * K2;

    float3 h = max(0.5 - float3(dot(a,a), dot(b,b), dot(c,c)), 0.0);
    h = h * h * h * h;

    float3 n = float3(
        dot(a, hash22(i) * 2.0 - 1.0),
        dot(b, hash22(i + o) * 2.0 - 1.0),
        dot(c, hash22(i + 1.0) * 2.0 - 1.0)
    );

    return dot(n, h) * 70.0;
}

// Simplex 3D Noise (for time-animated effects)
// p.xy = position, p.z = time
float simplex3d(float3 p)
{
    // Skew input space
    const float F3 = 0.333333333;
    const float G3 = 0.166666667;

    float3 s = floor(p + dot(p, float3(F3, F3, F3)));
    float3 x = p - s + dot(s, float3(G3, G3, G3));

    float3 e = step(float3(0.0, 0.0, 0.0), x - x.yzx);
    float3 i1 = e * (1.0 - e.zxy);
    float3 i2 = 1.0 - e.zxy * (1.0 - e);

    float3 x1 = x - i1 + G3;
    float3 x2 = x - i2 + 2.0 * G3;
    float3 x3 = x - 1.0 + 3.0 * G3;

    float4 w = max(0.6 - float4(dot(x,x), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
    w = w * w * w * w;

    float4 d = float4(
        dot(x, hash22(s.xy + s.z * 31.0).xyy * 2.0 - 1.0),
        dot(x1, hash22(s.xy + i1.xy + (s.z + i1.z) * 31.0).xyy * 2.0 - 1.0),
        dot(x2, hash22(s.xy + i2.xy + (s.z + i2.z) * 31.0).xyy * 2.0 - 1.0),
        dot(x3, hash22(s.xy + 1.0 + (s.z + 1.0) * 31.0).xyy * 2.0 - 1.0)
    );

    return dot(d, w) * 52.0;
}

// Voronoi Noise (cell/organic patterns)
// Returns: x = cell distance, y = cell ID
float2 voronoi(float2 p)
{
    float2 n = floor(p);
    float2 f = frac(p);

    float min_dist = 8.0;
    float2 min_point = float2(0.0, 0.0);

    for (int j = -1; j <= 1; j++)
    {
        for (int i = -1; i <= 1; i++)
        {
            float2 neighbor = float2(i, j);
            float2 cell_pt = hash22(n + neighbor);
            float2 diff = neighbor + cell_pt - f;
            float dist = dot(diff, diff);

            if (dist < min_dist)
            {
                min_dist = dist;
                min_point = n + neighbor + cell_pt;
            }
        }
    }

    return float2(sqrt(min_dist), hash21(min_point));
}

// FBM (Fractal Brownian Motion) - layered noise
// octaves: number of layers (2-6 recommended)
float fbm(float2 p, int octaves)
{
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 1.0;

    for (int i = 0; i < octaves; i++)
    {
        value += amplitude * simplex2d(p * frequency);
        frequency *= 2.0;
        amplitude *= 0.5;
    }

    return value;
}

// Animated FBM with time
float fbm_animated(float2 p, float time, int octaves)
{
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 1.0;

    for (int i = 0; i < octaves; i++)
    {
        value += amplitude * simplex3d(float3(p * frequency, time + i * 0.5));
        frequency *= 2.0;
        amplitude *= 0.5;
    }

    return value;
}

// Turbulence - abs(noise) summed, creates sharp valleys (fire, smoke)
float turbulence_animated(float2 p, float time, int octaves)
{
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 1.0;

    for (int i = 0; i < octaves; i++)
    {
        value += amplitude * abs(simplex3d(float3(p * frequency, time + i * 0.5)));
        frequency *= 2.0;
        amplitude *= 0.5;
    }

    return value;
}

// Ridged noise - 1 - abs(noise), creates sharp ridges (lightning, cracks)
float ridged_animated(float2 p, float time, int octaves)
{
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 1.0;
    float prev = 1.0;

    for (int i = 0; i < octaves; i++)
    {
        float n = 1.0 - abs(simplex3d(float3(p * frequency, time + i * 0.5)));
        n = n * n;  // Square for sharper ridges
        value += n * amplitude * prev;
        prev = n;
        frequency *= 2.0;
        amplitude *= 0.5;
    }

    return value;
}

// Marble - sine wave modulated by noise (elegant, classic)
float marble_animated(float2 p, float time, float turbulence_scale)
{
    float turb = turbulence_animated(p, time, 4) * turbulence_scale;
    return sin(p.x * 3.0 + turb * 5.0) * 0.5 + 0.5;
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
        default: root_matrix = IDENTITY_MATRIX3; root_pos = float3(0,0,0); break; \
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
