#ifndef TYPOGRAPHY_NOISE_INCLUDED
#define TYPOGRAPHY_NOISE_INCLUDED

// ============================================================================
// Noise.hlsl - Procedural Noise Functions
// ============================================================================
// Separated from Core.hlsl for clear dependency management.
// Requires: Constants.hlsl (for EPSILON)

// ============================================================================
// Hash Functions
// ============================================================================

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
// Simplex Noise
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

// ============================================================================
// Derived Noise Functions
// ============================================================================

// Curl Noise - divergence-free flow field
// Creates fluid-like, swirling patterns
float curl_noise_animated(float2 p, float time)
{
    float eps = 0.01;

    // Sample noise at offset positions to compute gradient
    float n1 = simplex3d(float3(p + float2(eps, 0), time));
    float n2 = simplex3d(float3(p - float2(eps, 0), time));
    float n3 = simplex3d(float3(p + float2(0, eps), time));
    float n4 = simplex3d(float3(p - float2(0, eps), time));

    // Compute gradient
    float dx = (n1 - n2) / (2.0 * eps);
    float dy = (n3 - n4) / (2.0 * eps);

    // Curl is perpendicular to gradient: rotate 90 degrees
    float2 curl = float2(-dy, dx);

    // Use curl to warp the sampling position for a flowing effect
    float2 warped_p = p + curl * 0.5;
    return simplex3d(float3(warped_p, time * 0.7)) * 0.5 + 0.5;
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
// Screen-Space Noise (for dithering, TAA)
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

#endif // TYPOGRAPHY_NOISE_INCLUDED
