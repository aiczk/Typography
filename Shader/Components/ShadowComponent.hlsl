#ifndef TYPOGRAPHY_SHADOW_COMPONENT_INCLUDED
#define TYPOGRAPHY_SHADOW_COMPONENT_INCLUDED

// Shadow Component (original implementation)
struct ShadowComponent
{
    float intensity;        // Shadow/glow intensity
    float softness;         // Blur radius (0 = hard shadow)
    int dither_type;        // 0=Uniform, 1=Golden, 2=Halton
    int samples;            // Sample count (4/8/16/32)
    float2 offset;          // Drop shadow offset
    float3 color;           // Shadow color
};

#define DECLARE_SHADOW_VARS(N) \
    float _ShadowIntensity##N; \
    float _ShadowSoftness##N; \
    int _ShadowDitherType##N; \
    int _ShadowSamples##N; \
    float4 _ShadowOffset##N; \
    float4 _ShadowColor##N;

#define LOAD_SHADOW(N, c) \
    c.intensity = _ShadowIntensity##N; \
    c.softness = _ShadowSoftness##N; \
    c.dither_type = _ShadowDitherType##N; \
    c.samples = _ShadowSamples##N; \
    c.offset = _ShadowOffset##N.xy; \
    c.color = _ShadowColor##N.rgb;

#endif
