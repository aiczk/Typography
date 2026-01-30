#ifndef TYPOGRAPHY_TYPEWRITER_COMPONENT_INCLUDED
#define TYPOGRAPHY_TYPEWRITER_COMPONENT_INCLUDED

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

#endif
