#ifndef TYPOGRAPHY_CONSTANTS_INCLUDED
#define TYPOGRAPHY_CONSTANTS_INCLUDED

// ============================================================================
// Numeric Constants
// ============================================================================
#define EPSILON         1e-6
#define UINT16_MAX      65535.0
#define DEG2_RAD        0.017453292519943295
#define HALF_PI         1.5707963267948966
#define TWO_PI          6.283185307179586
#define GOLDEN_ANGLE    2.3999632297286533

// ============================================================================
// Atlas Constants
// ============================================================================
#define ATLAS_TEXTURE_SIZE      4096.0
#define ATLAS_UV_INNER_SCALE    0.9375
#define ATLAS_UV_MARGIN         0.03125
#define EMRANGE                 0.3

// ============================================================================
// Text Constants
// ============================================================================
#define TEXT_COUNT              10
#define TEXT_GLYPH_SCALE        0.1
#define TEXTURE_DATA_EPSILON    0.5
#define CM_TO_METER_SCALE       0.01

// ============================================================================
// Unified Transform/Margin Constants
// ============================================================================
// Pivot scale factors for different pipeline types
#define PIVOT_SCALE_TEXT        TEXT_GLYPH_SCALE
#define PIVOT_SCALE_IMAGE       0.1

// Margin base sizes for culling calculations
#define MARGIN_BASE_TEXT        (TEXT_GLYPH_SCALE * 0.5)
#define MARGIN_BASE_IMAGE       0.05

// ============================================================================
// Depth Constants
// ============================================================================
#define SCREEN_SPACE_DEPTH_MAX  0.05
#define WORLD_SPACE_DEPTH_MIN   0.05

// ============================================================================
// Typewriter Modes
// ============================================================================
#define TYPEWRITER_LTR          0
#define TYPEWRITER_RTL          1
#define TYPEWRITER_CENTER_OUT   2

// ============================================================================
// Surface Effect Modes
// ============================================================================
#define SURFACE_MODE_SIMPLEX    0
#define SURFACE_MODE_CURL       1
#define SURFACE_MODE_FBM        2
#define SURFACE_MODE_TURBULENCE 3
#define SURFACE_MODE_RIDGED     4
#define SURFACE_MODE_MARBLE     5

// ============================================================================
// Texture Types
// ============================================================================
#define TEXTURE_TYPE_IMAGE      0

// ============================================================================
// Packed Info Bit Layout (VS->FS transfer)
// ============================================================================
// Contiguous layout for clarity and efficiency:
// bits 0-7:   font_index (8 bits)
// bit 8:      outline_mode (1 bit)
// bit 9:      world_space (1 bit)
// bits 10-12: surface_mode (3 bits)
// bits 13-14: blend_mode (2 bits)
// bits 15-31: [RESERVED - 17 bits for future use]
//
// Packing macros:
#define PACK_FONT_INDEX(x)      ((x) & 0xFFu)
#define PACK_OUTLINE_MODE(x)    (((x) & 0x1u) << 8)
#define PACK_WORLD_SPACE(x)     (((x) & 0x1u) << 9)
#define PACK_SURFACE_MODE(x)    (((x) & 0x7u) << 10)
#define PACK_BLEND_MODE(x)      (((x) & 0x3u) << 13)

// Unpacking macros:
#define UNPACK_FONT_INDEX(p)    ((p) & 0xFFu)
#define UNPACK_OUTLINE_MODE(p)  (((p) >> 8) & 0x1u)
#define UNPACK_WORLD_SPACE(p)   (((p) >> 9) & 0x1u)
#define UNPACK_SURFACE_MODE(p)  (((p) >> 10) & 0x7u)
#define UNPACK_BLEND_MODE(p)    (((p) >> 13) & 0x3u)

// ============================================================================
// v2f Slot Strategy (Vertex-to-Fragment Bandwidth)
// ============================================================================
// SM5.0 provides 16 TEXCOORD slots (TEXCOORD0-15) for v2f interpolators.
// Current usage (text_v2f): 12 slots (TEXCOORD0-11)
// Available: 4 slots (TEXCOORD12-15)
//
// Compression techniques applied:
// - f16 packing: 2 floats per uint (pack_f16x2)
// - Color merging: shadow.rgb + surface.rgb in single uint4
// - Bit-packed info: 5 fields in 15 bits (17 bits reserved)
//
// Future expansion strategies:
// 1. Merge world_pos (float3) + surface_normal (float3) using octahedral encoding
//    → Could save 2 slots (6 floats → 2 uints)
// 2. Pack glyph_uv into existing uint slot (10-bit each = 20 bits)
// 3. Move per-layer constants to StructuredBuffer (reduces v2f traffic)

#endif // TYPOGRAPHY_CONSTANTS_INCLUDED
