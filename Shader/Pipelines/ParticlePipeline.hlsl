#ifndef TYPOGRAPHY_PARTICLE_PIPELINE_INCLUDED
#define TYPOGRAPHY_PARTICLE_PIPELINE_INCLUDED

// ============================================================================
// Particle Pipeline (GPUP-compatible, with Typography extensions)
// Dependencies: Core.hlsl, Components.hlsl, Systems.hlsl, Noise.hlsl
// ============================================================================

// ============================================================================
// Input/Output Structures
// ============================================================================
struct particle_appdata
{
    float4 vertex : POSITION;    // xyz = random seed (baked in mesh)
    float2 uv : TEXCOORD0;       // x = particle_id / 65536, y = layer_id / 32
    float2 uv2 : TEXCOORD1;      // quad corner (0,0)-(1,1)
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct particle_v2f
{
    float4 vertex : SV_POSITION;
    float2 uv : TEXCOORD0;
    nointerpolation uint2 packed : TEXCOORD1;  // colorMul(16) + layer_id(8), age(f16) + speed_t(f16)
    UNITY_VERTEX_OUTPUT_STEREO
};

// Vertex culling macro
#define PARTICLE_CULL_VERTEX(o) { o.vertex = float4(0,0,-1,1); o.uv = 0; o.packed = 0; return o; }

// ============================================================================
// Random Utilities
// ============================================================================
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
// Arc Mode Helper
// ============================================================================
float compute_arc_theta(float r0, float arc_frac, int arc_mode, float arc_speed, float arc_spread,
                        float time, int particle_id, int max_particles)
{
    [flatten]
    if (arc_mode == 0) // Random
    {
        if (arc_spread > 0.0001)
        {
            float num_positions = max(1.0, floor(1.0 / arc_spread));
            float pos_idx = floor(r0 * num_positions);
            return (pos_idx / num_positions) * TWO_PI * arc_frac;
        }
        return r0 * TWO_PI * arc_frac;
    }
    else if (arc_mode == 1) // Loop
    {
        float loop_t = frac(time * arc_speed);
        return loop_t * TWO_PI * arc_frac;
    }
    else if (arc_mode == 2) // PingPong
    {
        float pp_t = abs(frac(time * arc_speed * 0.5) * 2.0 - 1.0);
        return pp_t * TWO_PI * arc_frac;
    }
    else // BurstSpread (3)
    {
        float spread_t = (float)particle_id / max((float)max_particles, 1.0);
        return spread_t * TWO_PI * arc_frac;
    }
}

// ============================================================================
// Distribution
// ============================================================================
void distribution_position(float r0, float r1, float r2, float t, int distribution,
                           float radius_thickness, float arc, int arc_mode, float arc_speed, float arc_spread,
                           float cone_angle, float cone_length, float donut_radius,
                           int particle_id, int max_particles,
                           out float3 out_pos)
{
    float3 base_pos;
    float arc_frac = (arc > 0.0001) ? (arc * 0.002777778) : 1.0;  // 1/360
    float theta = compute_arc_theta(r0, arc_frac, arc_mode, arc_speed, arc_spread, t, particle_id, max_particles);
    float cone_tan = tan(cone_angle * DEG2_RAD);

    [flatten]
    if (distribution == 0)  // Sphere
    {
        float u = r1 * 2.0 - 1.0;
        float s_th, c_th;
        sincos(theta, s_th, c_th);
        float su = sqrt(1.0 - u * u);
        float radius = lerp(1.0, pow(r2, 0.333333), radius_thickness);
        base_pos = float3(su * c_th, u, su * s_th) * radius;
    }
    else if (distribution == 1)  // Cube
    {
        base_pos = float3(r0, r1, r2) * 2.0 - 1.0;
    }
    else if (distribution == 2)  // Hemisphere
    {
        float u = r1;
        float s_th, c_th;
        sincos(theta, s_th, c_th);
        float su = sqrt(1.0 - u * u);
        float radius = lerp(1.0, pow(r2, 0.333333), radius_thickness);
        base_pos = float3(su * c_th, u, su * s_th) * radius;
    }
    else if (distribution == 3)  // Circle
    {
        float s_th, c_th;
        sincos(theta, s_th, c_th);
        float radius = lerp(1.0, sqrt(r1), radius_thickness);
        base_pos = float3(c_th * radius, 0.0, s_th * radius);
    }
    else if (distribution == 4)  // Cone
    {
        float h = r1;
        float s_th, c_th;
        sincos(theta, s_th, c_th);
        float cone_r = cone_tan * h * cone_length;
        cone_r *= lerp(1.0, sqrt(r2), radius_thickness);
        base_pos = float3(c_th * cone_r, h * cone_length, s_th * cone_r);
    }
    else // Donut (5)
    {
        float phi = r1 * TWO_PI;
        float s_th, c_th, s_ph, c_ph;
        sincos(theta, s_th, c_th);
        sincos(phi, s_ph, c_ph);
        float tube_r = donut_radius * lerp(1.0, sqrt(r2), radius_thickness);
        float x = (1.0 + tube_r * c_ph) * c_th;
        float y = tube_r * s_ph;
        float z = (1.0 + tube_r * c_ph) * s_th;
        base_pos = float3(x, y, z);
    }
    out_pos = base_pos;
}

// ============================================================================
// Rise Effect (Typography's continuous loop model)
// ============================================================================
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
// Velocity Functions
// ============================================================================
float3 apply_orbital_velocity(float3 pos, float3 orbital, float3 offset, float age)
{
    float3 angles = orbital * DEG2_RAD * age;
    float3 relative = pos - offset;
    return mul(rotation_matrix(angles), relative) + offset;
}

float3 apply_radial_velocity(float3 pos, float radial, float age)
{
    float len = length(pos);
    if (len < 0.0001) return pos;
    float3 dir = pos / len;
    return pos + dir * radial * age;
}

float3 apply_velocity_limit(float3 velocity, float3 limit, float dampen, float drag, float age,
                            bool multiply_by_size, float particle_size,
                            bool multiply_by_velocity)
{
    float adjusted_dampen = dampen;
    adjusted_dampen *= lerp(1.0, particle_size, (float)multiply_by_size);
    adjusted_dampen *= lerp(1.0, length(velocity), (float)multiply_by_velocity);

    // Padé [1,1] approximation: exp(-x) ≈ (1 - 0.5x) / (1 + 0.5x)
    float t = adjusted_dampen * age;
    velocity *= (1.0 - 0.5 * t) / (1.0 + 0.5 * t);
    velocity *= 1.0 / (1.0 + drag * age);

    // Per-axis limit (branchless)
    float3 limit_active = step(float3(0.0001, 0.0001, 0.0001), limit);
    float3 clamped = clamp(velocity, -limit, limit);
    velocity = lerp(velocity, clamped, limit_active);

    return velocity;
}

// ============================================================================
// Noise Functions
// ============================================================================
float3 apply_particle_noise_position(float3 pos, float3 seed, float time,
                                      float strength, float freq, float scroll,
                                      int octaves, float octave_mult, float octave_scale)
{
    float3 sample_pos = pos * freq;
    float t = time * scroll;
    float3 noise_offset;
    [flatten]
    if (octaves > 1)
    {
        noise_offset.x = fbm3d(float3(sample_pos.yz + seed.x, t), octaves, octave_mult, octave_scale);
        noise_offset.y = fbm3d(float3(sample_pos.xz + seed.y, t + 100.0), octaves, octave_mult, octave_scale);
        noise_offset.z = fbm3d(float3(sample_pos.xy + seed.z, t + 200.0), octaves, octave_mult, octave_scale);
    }
    else
    {
        noise_offset.x = simplex3d(float3(sample_pos.yz + seed.x, t));
        noise_offset.y = simplex3d(float3(sample_pos.xz + seed.y, t + 100.0));
        noise_offset.z = simplex3d(float3(sample_pos.xy + seed.z, t + 200.0));
    }
    return pos + noise_offset * strength;
}

float3 apply_particle_noise_rotation(float3 seed, float time,
                                      float strength, float freq, float scroll)
{
    if (abs(strength) < 0.0001)
        return float3(0, 0, 0);
    float t = time * scroll;
    float3 noise_rot;
    noise_rot.x = simplex3d(float3(seed.xy, t + 300.0));
    noise_rot.y = simplex3d(float3(seed.yz, t + 400.0));
    noise_rot.z = simplex3d(float3(seed.xz, t + 500.0));
    return noise_rot * strength * DEG2_RAD;
}

float apply_particle_noise_size(float3 seed, float time,
                                 float strength, float freq, float scroll)
{
    if (abs(strength) < 0.0001)
        return 1.0;
    float t = time * scroll;
    float noise_size = simplex3d(float3(seed.xy * freq, t + 600.0));
    return 1.0 + noise_size * strength;
}

float3 apply_force_randomize(float3 force, float3 seed, float time, float randomize)
{
    float3 noise_force;
    noise_force.x = simplex3d(float3(seed.xy, time * 2.0));
    noise_force.y = simplex3d(float3(seed.yz, time * 2.0 + 100.0));
    noise_force.z = simplex3d(float3(seed.xz, time * 2.0 + 200.0));
    return force + noise_force * randomize;
}

// ============================================================================
// Billboard
// ============================================================================
float3 billboard_vertex(float3 center, float3 right, float3 up, float2 quad_size,
                        float3 rotation, bool has_rot, float2 corner)
{
    [branch]
    if (has_rot)
    {
        float3x3 rot = rotation_matrix(rotation);
        right = mul(rot, right);
        up = mul(rot, up);
    }
    right *= quad_size.x;
    up *= quad_size.y;

    float2 offset = corner * 2.0 - 1.0;
    return center + right * offset.x + up * offset.y;
}

// ============================================================================
// Main Particle Processing
// ============================================================================
particle_v2f process_particle_vs(particle_appdata v, ParticleLayer p, int layer_id,
                                  float3 cam_pos, float3x3 cam_rot_inv,
                                  float tan_half_fov, float aspect, float distance_fade)
{
    particle_v2f o;
    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
    o.vertex = float4(0, 0, -1, 1);
    o.uv = 0;
    o.packed = 0;

    if (p.use <= 0)
        PARTICLE_CULL_VERTEX(o);

    int particle_id = (int)(v.uv.x * 65536.0);

    // Cull particles beyond max_particles
    if (particle_id >= p.max_particles)
        PARTICLE_CULL_VERTEX(o);
    float3 rnd_seed = v.vertex.xyz;
    float2 corner = v.uv2;

    // Unpack flags
    uint flags = p.flags;
    int distribution = PARTICLE_GET_DISTRIBUTION(flags);
    int arc_mode = PARTICLE_GET_ARC_MODE(flags);
    bool force_randomize = PARTICLE_GET_FORCE_RANDOMIZE(flags);
    bool multiply_by_size = PARTICLE_GET_MULTIPLY_BY_SIZE(flags);
    bool multiply_by_velocity = PARTICLE_GET_MULTIPLY_BY_VELOCITY(flags);
    int noise_octaves = PARTICLE_GET_NOISE_OCTAVES(flags);

    // Billboard basis (Screen or World)
    bool is_screen = (p.space == 0);
    float3 bb_right = is_screen ? cam_rot_inv._m00_m01_m02 : UNITY_MATRIX_V._m00_m01_m02;
    float3 bb_up = is_screen ? cam_rot_inv._m10_m11_m12 : UNITY_MATRIX_V._m10_m11_m12;

    float t = _Time.y * p.speed;
    bool has_spin = any(p.angular_velocity.xyz != 0) || any(abs(p.start_rotation) > 0.0001);
    bool has_noise = p.noise_strength > 0.0001;

    // Generate random values
    float2 seed = float2(rnd_seed.x * 1000.0, rnd_seed.y * 1000.0 + particle_id * 0.001);
    float r0, r1, r2, r3, r4, r5, r6, r7;
    rand8(seed, r0, r1, r2, r3, r4, r5, r6, r7);

    // Flip rotation (probability based)
    float rotation_sign = (r7 < p.flip_rotation) ? -1.0 : 1.0;

    float3 pos;
    distribution_position(r0, r1, r2, t, distribution, p.radius_thickness,
                          p.arc, arc_mode, p.arc_speed, p.arc_spread,
                          p.cone_angle, p.cone_length, p.donut_radius,
                          particle_id, p.max_particles, pos);

    // Apply shape transform (Scale → Rotate → Translate)
    pos *= p.shape_scale;
    [branch]
    if (any(p.shape_rotation != 0))
    {
        float3 shape_angles = p.shape_rotation * DEG2_RAD;
        pos = mul(rotation_matrix(shape_angles), pos);
    }
    pos += p.shape_position;

    // Rise effect (Typography's continuous loop)
    float3 rise_off;
    float color_mul, psize, p_age;
    rise_effect(r3, r4, t, p.lifetime, p.linear_velocity,
                rise_off, color_mul, psize, p_age);

    // Apply linear velocity
    rise_off *= p.start_speed;
    pos += rise_off;

    if (any(p.orbital != 0))
        pos = apply_orbital_velocity(pos, p.orbital, p.offset, p_age);

    if (abs(p.radial) > 0.0001)
        pos = apply_radial_velocity(pos, p.radial, p_age);

    float age_time = p_age * p.lifetime;

    // Apply force
    float3 applied_force = p.force;
    if (force_randomize)
        applied_force = apply_force_randomize(applied_force, rnd_seed, t, 1.0);

    float age_time_sq = age_time * age_time;
    float3 force_offset = applied_force * (age_time_sq * 0.5);

    // Apply gravity (Y-down)
    force_offset.y -= p.gravity_modifier * 4.905 * age_time_sq;

    float avg_size = (p.start_size.x + p.start_size.y) * 0.5;
    force_offset = apply_velocity_limit(force_offset, p.speed_limit, p.dampen, p.drag, p_age,
                                        multiply_by_size, avg_size, multiply_by_velocity);
    pos += force_offset;

    // Speed modifier
    pos *= p.speed_modifier;

    [branch]
    if (has_noise && p.noise_position_amount > 0.0001)
    {
        pos = apply_particle_noise_position(pos, rnd_seed, t,
            p.noise_strength * p.noise_position_amount, p.noise_frequency, p.noise_scroll_speed,
            noise_octaves, p.noise_octave_multiplier, p.noise_octave_scale);
    }

    // Size: start_size * size_over_lifetime
    float2 final_size = p.start_size * p.size_over_lifetime;

    [branch]
    if (has_noise && p.noise_size_amount > 0.0001)
    {
        float size_noise = apply_particle_noise_size(rnd_seed, t,
            p.noise_strength * p.noise_size_amount, p.noise_frequency, p.noise_scroll_speed);
        final_size *= size_noise;
    }
    final_size *= psize;

    // Calculate speed for by-speed modules
    float current_speed = length(rise_off * p.start_speed + force_offset);

    // Size by Speed (branchless)
    {
        float range_active = step(p.size_by_speed_range.x + 0.0001, p.size_by_speed_range.y);
        float speed_t = saturate((current_speed - p.size_by_speed_range.x) /
                                  max(p.size_by_speed_range.y - p.size_by_speed_range.x, 0.001));
        final_size *= lerp(float2(1, 1), p.size_by_speed, speed_t * range_active);
    }

    // World position
    float3 world_center = is_screen
        ? pos
        : mul(unity_ObjectToWorld, float4(pos, 1.0)).xyz;
    float2 quad_size = 0.01 * final_size;

    // Apply root transform
    float3x3 root_mat; float3 root_pos;
    GET_ROOT_TRANSFORM(p.root_index, root_mat, root_pos)
    world_center = apply_root(world_center, p.root_index, root_mat, root_pos);

    // Frustum culling
    float cull_size = max(quad_size.x, quad_size.y) * 2.0;
    if (cull_object(world_center, is_screen ? 0 : 1, 0.0,
                    cam_pos, cam_rot_inv, tan_half_fov, aspect, cull_size))
        PARTICLE_CULL_VERTEX(o);

    // Billboard rotation with flip
    float3 spin_dir = float3(r5, r6, r7) - 0.5;
    spin_dir *= rotation_sign;
    float3 initial_rot = p.start_rotation * DEG2_RAD;
    float3 spin = initial_rot + spin_dir * t * p.angular_velocity;

    // Rotation by Speed (branchless)
    {
        float range_active = step(p.rotation_by_speed_range.x + 0.0001, p.rotation_by_speed_range.y);
        float speed_t = saturate((current_speed - p.rotation_by_speed_range.x) /
                                  max(p.rotation_by_speed_range.y - p.rotation_by_speed_range.x, 0.001));
        spin += p.rotation_by_speed * DEG2_RAD * speed_t * range_active * p_age;
        has_spin = has_spin || (range_active > 0.5);
    }

    [branch]
    if (has_noise && p.noise_rotation_amount > 0.0001)
    {
        float3 noise_rot = apply_particle_noise_rotation(rnd_seed, t,
            p.noise_strength * p.noise_rotation_amount * 45.0, p.noise_frequency, p.noise_scroll_speed);
        spin += noise_rot;
        has_spin = true;
    }

    // Compute vertex position
    float3 world_pos = billboard_vertex(world_center, bb_right, bb_up, quad_size, spin, has_spin, corner);

    // Project
    o.vertex = is_screen
        ? project_custom_camera(world_pos, cam_pos, cam_rot_inv, tan_half_fov, aspect, 0)
        : mul(UNITY_MATRIX_VP, float4(world_pos, 1.0));

    o.uv = corner;

    // Pack colorMul (16bit), layer_id (8bit), age (f16), speed_t (f16)
    float color_range_active = step(p.color_by_speed_range.x + 0.0001, p.color_by_speed_range.y);
    float speed_t = saturate((current_speed - p.color_by_speed_range.x) /
                             max(p.color_by_speed_range.y - p.color_by_speed_range.x, 0.001)) * color_range_active;
    uint colorMul_bits = ((uint)(saturate(color_mul) * 65535.0)) & 0xFFFFu;
    uint layer_bits = (uint)layer_id & 0xFFu;
    o.packed.x = colorMul_bits | (layer_bits << 24);
    o.packed.y = f32tof16(p_age) | (f32tof16(speed_t) << 16);

    return o;
}

#endif // TYPOGRAPHY_PARTICLE_PIPELINE_INCLUDED
