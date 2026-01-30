#ifndef TYPOGRAPHY_PARTICLE_COMPONENT_INCLUDED
#define TYPOGRAPHY_PARTICLE_COMPONENT_INCLUDED

// ============================================================================
// Particle Layer Component
// ============================================================================

struct ParticleLayer
{
    int space;          // 0=Screen, 1=World
    int multiplier;     // particles per vertex
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

#endif
