#ifndef TYPOGRAPHY_IMAGE_PIPELINE_INCLUDED
#define TYPOGRAPHY_IMAGE_PIPELINE_INCLUDED

// ============================================================================
// Image Pipeline
// Orchestrates Systems for image rendering
// ============================================================================

// Dependencies: Core.hlsl, Systems/Systems.hlsl must be included before this file

// ============================================================================
// Image Input/Output Structures
// ============================================================================
struct image_appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
    float2 uv2 : TEXCOORD1;
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct image_v2f
{
    float4 vertex : SV_POSITION;
    float2 image_uv : TEXCOORD0;
    nointerpolation uint2 color_packed : TEXCOORD1;
    nointerpolation uint fade_id_packed : TEXCOORD2;
    nointerpolation uint2 chroma_packed : TEXCOORD3;
    nointerpolation uint chroma_extra : TEXCOORD4;
    UNITY_VERTEX_OUTPUT_STEREO
};

// ============================================================================
// Image Layer Components
// ============================================================================
struct ImageTransform
{
    float4 position;
    float4 rotation;
    float4 scale;
    float4 pivot;
    int world_space;
    int root_index;
    int layer;
};

struct FlipbookComponent
{
    float cols;
    float rows;
    float speed;
    float4 texture_st;
};

struct ChromaKeyComponent
{
    float4 key;
    float threshold;
    float feathering;
};

struct ImageLayer
{
    float use;
    float4 color;
    ImageTransform transform;
    FlipbookComponent flipbook;
    ChromaKeyComponent chroma;
};

// ============================================================================
// Image Macros
// ============================================================================
#define DECLARE_IMAGE_LAYER_VARS(N) \
    float _ImageUse##N; \
    int _ImageWorldSpace##N; \
    int _ImageRootIndex##N; \
    int _ImageLayer##N; \
    float4 _ImageColor##N; \
    float4 _ImagePosition##N; \
    float4 _ImageRotation##N; \
    float4 _ImageScale##N; \
    float4 _ImagePivot##N; \
    float _ImageFlipbookCols##N; \
    float _ImageFlipbookRows##N; \
    float _ImageFlipbookSpeed##N; \
    float4 _ImageChromaKey##N; \
    float _ImageChromaThreshold##N; \
    float _ImageChromaFeathering##N; \
    float4 _ImageTexture##N##_ST;

#define LOAD_IMAGE_LAYER(N, layer) \
    layer.use = _ImageUse##N; \
    layer.color = _ImageColor##N; \
    layer.transform.position = _ImagePosition##N; \
    layer.transform.rotation = _ImageRotation##N; \
    layer.transform.scale = _ImageScale##N; \
    layer.transform.pivot = _ImagePivot##N; \
    layer.transform.world_space = _ImageWorldSpace##N; \
    layer.transform.root_index = _ImageRootIndex##N; \
    layer.transform.layer = _ImageLayer##N; \
    layer.flipbook.cols = _ImageFlipbookCols##N; \
    layer.flipbook.rows = _ImageFlipbookRows##N; \
    layer.flipbook.speed = _ImageFlipbookSpeed##N; \
    layer.flipbook.texture_st = _ImageTexture##N##_ST; \
    layer.chroma.key = _ImageChromaKey##N; \
    layer.chroma.threshold = _ImageChromaThreshold##N; \
    layer.chroma.feathering = _ImageChromaFeathering##N;

// Declare all image layer variables
DECLARE_IMAGE_LAYER_VARS(0)
DECLARE_IMAGE_LAYER_VARS(1)
DECLARE_IMAGE_LAYER_VARS(2)
DECLARE_IMAGE_LAYER_VARS(3)
DECLARE_IMAGE_LAYER_VARS(4)
DECLARE_IMAGE_LAYER_VARS(5)
DECLARE_IMAGE_LAYER_VARS(6)
DECLARE_IMAGE_LAYER_VARS(7)
DECLARE_IMAGE_LAYER_VARS(8)
DECLARE_IMAGE_LAYER_VARS(9)

// ============================================================================
// Flipbook UV Calculation
// ============================================================================
inline float2 flipbook_uv(float2 uv, float cols, float rows, float tile)
{
    tile = floor(fmod(tile, cols * rows));
    float col = fmod(tile, cols);
    float row = rows - 1.0 - floor(tile / cols);
    return (uv + float2(col, row)) / float2(cols, rows);
}

// ============================================================================
// Image Pipeline Entry Point
// ============================================================================
inline bool process_image(
    inout image_v2f o,
    float2 corner_uv,
    ImageLayer layer,
    uint image_id,
    float3 cam_pos,
    float3x3 cam_rot_inv,
    float tan_half_fov,
    float aspect,
    float vr_scale)
{
    // Stage 1: Visibility
    if (!visibility_check(layer.use)) return false;

    // Stage 2: Transform (using unified transform system)
    TransformData xform = build_transform_unified(
        layer.transform.position, layer.transform.rotation,
        layer.transform.scale, layer.transform.pivot, vr_scale,
        PIVOT_SCALE_IMAGE);

    // Image world position with pivot offset (uses pre-computed xform.pivot)
    float3 pivot_offset = xform.pivot - mul(xform.rotation_scale, xform.pivot);
    float3 world_pos = xform.translation + pivot_offset;

    // Stage 3: Root Transform
    float3x3 root_mat; float3 root_pos;
    GET_ROOT_TRANSFORM(layer.transform.root_index, root_mat, root_pos)
    world_pos = apply_root(world_pos, layer.transform.root_index, root_mat, root_pos, vr_scale);

    // Stage 4: Culling (using Systems)
    float margin = calculate_image_margin(layer.transform.scale.xyz * vr_scale);
    if (cull_screen_space(world_pos, cam_pos, cam_rot_inv, tan_half_fov, aspect, margin))
        return false;

    // Stage 5: Quad (using Systems)
    float3x3 rot_scale = xform.rotation_scale;
    if (layer.transform.root_index > 0)
        rot_scale = mul(root_mat, rot_scale);

    float3 corner = expand_image_quad(world_pos, corner_uv, rot_scale);

    // Stage 6: Projection (using Systems)
    o.vertex = project_vertex(corner, layer.transform.world_space,
                              cam_pos, cam_rot_inv, tan_half_fov, aspect,
                              layer.transform.layer);

    // Stage 7: Pack
    o.color_packed = pack_f16x4(layer.color);
    o.fade_id_packed = (o.fade_id_packed & 0xFFFFu) | ((image_id & 0x1Fu) << 16);

    float tile = _Time.y * layer.flipbook.speed;
    o.image_uv = flipbook_uv(corner_uv, layer.flipbook.cols, layer.flipbook.rows, tile);
    o.image_uv = o.image_uv * layer.flipbook.texture_st.xy + layer.flipbook.texture_st.zw * _Time.y;

    o.chroma_packed = uint2(
        pack_f16x2(layer.chroma.key.r, layer.chroma.key.g),
        pack_f16x2(layer.chroma.key.b, layer.chroma.threshold));
    o.chroma_extra = f32tof16(layer.chroma.feathering);

    return true;
}

// ============================================================================
// Fragment Helpers
// ============================================================================
inline float4 unpack_image_color(uint2 packed)
{
    return unpack_f16x4(packed);
}

inline void unpack_chroma_key(uint2 chroma_packed, uint chroma_extra,
    out float3 key_color, out float cutoff, out float feathering)
{
    float2 rg = unpack_f16x2(chroma_packed.x);
    float2 bt = unpack_f16x2(chroma_packed.y);
    key_color = float3(rg.x, rg.y, bt.x);
    cutoff = bt.y;
    feathering = f16tof32(chroma_extra);
}

inline void apply_chroma_key(inout float4 color, float3 key_color, float cutoff, float feathering)
{
    if (cutoff < 0.001) return;
    float3 diff = color.rgb - key_color;
    float dist = sqrt(dot(diff, diff));
    color.a *= saturate((dist - cutoff) / max(feathering, 0.001));
}

inline void unpack_image_fade_id(uint packed, out float fade, out uint image_id)
{
    fade = f16tof32(packed & 0xFFFFu);
    image_id = (packed >> 16) & 0x1Fu;
}

inline float4 sample_image_texture(uint image_id, float2 uv)
{
    int idx = GetTextureLayerIndex(image_id, TEXTURE_TYPE_IMAGE);
    if (idx < 0) return float4(1, 1, 1, 1);
    return UNITY_SAMPLE_TEX2DARRAY(_TextureArray, float3(uv, idx));
}

#endif
