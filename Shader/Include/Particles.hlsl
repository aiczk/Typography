#ifndef TYPOGRAPHY_PARTICLES_INCLUDED
#define TYPOGRAPHY_PARTICLES_INCLUDED

#include "Core.hlsl"

struct particle_appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
    float2 uv2 : TEXCOORD1;
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct particle_v2g
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
    float2 uv2 : TEXCOORD1;
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct particle_g2f
{
    float4 vertex : SV_POSITION;                    // 4
    float2 uv : TEXCOORD0;                          // 2 (must interpolate for SDF)
    nointerpolation uint2 packed : TEXCOORD1;       // 2
    // x = shape(8) + hollow(8) + colorMul(16)
    // y = age(f16) | distFade(f16)<<16
    UNITY_VERTEX_OUTPUT_STEREO
};  // Total: 8 scalars (+1 VR stereo = 9), max 110 vertices (27 particles)

// ============================================================================
// Particle SDF Shapes
// ============================================================================
float sdCircle(float2 p) { return length(p); }
float sdSquare(float2 p) { return max(abs(p.x), abs(p.y)); }
float sdTriangle(float2 p) {
    // Isoceles triangle: vertices at (-1,-1), (1,-1), (0,1)
    return max(abs(p.x) * 2.0 + p.y, -p.y);
}
float sdCross(float2 p) {
    float2 q = abs(p);
    return min(max(q.x, q.y * 3.0), max(q.x * 3.0, q.y));
}

// ============================================================================
// Utilities
// ============================================================================

// PCG-based rand using pcg_hash from Core.hlsl
// Better quality than LCG, similar performance (~4 cycles)
float rand(float2 p)
{
    uint h = pcg_hash(asuint(p.x) ^ (asuint(p.y) * 747796405u));
    return float(h) * (1.0 / 4294967296.0);
}

// Generate 8 random values from single seed using PCG chain
// Uses lowbias32 variant for chain (better than pure LCG multiplication)
// Quality: passes PractRand, Performance: ~16 cycles for 8 values
void rand8(float2 seed, out float r0, out float r1, out float r2, out float r3,
           out float r4, out float r5, out float r6, out float r7)
{
    // Initial PCG hash for seed mixing
    uint h = pcg_hash(asuint(seed.x) ^ (asuint(seed.y) * 747796405u));
    const float inv = 1.0 / 4294967296.0;

    // Lowbias32 chain: better distribution than pure LCG
    // h ^= h >> 16; h *= 0x21f0aaad; h ^= h >> 15; h *= 0xd35a2d97; h ^= h >> 15;
    // Simplified: use XOR-shift-multiply pattern
    r0 = float(h) * inv;
    h ^= h >> 17; h *= 0xed5ad4bbu;
    r1 = float(h) * inv;
    h ^= h >> 11; h *= 0xac4c1b51u;
    r2 = float(h) * inv;
    h ^= h >> 15; h *= 0x31848babu;
    r3 = float(h) * inv;
    h ^= h >> 14; h *= 0xed5ad4bbu;
    r4 = float(h) * inv;
    h ^= h >> 11; h *= 0xac4c1b51u;
    r5 = float(h) * inv;
    h ^= h >> 15; h *= 0x31848babu;
    r6 = float(h) * inv;
    h ^= h >> 14; h *= 0xed5ad4bbu;
    r7 = float(h) * inv;
}

// Fast cube root approximation (~6 cycles vs pow ~20)
float cbrt_fast(float x)
{
    float y = asfloat(0x548c2b4b - asuint(x) / 3u);
    y = y * (1.333333 - 0.333333 * x * y * y * y);
    return x * y * y;
}

// Fast gamma 2.2 approximation (~3 cycles vs pow ~20)
float3 gamma22_fast(float3 c)
{
    return c * c * (c * 0.305 + 0.695);
}

// Note: frustum_cull_screen is defined in Core.hlsl

// ============================================================================
// Distribution & Animation
// ============================================================================

// Distribution position + floating animation
// distribution: 0=Sphere, 1=Cube
void distribution_and_float(float r0, float r1, float r2, float t, int distribution,
                            out float3 out_pos, out float3 out_float)
{
    float3 base_pos;

    if (distribution == 0)  // Sphere
    {
        float theta = r0 * TWO_PI;
        float u = r1 * 2.0 - 1.0;
        float s_th, c_th;
        sincos(theta, s_th, c_th);
        float su = sqrt(1.0 - u * u);
        float radius = cbrt_fast(r2);
        base_pos = float3(su * c_th, u, su * s_th) * radius;
    }
    else  // Cube
    {
        base_pos = float3(r0, r1, r2) * 2.0 - 1.0;
    }

    out_pos = base_pos;

    // Floating animation
    float3 fpos = base_pos;

    float fr1 = t * 0.5 + r0 * 500.0;
    float s1, c1;
    sincos(fr1, s1, c1);
    fpos.xy = float2(fpos.x * c1 - fpos.y * s1, fpos.x * s1 + fpos.y * c1);

    float fr2 = t * 0.333333 + r1 * 500.0;
    float s2, c2;
    sincos(fr2, s2, c2);
    fpos.yz = float2(fpos.y * c2 - fpos.z * s2, fpos.y * s2 + fpos.z * c2);

    out_float = fpos;
}

// After Effects style particle lifecycle
// - Birth: age=0, particle spawns at random position
// - Life: age 0→1, moves along direction, opacity follows "opacity over life"
// - Death: age=1, particle dies and respawns with new random position
void rise_effect(float r3, float r4, float t, float lifetime, float3 direction,
                 out float3 out_offset, out float out_color_mul, out float out_size, out float out_age)
{
    // Staggered birth time per particle (r4 offsets when each particle spawns)
    float phase = t / lifetime + r4;
    float cycle_num = floor(phase);
    float age = frac(phase);  // 0=birth, 1=death

    // Per-cycle spawn position (changes each respawn)
    uint cycle_hash = pcg_hash(asuint(cycle_num) ^ asuint(r4 * 1000.0));
    float3 spawn_offset = float3(
        (cycle_hash & 0xFFu) / 255.0 - 0.5,
        ((cycle_hash >> 8) & 0xFFu) / 255.0 - 0.5,
        ((cycle_hash >> 16) & 0xFFu) / 255.0 - 0.5
    ) * 0.3;

    // Position: spawn point + movement along direction over lifetime
    out_offset = spawn_offset + age * direction * 0.3;

    // Opacity over life: fade in first 20%, fade out last 20%
    float fade_in = saturate(age * 5.0);           // 0→1 during age 0-0.2
    float fade_out = saturate((1.0 - age) * 5.0);  // 1→0 during age 0.8-1.0
    out_color_mul = fade_in * fade_out;

    out_size = 2.0 + sin(r3 * TWO_PI + t * 0.3 * (1.0 + r3));
    out_age = age;
}

// ============================================================================
// Rendering
// ============================================================================

// Generate billboard quad vertices with XYZ rotation
// right/up: normalized camera axes (from custom cam_rot or UNITY_MATRIX_V)
void billboard_quad(float3 center, float3 right, float3 up, float quad_size, float3 rotation, bool has_rotation, out float3 v[4])
{
    // Skip rotation_matrix (3x sincos) when rotation is disabled
    [branch]
    if (has_rotation)
    {
        float3x3 rot = rotation_matrix(rotation);
        right = mul(rot, right);
        up = mul(rot, up);
    }
    right *= quad_size;
    up *= quad_size;

    v[0] = center - right - up;
    v[1] = center - right + up;
    v[2] = center + right - up;
    v[3] = center + right + up;
}

// Note: frustum_cull_world is defined in Core.hlsl

// Evaluate SDF shape by index
// Shapes: 0=Circle, 1=Square, 2=Triangle, 3=Cross
// Note: Shape=4 (Random) is resolved to 0-3 in geometry shader (PROCESS_PARTICLE)
float eval_shape(float2 uv, int shape)
{
    switch (shape)
    {
        case 0:  return sdCircle(uv);
        case 1:  return sdSquare(uv);
        case 2:  return sdTriangle(uv);
        case 3:  return sdCross(uv);
        default: return sdCircle(uv);
    }
}

// ============================================================================
// Particle Variable Declaration Macro
// ============================================================================
#define DECLARE_PARTICLE_VARS(N) \
    int _Particle##N##Space; \
    int _Particle##N##Multiplier; \
    int _Particle##N##Distribution; \
    int _Particle##N##Shape; \
    sampler2D _Particle##N##Gradient; \
    float _Particle##N##Size; \
    float4 _Particle##N##Rotation; \
    float _Particle##N##Hollow; \
    float _Particle##N##Speed; \
    float _Particle##N##Lifetime; \
    float4 _Particle##N##Direction; \
    float4 _Particle##N##Position; \
    float4 _Particle##N##Scale;

// ============================================================================
// Particle Processing Macro (Geometry Shader)
// Optimized: P1 (Space branching consolidated), P2 (single culling path)
// cam_rot_inv: pre-transposed camera rotation matrix
// ============================================================================
#define PROCESS_PARTICLE(N, base_uv, cam_pos, cam_rot_inv, tan_half_fov, aspect, vr_scale, distance_fade, stream, o) \
if (_Particle##N##Multiplier > 0) \
{ \
    bool is_screen_space_##N = (_Particle##N##Space == 0); \
    float3 billboard_right_##N = is_screen_space_##N ? cam_rot_inv._m00_m01_m02 : UNITY_MATRIX_V._m00_m01_m02; \
    float3 billboard_up_##N = is_screen_space_##N ? cam_rot_inv._m10_m11_m12 : UNITY_MATRIX_V._m10_m11_m12; \
    float particle_vr_scale_##N = is_screen_space_##N ? vr_scale : 1.0; \
    \
    float t_##N = _Time.y * _Particle##N##Speed; \
    bool has_rotation_##N = any(_Particle##N##Rotation.xyz != 0); \
    \
    [loop] \
    for (int m_##N = 0; m_##N < _Particle##N##Multiplier; m_##N++) \
    { \
        float2 seed_##N = base_uv + float2(m_##N * 0.00137, m_##N * 0.00251); \
        float r0, r1, r2, r3, r4, r5, r6, r7; \
        rand8(seed_##N, r0, r1, r2, r3, r4, r5, r6, r7); \
        float3 r567 = float3(r5, r6, r7); \
        \
        float3 dist_pos, float_pos; \
        distribution_and_float(r0, r1, r2, t_##N, _Particle##N##Distribution, dist_pos, float_pos); \
        float3 p = dist_pos + float_pos * 0.05; \
        \
        float3 rise_off; \
        float color_mul, psize, p_age; \
        rise_effect(r3, r4, t_##N, _Particle##N##Lifetime, _Particle##N##Direction.xyz, \
                    rise_off, color_mul, psize, p_age); \
        p += rise_off; \
        psize *= _Particle##N##Size; \
        \
        float3 base_pos = p * _Particle##N##Scale.xyz * particle_vr_scale_##N \
                        + _Particle##N##Position.xyz * CM_TO_METER_SCALE * particle_vr_scale_##N; \
        float3 world_center = is_screen_space_##N \
            ? base_pos \
            : mul(unity_ObjectToWorld, float4(base_pos, 1.0)).xyz; \
        float quad_size = 0.01 * psize * particle_vr_scale_##N; \
        \
        bool should_cull = is_screen_space_##N \
            ? frustum_cull_screen(world_center, quad_size * 2.0, cam_pos, cam_rot_inv, tan_half_fov, aspect) \
            : frustum_cull_world(world_center, quad_size * 2.0); \
        if (should_cull) continue; \
        \
        float3 v_##N[4]; \
        float3 rot_dir = r567 - 0.5; \
        float3 rotation = rot_dir * (TWO_PI + t_##N) * _Particle##N##Rotation.xyz; \
        billboard_quad(world_center, billboard_right_##N, billboard_up_##N, quad_size, rotation, has_rotation_##N, v_##N); \
        \
        static const float2 uvs[4] = { float2(-1,-1), float2(-1,1), float2(1,-1), float2(1,1) }; \
        uint shape_raw = (uint)_Particle##N##Shape; \
        uint shape_bits = (shape_raw >= 4u) ? ((uint)(r7 * 4.0) & 0x3u) : (shape_raw & 0x3u); \
        uint hollow_bits = ((uint)(saturate(_Particle##N##Hollow) * 255.0)) & 0xFFu; \
        uint colorMul_bits = ((uint)(saturate(color_mul) * 65535.0)) & 0xFFFFu; \
        o.packed.x = shape_bits | (hollow_bits << 8) | (colorMul_bits << 16); \
        o.packed.y = f32tof16(p_age) | (f32tof16(distance_fade) << 16); \
        [unroll] for (int i = 0; i < 4; i++) { \
            o.uv = uvs[i]; \
            o.vertex = is_screen_space_##N \
                ? project_custom_camera(v_##N[i], cam_pos, cam_rot_inv, tan_half_fov, aspect, 0) \
                : mul(UNITY_MATRIX_VP, float4(v_##N[i], 1.0)); \
            stream.Append(o); \
        } \
        stream.RestartStrip(); \
    } \
}

#endif // TYPOGRAPHY_PARTICLES_INCLUDED
