#ifndef TYPOGRAPHY_SYSTEMS_INCLUDED
#define TYPOGRAPHY_SYSTEMS_INCLUDED

// ============================================================================
// Systems Aggregator
// Include all system files in dependency order
// ============================================================================

// Note: Core.hlsl must be included before Systems
// Note: Effects.hlsl must be included for DeformationSystem curve functions

#include "VisibilitySystem.hlsl"
#include "DataLoadSystem.hlsl"
#include "LayoutSystem.hlsl"
#include "DeformationSystem.hlsl"
#include "TransformSystem.hlsl"
#include "CullingSystem.hlsl"
#include "QuadSystem.hlsl"
#include "ProjectionSystem.hlsl"
#include "PackingSystem.hlsl"

#endif // TYPOGRAPHY_SYSTEMS_INCLUDED
