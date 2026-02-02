#ifndef TYPOGRAPHY_PARTICLE_PIPELINE_INCLUDED
#define TYPOGRAPHY_PARTICLE_PIPELINE_INCLUDED

// ============================================================================
// Particle Pipeline (VS Expansion - No Geometry Shader)
// Dependencies: Core.hlsl, Components.hlsl, Systems.hlsl
// ============================================================================

// ============================================================================
// Input/Output Structures
// ============================================================================
struct particle_appdata
{
    float4 vertex : POSITION;    // xyz = random seed (baked in mesh)
    float2 uv : TEXCOORD0;       // x = particle_id / 256, y = layer_id / 32
    float2 uv2 : TEXCOORD1;      // quad corner (0,0)-(1,1)
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct particle_v2f
{
    float4 vertex : SV_POSITION;
    float2 uv : TEXCOORD0;                     // SDF coordinates (-1,-1) to (1,1)
    nointerpolation uint2 packed : TEXCOORD1;  // shape, hollow, colorMul, age, distFade
    UNITY_VERTEX_OUTPUT_STEREO
};

// ============================================================================
// SDF Shapes
// ============================================================================
float sdCircle(float2 p) { return length(p); }
float sdSquare(float2 p) { return max(abs(p.x), abs(p.y)); }
float sdTriangle(float2 p) { return max(abs(p.x) * 2.0 + p.y, -p.y); }
float sdCross(float2 p) {
    float2 q = abs(p);
    return min(max(q.x, q.y * 3.0), max(q.x * 3.0, q.y));
}

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
// Random Utilities
// ============================================================================
float particle_rand(float2 p)
{
    uint h = pcg_hash(asuint(p.x) ^ (asuint(p.y) * 747796405u));
    return float(h) * (1.0 / 4294967296.0);
}

void rand8(float2 seed, out float r0, out float r1, out float r2, out float r3,
           out float r4, out float r5, out float r6, out float r7)
{
    uint h = pcg_hash(asuint(seed.x) ^ (asuint(seed.y) * 747796405u));
    const float inv = 1.0 / 4294967296.0;
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

// ============================================================================
// Math Utilities
// ============================================================================
float cbrt_fast(float x)
{
    float y = asfloat(0x548c2b4b - asuint(x) / 3u);
    y = y * (1.333333 - 0.333333 * x * y * y * y);
    return x * y * y;
}

float3 gamma22_fast(float3 c)
{
    return c * c * (c * 0.305 + 0.695);
}

// ============================================================================
// Distribution & Animation
// ============================================================================
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

void rise_effect(float r3, float r4, float t, float lifetime, float3 direction,
                 out float3 out_offset, out float out_color_mul, out float out_size, out float out_age)
{
    float phase = t / lifetime + r4;
    float cycle_num = floor(phase);
    float age = frac(phase);

    uint cycle_hash = pcg_hash(asuint(cycle_num) ^ asuint(r4 * 1000.0));
    float3 spawn_offset = float3(
        (cycle_hash & 0xFFu) / 255.0 - 0.5,
        ((cycle_hash >> 8) & 0xFFu) / 255.0 - 0.5,
        ((cycle_hash >> 16) & 0xFFu) / 255.0 - 0.5
    ) * 0.3;

    out_offset = spawn_offset + age * direction * 0.3;

    float fade_in = saturate(age * 5.0);
    float fade_out = saturate((1.0 - age) * 5.0);
    out_color_mul = fade_in * fade_out;

    out_size = 2.0 + sin(r3 * TWO_PI + t * 0.3 * (1.0 + r3));
    out_age = age;
}

// ============================================================================
// Billboard (VS version - computes single vertex position)
// ============================================================================
float3 billboard_vertex(float3 center, float3 right, float3 up, float quad_size,
                        float3 rotation, bool has_rotation, float2 corner)
{
    [branch]
    if (has_rotation)
    {
        float3x3 rot = rotation_matrix(rotation);
        right = mul(rot, right);
        up = mul(rot, up);
    }
    right *= quad_size;
    up *= quad_size;

    // corner: (0,0), (0,1), (1,0), (1,1) -> offset: (-1,-1), (-1,1), (1,-1), (1,1)
    float2 offset = corner * 2.0 - 1.0;
    return center + right * offset.x + up * offset.y;
}

// ============================================================================
// Process Particle (Vertex Shader - Single Particle)
// ============================================================================
particle_v2f process_particle_vs(particle_appdata v, ParticleLayer layer,
                                  float3 cam_pos, float3x3 cam_rot_inv,
                                  float tan_half_fov, float aspect, float distance_fade)
{
    particle_v2f o;
    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

    // Default: culled
    o.vertex = float4(0, 0, -1, 1);
    o.uv = float2(0, 0);
    o.packed = uint2(0, 0);

    // Early out if disabled
    if (layer.use <= 0)
        return o;

    // Extract particle ID and random seed from mesh
    int particle_id = (int)(v.uv.x * 256.0);
    float3 rnd_seed = v.vertex.xyz;  // Random seed baked in vertex position

    // Quad corner from uv2
    float2 corner = v.uv2;

    // Billboard basis
    bool is_screen = (layer.space == 0);
    float3 bb_right = is_screen ? cam_rot_inv._m00_m01_m02 : UNITY_MATRIX_V._m00_m01_m02;
    float3 bb_up = is_screen ? cam_rot_inv._m10_m11_m12 : UNITY_MATRIX_V._m10_m11_m12;
    float t = _Time.y * layer.speed;
    bool has_rot = any(layer.rotation.xyz != 0);

    // Generate random values from seed (layer.seed offsets for different patterns)
    float2 seed = float2(rnd_seed.x * 1000.0 + layer.seed, rnd_seed.y * 1000.0 + particle_id * 0.001);
    float r0, r1, r2, r3, r4, r5, r6, r7;
    rand8(seed, r0, r1, r2, r3, r4, r5, r6, r7);

    // Distribution and float animation
    float3 dist_pos, float_pos;
    distribution_and_float(r0, r1, r2, t, layer.distribution, dist_pos, float_pos);
    float3 p = dist_pos + float_pos * 0.05;

    // Rise effect (returns age for other calculations)
    float3 rise_off;
    float color_mul, psize, p_age;
    rise_effect(r3, r4, t, layer.lifetime, layer.direction.xyz,
                rise_off, color_mul, psize, p_age);
    p += rise_off;

    // Gravity effect (parabolic motion based on age)
    float age_time = p_age * layer.lifetime;
    p += layer.gravity.xyz * (age_time * age_time * 0.5);

    // Size over lifetime (lerp from size to size_end)
    float final_size = lerp(layer.size, layer.size_end, p_age);
    psize *= final_size;

    // World position
    float3 base_pos = p * layer.scale.xyz + layer.position.xyz * CM_TO_METER_SCALE;
    float3 world_center = is_screen
        ? base_pos
        : mul(unity_ObjectToWorld, float4(base_pos, 1.0)).xyz;
    float quad_size = 0.01 * psize;

    // Frustum culling
    if (cull_object(world_center, is_screen ? 0 : 1, 0.0,
                    cam_pos, cam_rot_inv, tan_half_fov, aspect, quad_size * 2.0))
        return o;

    // Billboard rotation
    float3 rot_dir = float3(r5, r6, r7) - 0.5;
    float3 rot = rot_dir * (TWO_PI + t) * layer.rotation.xyz;

    // Compute vertex position
    float3 world_pos = billboard_vertex(world_center, bb_right, bb_up, quad_size, rot, has_rot, corner);

    // Project
    o.vertex = is_screen
        ? project_custom_camera(world_pos, cam_pos, cam_rot_inv, tan_half_fov, aspect, 0)
        : mul(UNITY_MATRIX_VP, float4(world_pos, 1.0));

    // SDF UV: corner (0,0)-(1,1) -> (-1,-1)-(1,1)
    o.uv = corner * 2.0 - 1.0;

    // Pack data
    uint shape_raw = (uint)layer.shape;
    uint shape_bits = (shape_raw >= 4u) ? ((uint)(r7 * 4.0) & 0x3u) : (shape_raw & 0x3u);
    uint hollow_bits = ((uint)(saturate(layer.hollow) * 255.0)) & 0xFFu;
    uint colorMul_bits = ((uint)(saturate(color_mul) * 65535.0)) & 0xFFFFu;
    o.packed.x = shape_bits | (hollow_bits << 8) | (colorMul_bits << 16);
    o.packed.y = f32tof16(p_age) | (f32tof16(distance_fade) << 16);

    return o;
}

#endif
