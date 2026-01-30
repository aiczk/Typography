#ifndef TYPOGRAPHY_PACKING_SYSTEM_INCLUDED
#define TYPOGRAPHY_PACKING_SYSTEM_INCLUDED

// ============================================================================
// Packing System
// Handles f16 packing/unpacking for vertex-to-fragment data transfer
// Note: Core pack/unpack functions are in Core.hlsl
// This file provides text-specific packing helpers
// ============================================================================

// Pack text fragment data
struct TextPackedData
{
    uint2 text_color;       // RGBA as f16x4
    uint2 outline;          // x: width*0.5|round, y: quad_padding|falloff as f16
    uint2 outline_color;    // RGBA as f16x4
    uint2 glow;             // x: intensity|spread, y: radius|offset.x as f16
    uint2 glow_color;       // x: r|g, y: b|offset.y as f16
    uint packed_info;       // font:8, unused:10, outline_mode:1, text_id:5, world_space:1, surface_mode:3, surface_blend:2
    uint2 anim_packed;      // opacity_mult|shake.x, shake.y|block_fade as f16
    uint2 texturing;        // surface_intensity|surface_scale, surface_speed|_ as f16
};

// Unpack info bits helper
inline void unpack_info(
    uint packed_info,
    out uint font_index,
    out uint outline_mode,
    out uint text_id,
    out uint world_space,
    out uint surface_mode,
    out uint surface_blend_mode)
{
    font_index = packed_info & 0xFFu;
    outline_mode = (packed_info >> 18) & 0x1u;
    text_id = (packed_info >> 19) & 0x1Fu;
    world_space = (packed_info >> 24) & 0x1u;
    surface_mode = (packed_info >> 25) & 0x7u;
    surface_blend_mode = (packed_info >> 28) & 0x3u;
}

#endif // TYPOGRAPHY_PACKING_SYSTEM_INCLUDED
