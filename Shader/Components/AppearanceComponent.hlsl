#ifndef TYPOGRAPHY_APPEARANCE_COMPONENT_INCLUDED
#define TYPOGRAPHY_APPEARANCE_COMPONENT_INCLUDED

struct AppearanceComponent
{
    float4 color;
    int font_index;
};

#define DECLARE_APPEARANCE_VARS(N) \
    float4 _TextColor##N; \
    int _FontIndex##N;

#define LOAD_APPEARANCE(N, c) \
    c.color = _TextColor##N; \
    c.font_index = _FontIndex##N;

#endif
