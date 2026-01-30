#ifndef TYPOGRAPHY_SPACING_COMPONENT_INCLUDED
#define TYPOGRAPHY_SPACING_COMPONENT_INCLUDED

struct SpacingComponent
{
    float spacing;
    int anchor;  // 0=center, 1=left, 2=right
};

#define DECLARE_SPACING_VARS(N) \
    float _Spacing##N; \
    int _SpacingAnchor##N;

#define LOAD_SPACING(N, c) \
    c.spacing = _Spacing##N; \
    c.anchor = _SpacingAnchor##N;

#endif
