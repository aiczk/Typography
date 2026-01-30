#ifndef TYPOGRAPHY_CURVE_COMPONENT_INCLUDED
#define TYPOGRAPHY_CURVE_COMPONENT_INCLUDED

struct CurveComponent
{
    float4 x_0, x_1;
    float4 y_0, y_1;
    float4 z_0, z_1;
    float intensity;
    float offset;
    float speed;
    float rotation;
    float4 center;
};

#define DECLARE_CURVE_VARS(N) \
    float4 _CurveDataX##N##_0; \
    float4 _CurveDataX##N##_1; \
    float4 _CurveDataY##N##_0; \
    float4 _CurveDataY##N##_1; \
    float4 _CurveDataZ##N##_0; \
    float4 _CurveDataZ##N##_1; \
    float _CurveIntensity##N; \
    float _CurveOffset##N; \
    float _CurveSpeed##N; \
    float _CurveRotation##N; \
    float4 _CurveCenter##N;

#define LOAD_CURVE(N, c) \
    c.x_0 = _CurveDataX##N##_0; \
    c.x_1 = _CurveDataX##N##_1; \
    c.y_0 = _CurveDataY##N##_0; \
    c.y_1 = _CurveDataY##N##_1; \
    c.z_0 = _CurveDataZ##N##_0; \
    c.z_1 = _CurveDataZ##N##_1; \
    c.intensity = _CurveIntensity##N; \
    c.offset = _CurveOffset##N; \
    c.speed = _CurveSpeed##N; \
    c.rotation = _CurveRotation##N; \
    c.center = _CurveCenter##N;

#endif
