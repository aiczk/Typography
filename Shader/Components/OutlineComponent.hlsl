#ifndef TYPOGRAPHY_OUTLINE_COMPONENT_INCLUDED
#define TYPOGRAPHY_OUTLINE_COMPONENT_INCLUDED

struct OutlineComponent
{
    int mode;       // 0=outline, 1=stroke
    float width;
    float round;
    float4 color;
};

#define DECLARE_OUTLINE_VARS(N) \
    int _OutlineMode##N; \
    float _OutlineWidth##N; \
    float _OutlineRound##N; \
    float4 _OutlineColor##N;

#define LOAD_OUTLINE(N, c) \
    c.mode = _OutlineMode##N; \
    c.width = _OutlineWidth##N; \
    c.round = _OutlineRound##N; \
    c.color = _OutlineColor##N;

#endif
