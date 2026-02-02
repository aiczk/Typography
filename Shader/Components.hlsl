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
    int blend_mode;     // 0=Multiply, 1=Replace, 2=Add
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
    OutlineComponent outline;
    ShadowComponent shadow;
    NoiseComponent noise;
};

// ============================================================================
// Particle Layer Component
// ============================================================================
struct ParticleLayer
{
    int space;          // 0=Screen, 1=World
    int multiplier;
    int distribution;   // 0=Sphere, 1=Cube
    int shape;          // 0=Circle, 1=Square, 2=Triangle, 3=Cross, 4=Random
    float size;
    float4 rotation;
    float hollow;
    float speed;
    float lifetime;
    float4 direction;
    float4 position;
    float4 scale;
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
    float4 _SurfaceColor##N; \
    int _SurfaceBlend##N;

#define DECLARE_PARTICLE_LAYER_VARS(N) \
    int _Particle##N##Space; \
    int _Particle##N##Multiplier; \
    int _Particle##N##Distribution; \
    int _Particle##N##Shape; \
    float _Particle##N##Size; \
    float4 _Particle##N##Rotation; \
    float _Particle##N##Hollow; \
    float _Particle##N##Speed; \
    float _Particle##N##Lifetime; \
    float4 _Particle##N##Direction; \
    float4 _Particle##N##Position; \
    float4 _Particle##N##Scale; \
    sampler2D _Particle##N##Gradient;

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
    c.color = _SurfaceColor##N.rgb; \
    c.blend_mode = _SurfaceBlend##N;

#define LOAD_PARTICLE_LAYER(N, layer) \
    layer.space = _Particle##N##Space; \
    layer.multiplier = _Particle##N##Multiplier; \
    layer.distribution = _Particle##N##Distribution; \
    layer.shape = _Particle##N##Shape; \
    layer.size = _Particle##N##Size; \
    layer.rotation = _Particle##N##Rotation; \
    layer.hollow = _Particle##N##Hollow; \
    layer.speed = _Particle##N##Speed; \
    layer.lifetime = _Particle##N##Lifetime; \
    layer.direction = _Particle##N##Direction; \
    layer.position = _Particle##N##Position; \
    layer.scale = _Particle##N##Scale;

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
    LOAD_OUTLINE(N, layer.outline) \
    LOAD_SHADOW(N, layer.shadow) \
    LOAD_SURFACE(N, layer.noise)

#endif // TYPOGRAPHY_COMPONENTS_INCLUDED
