#ifndef TYPOGRAPHY_COMPONENTS_INCLUDED
#define TYPOGRAPHY_COMPONENTS_INCLUDED

#include "VisibilityComponent.hlsl"
#include "TransformComponent.hlsl"
#include "AppearanceComponent.hlsl"
#include "TypewriterComponent.hlsl"
#include "SpacingComponent.hlsl"
#include "CurveComponent.hlsl"
#include "ShakeComponent.hlsl"
#include "OutlineComponent.hlsl"
#include "ShadowComponent.hlsl"
#include "SurfaceComponent.hlsl"

// ============================================================================
// TextLayer: All components for a text layer
// ============================================================================
struct TextLayer
{
    VisibilityComponent visibility;
    TransformComponent transform;
    AppearanceComponent appearance;
    TypewriterComponent typewriter;
    BlockComponent block;
    SpacingComponent spacing;
    CurveComponent curve;
    ShakeComponent shake;
    OutlineComponent outline;
    ShadowComponent shadow;
    SurfaceComponent surface;
};

// ============================================================================
// Unified Macros (for convenience)
// ============================================================================
#define DECLARE_TEXT_LAYER_VARS(N) \
    DECLARE_VISIBILITY_VARS(N) \
    DECLARE_TRANSFORM_VARS(N) \
    DECLARE_APPEARANCE_VARS(N) \
    DECLARE_TYPEWRITER_VARS(N) \
    DECLARE_SPACING_VARS(N) \
    DECLARE_CURVE_VARS(N) \
    DECLARE_SHAKE_VARS(N) \
    DECLARE_OUTLINE_VARS(N) \
    DECLARE_SHADOW_VARS(N) \
    DECLARE_SURFACE_VARS(N)

#define LOAD_TEXT_LAYER(N, layer) \
    LOAD_VISIBILITY(N, layer.visibility) \
    LOAD_TRANSFORM(N, layer.transform) \
    LOAD_APPEARANCE(N, layer.appearance) \
    LOAD_TYPEWRITER(N, layer.typewriter) \
    LOAD_BLOCK(N, layer.block) \
    LOAD_SPACING(N, layer.spacing) \
    LOAD_CURVE(N, layer.curve) \
    LOAD_SHAKE(N, layer.shake) \
    LOAD_OUTLINE(N, layer.outline) \
    LOAD_SHADOW(N, layer.shadow) \
    LOAD_SURFACE(N, layer.surface)

#endif
