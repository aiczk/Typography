#ifndef TYPOGRAPHY_SHAKE_COMPONENT_INCLUDED
#define TYPOGRAPHY_SHAKE_COMPONENT_INCLUDED

struct ShakeComponent
{
    float amplitude;
    float frequency;
    float blend;
};

#define DECLARE_SHAKE_VARS(N) \
    float _ShakeAmplitude##N; \
    float _ShakeFrequency##N; \
    float _ShakeBlend##N;

#define LOAD_SHAKE(N, c) \
    c.amplitude = _ShakeAmplitude##N; \
    c.frequency = _ShakeFrequency##N; \
    c.blend = _ShakeBlend##N;

#endif
