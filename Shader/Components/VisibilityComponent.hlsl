#ifndef TYPOGRAPHY_VISIBILITY_COMPONENT_INCLUDED
#define TYPOGRAPHY_VISIBILITY_COMPONENT_INCLUDED

struct VisibilityComponent
{
    float use;
    int mode;  // 0=horizontal, 2=vertical
};

#define DECLARE_VISIBILITY_VARS(N) \
    float _Use##N; \
    int _Mode##N;

#define LOAD_VISIBILITY(N, c) \
    c.use = _Use##N; \
    c.mode = _Mode##N;

#endif
