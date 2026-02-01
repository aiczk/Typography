#ifndef TYPOGRAPHY_PACKING_SYSTEM_INCLUDED
#define TYPOGRAPHY_PACKING_SYSTEM_INCLUDED

// ============================================================================
// Packing System
// Handles f16 packing/unpacking for vertex-to-fragment data transfer
// Note: Core pack/unpack functions are in Core.hlsl
// This file provides text-specific packing helpers
// ============================================================================

// packed_info bit layout defined in Constants.hlsl:
// bits 0-7:   font_index (8 bits)
// bit 8:      outline_mode (1 bit)
// bit 9:      world_space (1 bit)
// bits 10-12: surface_mode (3 bits)
// bits 13-14: blend_mode (2 bits)
// bits 15-31: reserved (17 bits)

// Unpack info bits helper (uses macros from Constants.hlsl)
inline void unpack_info(
    uint packed_info,
    out uint font_index,
    out uint outline_mode,
    out uint world_space,
    out uint surface_mode,
    out uint surface_blend_mode)
{
    font_index = UNPACK_FONT_INDEX(packed_info);
    outline_mode = UNPACK_OUTLINE_MODE(packed_info);
    world_space = UNPACK_WORLD_SPACE(packed_info);
    surface_mode = UNPACK_SURFACE_MODE(packed_info);
    surface_blend_mode = UNPACK_BLEND_MODE(packed_info);
}

#endif // TYPOGRAPHY_PACKING_SYSTEM_INCLUDED
