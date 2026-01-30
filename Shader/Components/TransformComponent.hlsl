#ifndef TYPOGRAPHY_TRANSFORM_COMPONENT_INCLUDED
#define TYPOGRAPHY_TRANSFORM_COMPONENT_INCLUDED

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

#define DECLARE_TRANSFORM_VARS(N) \
    float4 _Position##N; \
    float4 _Rotation##N; \
    float4 _Scale##N; \
    float4 _Pivot##N; \
    int _WorldSpace##N; \
    int _RootIndex##N; \
    int _Layer##N;

#define LOAD_TRANSFORM(N, c) \
    c.position = _Position##N; \
    c.rotation = _Rotation##N; \
    c.scale = _Scale##N; \
    c.pivot = _Pivot##N; \
    c.world_space = _WorldSpace##N; \
    c.root_index = _RootIndex##N; \
    c.layer = _Layer##N;

#endif
