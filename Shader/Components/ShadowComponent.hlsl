#ifndef TYPOGRAPHY_SHADOW_COMPONENT_INCLUDED
#define TYPOGRAPHY_SHADOW_COMPONENT_INCLUDED

// Shadow Component (SDF-based soft shadow)
struct ShadowComponent
{
    float intensity;        // Shadow/glow intensity
    float softness;         // Blur radius in em units (0 = hard shadow)
    float2 offset;          // Drop shadow offset
    float3 color;           // Shadow color
};

#define DECLARE_SHADOW_VARS(N) \
    float _ShadowIntensity##N; \
    float _ShadowSoftness##N; \
    float4 _ShadowOffset##N; \
    float4 _ShadowColor##N;

#define LOAD_SHADOW(N, c) \
    c.intensity = _ShadowIntensity##N; \
    c.softness = _ShadowSoftness##N; \
    c.offset = _ShadowOffset##N.xy; \
    c.color = _ShadowColor##N.rgb;

#endif
