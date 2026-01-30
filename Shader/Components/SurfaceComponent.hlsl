#ifndef TYPOGRAPHY_SURFACE_COMPONENT_INCLUDED
#define TYPOGRAPHY_SURFACE_COMPONENT_INCLUDED

// Procedural Surface Effect Component
// Procedural noise-based surface effects
struct SurfaceComponent
{
    int mode;           // 0=Simplex, 1=Voronoi, 2=FBM, 3=Turbulence, 4=Ridged, 5=Marble
    float intensity;
    float scale;
    float speed;
    float3 color;
    int blend_mode;     // 0=Multiply, 1=Replace, 2=Add
};

#define DECLARE_SURFACE_VARS(N) \
    int _SurfaceMode##N; \
    float _SurfaceIntensity##N; \
    float _SurfaceScale##N; \
    float _SurfaceSpeed##N; \
    float4 _SurfaceColor##N; \
    int _SurfaceBlend##N;

#define LOAD_SURFACE(N, c) \
    c.mode = _SurfaceMode##N; \
    c.intensity = _SurfaceIntensity##N; \
    c.scale = _SurfaceScale##N; \
    c.speed = _SurfaceSpeed##N; \
    c.color = _SurfaceColor##N.rgb; \
    c.blend_mode = _SurfaceBlend##N;

#endif
