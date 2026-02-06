#ifndef TYPOGRAPHY_COMPONENTS_INCLUDED
#define TYPOGRAPHY_COMPONENTS_INCLUDED

// ============================================================================
// Components.hlsl - Unified Data Structures and Property Macros
// ============================================================================
// All component structures and DECLARE/LOAD macros in one file.
// Replaces the previous 12-file Components/ folder structure.

// ============================================================================
// Text Layer Components
// ============================================================================

struct VisibilityComponent
{
    float use;
    int mode;  // 0=horizontal, 2=vertical
};

struct TransformComponent
{
    float4 position;
    float4 rotation;
    float4 scale;
    float4 pivot;
    int world_space;
    int root_index;
    int layer;
};

struct AppearanceComponent
{
    float4 color;
    int font_index;
};

struct TypewriterComponent
{
    int type;           // 0=sequential, 1=block
    int mode;           // LTR/RTL/CenterOut
    float progress;
    float smooth;
    float4 direction;
    float4 rotation;
    float4 scale;
    int centering;
    float center_smooth;
};

struct BlockComponent
{
    int visible;
    int animating;
    float char_delay;
};

struct SpacingComponent
{
    float spacing;
    int anchor;  // 0=center, 1=left, 2=right
};

struct CurveComponent
{
    float4 x_0, x_1;
    float4 y_0, y_1;
    float4 z_0, z_1;
    float intensity;
    float offset;
    float speed;
    float rotation;
    float4 center;
};

struct ShakeComponent
{
    float amplitude;
    float frequency;
    float blend;
};

struct ScatterComponent
{
    int direction;      // 0=Random, 1=Radial, 2=Up, 3=Down, 4=Left, 5=Right
    float intensity;    // 0=gathered, 1=scattered
    float fade;         // Opacity at full scatter (0=invisible, 1=same)
    float3 distance;    // Max scatter distance (xyz)
    float3 rotation;    // Max rotation at full scatter (degrees, xyz)
    float3 scale;       // Scale at full scatter (0=disappear, 1=same)
};

struct OutlineComponent
{
    int mode;       // 0=outline, 1=stroke
    float width;
    float round;
    float4 color;
};

struct ShadowComponent
{
    float intensity;
    float softness;
    float2 offset;
    float3 color;
};

struct NoiseComponent
{
    int mode;           // 0=Simplex, 1=Curl, 2=FBM, 3=Turbulence, 4=Ridged, 5=Marble
    float intensity;
    float scale;
    float speed;
    float3 color;
};

// ============================================================================
// TextLayer: Aggregate of all text components
// ============================================================================
struct TextLayer
{
    VisibilityComponent visibility;
    TransformComponent transform;
    AppearanceComponent appearance;
    TypewriterComponent typewriter;
    BlockComponent block;
    SpacingComponent spacing;
    CurveComponent curve;
    ShakeComponent shake;
    ScatterComponent scatter;
    OutlineComponent outline;
    ShadowComponent shadow;
    NoiseComponent noise;
};

// ============================================================================
// Particle Layer Component (GPUP-compatible structure)
// ============================================================================

// Bit-packed flags layout (same as GPUP):
// bits 0-2: distribution (0-5: Sphere, Cube, Hemisphere, Circle, Cone, Donut)
// bits 3-4: arc_mode (0-3)
// bit 5: force_randomize
// bit 6: multiply_by_size
// bit 7: multiply_by_velocity
// bits 8-9: noise_octaves - 1 (0-3 representing 1-4)
// bit 10: 3d_start_size
// bit 11: 3d_start_rotation
#define PARTICLE_GET_DISTRIBUTION(f)       ((f) & 0x7u)
#define PARTICLE_GET_ARC_MODE(f)           (((f) >> 3) & 0x3u)
#define PARTICLE_GET_FORCE_RANDOMIZE(f)    ((f) & 0x020u)
#define PARTICLE_GET_MULTIPLY_BY_SIZE(f)   ((f) & 0x040u)
#define PARTICLE_GET_MULTIPLY_BY_VELOCITY(f) ((f) & 0x080u)
#define PARTICLE_GET_NOISE_OCTAVES(f)      min((((f) >> 8) & 0x3u) + 1, 2)
#define PARTICLE_GET_3D_START_SIZE(f)      ((f) & 0x400u)
#define PARTICLE_GET_3D_START_ROTATION(f)  ((f) & 0x800u)

#define PARTICLE_PACK_FLAGS(dist, arc_mode, force_rand, mul_size, mul_vel, octaves, size3d, rot3d) \
    (((dist) & 0x7u) | (((arc_mode) & 0x3u) << 3) | \
     (((force_rand) & 0x1u) << 5) | (((mul_size) & 0x1u) << 6) | (((mul_vel) & 0x1u) << 7) | \
     ((((octaves) - 1) & 0x3u) << 8) | (((size3d) & 0x1u) << 10) | (((rot3d) & 0x1u) << 11))

struct ParticleLayer
{
    // Typography-specific
    int use;
    int space;          // 0=Screen, 1=World
    int root_index;     // 0=None, 1-5=Root 1-5

    // Main Module
    uint flags;         // bit-packed flags
    int max_particles;  // particles per layer (for BurstSpread arc mode)
    float lifetime;
    float start_speed;
    float2 start_size;
    float3 start_rotation;
    float flip_rotation;
    int random_seed;
    float4 start_color;
    float gravity_modifier;
    float speed;        // simulation speed

    // Shape
    float radius_thickness;
    float arc;
    float arc_speed;
    float arc_spread;
    float cone_tan;
    float cone_length;
    float donut_radius;
    float3 shape_position;
    float3 shape_rotation;
    float3 shape_scale;

    // Velocity over Lifetime
    float3 linear_velocity;
    float3 orbital;
    float3 offset;
    float radial;
    float speed_modifier;

    // Limit Velocity over Lifetime
    float3 speed_limit;
    float dampen;
    float drag;

    // Force over Lifetime
    float3 force;

    // Size over Lifetime
    float2 size_over_lifetime;

    // Rotation over Lifetime
    float3 angular_velocity;

    // Color by Speed
    float2 color_by_speed_range;

    // Size by Speed
    float2 size_by_speed;
    float2 size_by_speed_range;

    // Rotation by Speed
    float3 rotation_by_speed;
    float2 rotation_by_speed_range;

    // Noise
    float noise_strength;
    float noise_frequency;
    float noise_scroll_speed;
    float noise_octave_multiplier;
    float noise_octave_scale;
    float noise_position_amount;
    float noise_rotation_amount;
    float noise_size_amount;
};

// ============================================================================
// Property Declaration Macros
// ============================================================================

#define DECLARE_VISIBILITY_VARS(N) \
    float _Use##N; \
    int _Mode##N;

#define DECLARE_TRANSFORM_VARS(N) \
    float4 _Position##N; \
    float4 _Rotation##N; \
    float4 _Scale##N; \
    float4 _Pivot##N; \
    int _WorldSpace##N; \
    int _RootIndex##N; \
    int _Layer##N;

#define DECLARE_APPEARANCE_VARS(N) \
    float4 _TextColor##N; \
    int _FontIndex##N;

#define DECLARE_TYPEWRITER_VARS(N) \
    int _TypewriterType##N; \
    int _TypewriterMode##N; \
    float _TypewriterProgress##N; \
    float _TypewriterSmooth##N; \
    float4 _TypewriterDirection##N; \
    float4 _TypewriterRotation##N; \
    float4 _TypewriterScale##N; \
    int _TypewriterCentering##N; \
    float _TypewriterCenterSmooth##N; \
    int _BlockVisible##N; \
    int _BlockAnimating##N; \
    float _BlockCharDelay##N;

#define DECLARE_SPACING_VARS(N) \
    float _Spacing##N; \
    int _SpacingAnchor##N;

#define DECLARE_CURVE_VARS(N) \
    float4 _CurveDataX##N##_0; \
    float4 _CurveDataX##N##_1; \
    float4 _CurveDataY##N##_0; \
    float4 _CurveDataY##N##_1; \
    float4 _CurveDataZ##N##_0; \
    float4 _CurveDataZ##N##_1; \
    float _CurveIntensity##N; \
    float _CurveOffset##N; \
    float _CurveSpeed##N; \
    float _CurveRotation##N; \
    float4 _CurveCenter##N;

#define DECLARE_SHAKE_VARS(N) \
    float _ShakeAmplitude##N; \
    float _ShakeFrequency##N; \
    float _ShakeBlend##N;

#define DECLARE_SCATTER_VARS(N) \
    int _ScatterDirection##N; \
    float _ScatterIntensity##N; \
    float _ScatterFade##N; \
    float4 _ScatterDistance##N; \
    float4 _ScatterRotation##N; \
    float4 _ScatterScale##N;

#define DECLARE_OUTLINE_VARS(N) \
    int _OutlineMode##N; \
    float _OutlineWidth##N; \
    float _OutlineRound##N; \
    float4 _OutlineColor##N;

#define DECLARE_SHADOW_VARS(N) \
    float _ShadowIntensity##N; \
    float _ShadowSoftness##N; \
    float4 _ShadowOffset##N; \
    float4 _ShadowColor##N;

#define DECLARE_SURFACE_VARS(N) \
    int _SurfaceMode##N; \
    float _SurfaceIntensity##N; \
    float _SurfaceScale##N; \
    float _SurfaceSpeed##N; \
    float4 _SurfaceColor##N;

#define DECLARE_PARTICLE_LAYER_VARS(N) \
    int _Particle##N##Use; \
    int _Particle##N##Space; \
    int _Particle##N##RootIndex; \
    sampler2D _Particle##N##MainTex; \
    int _Particle##N##Distribution; \
    int _Particle##N##ArcMode; \
    int _Particle##N##ForceRandomize; \
    int _Particle##N##MultiplyBySize; \
    int _Particle##N##MultiplyByVelocity; \
    int _Particle##N##NoiseOctaves; \
    int _Particle##N##3DStartSize; \
    int _Particle##N##3DStartRotation; \
    int _Particle##N##RandomSeed; \
    int _Particle##N##MaxParticles; \
    float _Particle##N##StartLifetime; \
    float _Particle##N##StartSpeed; \
    float _Particle##N##StartSize; \
    float4 _Particle##N##StartSize3D; \
    float _Particle##N##StartRotation; \
    float4 _Particle##N##StartRotation3D; \
    float _Particle##N##FlipRotation; \
    float4 _Particle##N##StartColor; \
    float _Particle##N##GravityModifier; \
    float _Particle##N##SimulationSpeed; \
    float _Particle##N##RadiusThickness; \
    float _Particle##N##Arc; \
    float _Particle##N##ArcSpeed; \
    float _Particle##N##ArcSpread; \
    float _Particle##N##ConeAngle; \
    float _Particle##N##ConeLength; \
    float _Particle##N##DonutRadius; \
    float4 _Particle##N##ShapePosition; \
    float4 _Particle##N##ShapeRotation; \
    float4 _Particle##N##ShapeScale; \
    float4 _Particle##N##LinearVelocity; \
    float4 _Particle##N##OrbitalVelocity; \
    float4 _Particle##N##OrbitalOffset; \
    float _Particle##N##RadialVelocity; \
    float _Particle##N##SpeedModifier; \
    float4 _Particle##N##SpeedLimit; \
    float _Particle##N##Dampen; \
    float _Particle##N##Drag; \
    float4 _Particle##N##Force; \
    float4 _Particle##N##SizeOverLifetime; \
    float4 _Particle##N##AngularVelocity; \
    float4 _Particle##N##ColorBySpeedRange; \
    float4 _Particle##N##SizeBySpeed; \
    float4 _Particle##N##SizeBySpeedRange; \
    float4 _Particle##N##RotationBySpeed; \
    float4 _Particle##N##RotationBySpeedRange; \
    float _Particle##N##NoiseStrength; \
    float _Particle##N##NoiseFrequency; \
    float _Particle##N##NoiseScrollSpeed; \
    float _Particle##N##NoiseOctaveMultiplier; \
    float _Particle##N##NoiseOctaveScale; \
    float _Particle##N##NoisePositionAmount; \
    float _Particle##N##NoiseRotationAmount; \
    float _Particle##N##NoiseSizeAmount; \
    Texture2D _Particle##N##ColorGradient; \
    SamplerState sampler_Particle##N##ColorGradient; \
    Texture2D _Particle##N##ColorBySpeedGradient; \
    SamplerState sampler_Particle##N##ColorBySpeedGradient;

// ============================================================================
// Property Load Macros
// ============================================================================

#define LOAD_VISIBILITY(N, c) \
    c.use = _Use##N; \
    c.mode = _Mode##N;

#define LOAD_TRANSFORM(N, c) \
    c.position = _Position##N; \
    c.rotation = _Rotation##N; \
    c.scale = _Scale##N; \
    c.pivot = _Pivot##N; \
    c.world_space = _WorldSpace##N; \
    c.root_index = _RootIndex##N; \
    c.layer = _Layer##N;

#define LOAD_APPEARANCE(N, c) \
    c.color = _TextColor##N; \
    c.font_index = _FontIndex##N;

#define LOAD_TYPEWRITER(N, c) \
    c.type = _TypewriterType##N; \
    c.mode = _TypewriterMode##N; \
    c.progress = _TypewriterProgress##N; \
    c.smooth = _TypewriterSmooth##N; \
    c.direction = _TypewriterDirection##N; \
    c.rotation = _TypewriterRotation##N; \
    c.scale = _TypewriterScale##N; \
    c.centering = _TypewriterCentering##N; \
    c.center_smooth = _TypewriterCenterSmooth##N;

#define LOAD_BLOCK(N, c) \
    c.visible = _BlockVisible##N; \
    c.animating = _BlockAnimating##N; \
    c.char_delay = _BlockCharDelay##N;

#define LOAD_SPACING(N, c) \
    c.spacing = _Spacing##N; \
    c.anchor = _SpacingAnchor##N;

#define LOAD_CURVE(N, c) \
    c.x_0 = _CurveDataX##N##_0; \
    c.x_1 = _CurveDataX##N##_1; \
    c.y_0 = _CurveDataY##N##_0; \
    c.y_1 = _CurveDataY##N##_1; \
    c.z_0 = _CurveDataZ##N##_0; \
    c.z_1 = _CurveDataZ##N##_1; \
    c.intensity = _CurveIntensity##N; \
    c.offset = _CurveOffset##N; \
    c.speed = _CurveSpeed##N; \
    c.rotation = _CurveRotation##N; \
    c.center = _CurveCenter##N;

#define LOAD_SHAKE(N, c) \
    c.amplitude = _ShakeAmplitude##N; \
    c.frequency = _ShakeFrequency##N; \
    c.blend = _ShakeBlend##N;

#define LOAD_SCATTER(N, c) \
    c.direction = _ScatterDirection##N; \
    c.intensity = _ScatterIntensity##N; \
    c.fade = _ScatterFade##N; \
    c.distance = _ScatterDistance##N.xyz; \
    c.rotation = _ScatterRotation##N.xyz; \
    c.scale = _ScatterScale##N.xyz;

#define LOAD_OUTLINE(N, c) \
    c.mode = _OutlineMode##N; \
    c.width = _OutlineWidth##N; \
    c.round = _OutlineRound##N; \
    c.color = _OutlineColor##N;

#define LOAD_SHADOW(N, c) \
    c.intensity = _ShadowIntensity##N; \
    c.softness = _ShadowSoftness##N; \
    c.offset = _ShadowOffset##N.xy; \
    c.color = _ShadowColor##N.rgb;

#define LOAD_SURFACE(N, c) \
    c.mode = _SurfaceMode##N; \
    c.intensity = _SurfaceIntensity##N; \
    c.scale = _SurfaceScale##N; \
    c.speed = _SurfaceSpeed##N; \
    c.color = _SurfaceColor##N.rgb;

#define LOAD_PARTICLE_LAYER(N, layer) \
    layer.use = _Particle##N##Use; \
    layer.space = _Particle##N##Space; \
    layer.root_index = _Particle##N##RootIndex; \
    layer.flags = PARTICLE_PACK_FLAGS(_Particle##N##Distribution, _Particle##N##ArcMode, \
        _Particle##N##ForceRandomize, _Particle##N##MultiplyBySize, _Particle##N##MultiplyByVelocity, \
        _Particle##N##NoiseOctaves, _Particle##N##3DStartSize, _Particle##N##3DStartRotation); \
    layer.max_particles = _Particle##N##MaxParticles; \
    layer.lifetime = _Particle##N##StartLifetime; \
    layer.start_speed = _Particle##N##StartSpeed; \
    layer.start_size = _Particle##N##3DStartSize ? _Particle##N##StartSize3D.xy : float2(_Particle##N##StartSize, _Particle##N##StartSize); \
    layer.start_rotation = _Particle##N##3DStartRotation ? _Particle##N##StartRotation3D.xyz : float3(0, 0, _Particle##N##StartRotation); \
    layer.flip_rotation = _Particle##N##FlipRotation; \
    layer.random_seed = _Particle##N##RandomSeed; \
    layer.start_color = _Particle##N##StartColor; \
    layer.gravity_modifier = _Particle##N##GravityModifier; \
    layer.speed = _Particle##N##SimulationSpeed; \
    layer.radius_thickness = _Particle##N##RadiusThickness; \
    layer.arc = _Particle##N##Arc; \
    layer.arc_speed = _Particle##N##ArcSpeed; \
    layer.arc_spread = _Particle##N##ArcSpread; \
    layer.cone_tan = tan(_Particle##N##ConeAngle * DEG2_RAD); \
    layer.cone_length = _Particle##N##ConeLength; \
    layer.donut_radius = _Particle##N##DonutRadius; \
    layer.shape_position = _Particle##N##ShapePosition.xyz; \
    layer.shape_rotation = _Particle##N##ShapeRotation.xyz; \
    layer.shape_scale = _Particle##N##ShapeScale.xyz; \
    layer.linear_velocity = _Particle##N##LinearVelocity.xyz; \
    layer.orbital = _Particle##N##OrbitalVelocity.xyz; \
    layer.offset = _Particle##N##OrbitalOffset.xyz; \
    layer.radial = _Particle##N##RadialVelocity; \
    layer.speed_modifier = _Particle##N##SpeedModifier; \
    layer.speed_limit = _Particle##N##SpeedLimit.xyz; \
    layer.dampen = _Particle##N##Dampen; \
    layer.drag = _Particle##N##Drag; \
    layer.force = _Particle##N##Force.xyz; \
    layer.size_over_lifetime = _Particle##N##SizeOverLifetime.xy; \
    layer.angular_velocity = _Particle##N##AngularVelocity.xyz; \
    layer.color_by_speed_range = _Particle##N##ColorBySpeedRange.xy; \
    layer.size_by_speed = _Particle##N##SizeBySpeed.xy; \
    layer.size_by_speed_range = _Particle##N##SizeBySpeedRange.xy; \
    layer.rotation_by_speed = _Particle##N##RotationBySpeed.xyz; \
    layer.rotation_by_speed_range = _Particle##N##RotationBySpeedRange.xy; \
    layer.noise_strength = _Particle##N##NoiseStrength; \
    layer.noise_frequency = _Particle##N##NoiseFrequency; \
    layer.noise_scroll_speed = _Particle##N##NoiseScrollSpeed; \
    layer.noise_octave_multiplier = _Particle##N##NoiseOctaveMultiplier; \
    layer.noise_octave_scale = _Particle##N##NoiseOctaveScale; \
    layer.noise_position_amount = _Particle##N##NoisePositionAmount; \
    layer.noise_rotation_amount = _Particle##N##NoiseRotationAmount; \
    layer.noise_size_amount = _Particle##N##NoiseSizeAmount;

// ============================================================================
// Unified Macros (convenience)
// ============================================================================

#define DECLARE_TEXT_LAYER_VARS(N) \
    DECLARE_VISIBILITY_VARS(N) \
    DECLARE_TRANSFORM_VARS(N) \
    DECLARE_APPEARANCE_VARS(N) \
    DECLARE_TYPEWRITER_VARS(N) \
    DECLARE_SPACING_VARS(N) \
    DECLARE_CURVE_VARS(N) \
    DECLARE_SHAKE_VARS(N) \
    DECLARE_SCATTER_VARS(N) \
    DECLARE_OUTLINE_VARS(N) \
    DECLARE_SHADOW_VARS(N) \
    DECLARE_SURFACE_VARS(N)

#define LOAD_TEXT_LAYER(N, layer) \
    LOAD_VISIBILITY(N, layer.visibility) \
    LOAD_TRANSFORM(N, layer.transform) \
    LOAD_APPEARANCE(N, layer.appearance) \
    LOAD_TYPEWRITER(N, layer.typewriter) \
    LOAD_BLOCK(N, layer.block) \
    LOAD_SPACING(N, layer.spacing) \
    LOAD_CURVE(N, layer.curve) \
    LOAD_SHAKE(N, layer.shake) \
    LOAD_SCATTER(N, layer.scatter) \
    LOAD_OUTLINE(N, layer.outline) \
    LOAD_SHADOW(N, layer.shadow) \
    LOAD_SURFACE(N, layer.noise)

#endif // TYPOGRAPHY_COMPONENTS_INCLUDED
