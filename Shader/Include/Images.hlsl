#ifndef TYPOGRAPHY_IMAGES_INCLUDED
#define TYPOGRAPHY_IMAGES_INCLUDED

#include "Core.hlsl"

// ============================================================================
// Image Structures (separate from Text's v2f)
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
    float4 vertex : SV_POSITION;                     // 4
    float2 image_uv : TEXCOORD0;                     // 2 (interpolated for texture sampling)
    nointerpolation uint2 color_packed : TEXCOORD1; // 2 (RGBA as f16x4)
    nointerpolation uint fade_id_packed : TEXCOORD2;// 1 (fade:f16 | image_id:3bits << 16)
    nointerpolation uint2 chroma_packed : TEXCOORD3;// 2 (key_R|key_G, key_B|cutoff as f16x4)
    nointerpolation uint chroma_extra : TEXCOORD4;  // 1 (feathering|despill as f16x2)
    UNITY_VERTEX_OUTPUT_STEREO
};  // Total: 12 scalars

// ============================================================================
// Image Shader Variables
// ============================================================================
#define IMAGE_COUNT 32

// _TextureArray declared in Typography.shader (96 layers: Image 0-31, MatCap 32-63, Overlay 64-95)
SamplerState image_sampler_linear_repeat;

// ============================================================================
// Flipbook UV Calculation
// ============================================================================
// Calculates UV for sprite sheet animation
// cols: number of columns, rows: number of rows, tile: current frame (0-based)
inline float2 flipbook_uv(float2 uv, float cols, float rows, float tile)
{
    tile = floor(fmod(tile, cols * rows));  // Discretize to integer frame
    float col = fmod(tile, cols);
    float row = rows - 1.0 - floor(tile / cols);  // Top to bottom
    return (uv + float2(col, row)) / float2(cols, rows);
}

// ============================================================================
// Image Parameters Structure
// ============================================================================
struct ImageParams
{
    float use;
    int world_space;
    int root_index;
    int layer;
    float4 color;
    float4 position;
    float4 rotation;
    float4 scale;
    float4 pivot;
    float flipbook_cols;
    float flipbook_rows;
    float flipbook_speed;
    float4 chroma_key;
    float chroma_threshold;
    float chroma_feathering;
    float4 texture_st;
};

#define DECLARE_IMAGE_VARS(N) \
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

DECLARE_IMAGE_VARS(0)
DECLARE_IMAGE_VARS(1)
DECLARE_IMAGE_VARS(2)
DECLARE_IMAGE_VARS(3)
DECLARE_IMAGE_VARS(4)
DECLARE_IMAGE_VARS(5)
DECLARE_IMAGE_VARS(6)
DECLARE_IMAGE_VARS(7)
DECLARE_IMAGE_VARS(8)
DECLARE_IMAGE_VARS(9)
DECLARE_IMAGE_VARS(10)
DECLARE_IMAGE_VARS(11)
DECLARE_IMAGE_VARS(12)
DECLARE_IMAGE_VARS(13)
DECLARE_IMAGE_VARS(14)
DECLARE_IMAGE_VARS(15)
DECLARE_IMAGE_VARS(16)
DECLARE_IMAGE_VARS(17)
DECLARE_IMAGE_VARS(18)
DECLARE_IMAGE_VARS(19)
DECLARE_IMAGE_VARS(20)
DECLARE_IMAGE_VARS(21)
DECLARE_IMAGE_VARS(22)
DECLARE_IMAGE_VARS(23)
DECLARE_IMAGE_VARS(24)
DECLARE_IMAGE_VARS(25)
DECLARE_IMAGE_VARS(26)
DECLARE_IMAGE_VARS(27)
DECLARE_IMAGE_VARS(28)
DECLARE_IMAGE_VARS(29)
DECLARE_IMAGE_VARS(30)
DECLARE_IMAGE_VARS(31)

// Load image parameters from uniforms
#define LOAD_IMAGE_PARAMS(N, p) \
    p.use = _ImageUse##N; \
    p.world_space = _ImageWorldSpace##N; \
    p.root_index = _ImageRootIndex##N; \
    p.layer = _ImageLayer##N; \
    p.color = _ImageColor##N; \
    p.position = _ImagePosition##N; \
    p.rotation = _ImageRotation##N; \
    p.scale = _ImageScale##N; \
    p.pivot = _ImagePivot##N; \
    p.flipbook_cols = _ImageFlipbookCols##N; \
    p.flipbook_rows = _ImageFlipbookRows##N; \
    p.flipbook_speed = _ImageFlipbookSpeed##N; \
    p.chroma_key = _ImageChromaKey##N; \
    p.chroma_threshold = _ImageChromaThreshold##N; \
    p.chroma_feathering = _ImageChromaFeathering##N; \
    p.texture_st = _ImageTexture##N##_ST;

// ============================================================================
// Image Processing Function
// ============================================================================
inline bool process_image(
    inout image_v2f o,
    float2 corner_uv,
    ImageParams p,
    uint image_id,
    float3 cam_pos,
    float3x3 cam_rot_inv,  // Pre-transposed camera rotation matrix
    float tan_half_fov,
    float aspect,
    float vr_scale)
{
    if (p.use < 0.5) return false;

    float3 image_translation = p.position.xyz * CM_TO_METER_SCALE * vr_scale;
    float3 image_scale = p.scale.xyz * vr_scale;
    float3 pivot = p.pivot.xyz * 0.1;

    bool has_rotation = any(p.rotation.xyz != 0);
    float3x3 rotation_scale;
    [branch]
    if (has_rotation)
    {
        float3 rot_rad = p.rotation.xyz * DEG2_RAD;
        float3x3 image_rot = rotation_matrix(rot_rad);
        rotation_scale = float3x3(
            image_rot._m00 * image_scale.x, image_rot._m01 * image_scale.y, image_rot._m02 * image_scale.z,
            image_rot._m10 * image_scale.x, image_rot._m11 * image_scale.y, image_rot._m12 * image_scale.z,
            image_rot._m20 * image_scale.x, image_rot._m21 * image_scale.y, image_rot._m22 * image_scale.z);
    }
    else
    {
        rotation_scale = float3x3(
            image_scale.x, 0, 0,
            0, image_scale.y, 0,
            0, 0, image_scale.z);
    }

    float3 pivot_offset = pivot - mul(rotation_scale, pivot);
    float3 world_pos = image_translation + pivot_offset;

    float3x3 root_matrix_cached; float3 root_pos_cached;
    GET_ROOT_TRANSFORM(p.root_index, root_matrix_cached, root_pos_cached)
    world_pos = apply_root_transform(world_pos, p.root_index, root_matrix_cached, root_pos_cached, vr_scale);

    float image_half_size = 0.05;
    float margin = image_half_size * max(image_scale.x, image_scale.y) * 2.0;
    if (frustum_cull_screen(world_pos, margin, cam_pos, cam_rot_inv, tan_half_fov, aspect)) return false;

    float3x3 image_rotation_scale = rotation_scale;
    if (p.root_index > 0) { image_rotation_scale = mul(root_matrix_cached, image_rotation_scale); }

    float3 world_right = image_rotation_scale._m00_m10_m20 * image_half_size;
    float3 world_up = image_rotation_scale._m01_m11_m21 * image_half_size;
    float3 corner_offset = (corner_uv.x - 0.5) * 2.0 * world_right + (corner_uv.y - 0.5) * 2.0 * world_up;
    float3 corner_world = world_pos + corner_offset;

    if (p.world_space == 1) { o.vertex = project_world_space(corner_world); }
    else { o.vertex = project_custom_camera(corner_world, cam_pos, cam_rot_inv, tan_half_fov, aspect, p.layer); }

    o.color_packed = pack_f16x4(p.color);
    o.fade_id_packed = (o.fade_id_packed & 0xFFFFu) | ((image_id & 0x1Fu) << 16);

    // Flipbook UV calculation
    float tile = _Time.y * p.flipbook_speed;
    o.image_uv = flipbook_uv(corner_uv, p.flipbook_cols, p.flipbook_rows, tile);
    // Apply tiling and animated offset
    o.image_uv = o.image_uv * p.texture_st.xy + p.texture_st.zw * _Time.y;

    // Chroma Key packing
    o.chroma_packed = uint2(pack_f16x2(p.chroma_key.r, p.chroma_key.g), pack_f16x2(p.chroma_key.b, p.chroma_threshold));
    o.chroma_extra = f32tof16(p.chroma_feathering);

    return true;
}

// ============================================================================
// Image Fragment Helpers
// ============================================================================

// Unpack color from uint2 (f16x4)
inline float4 unpack_image_color(uint2 packed)
{
    return unpack_f16x4(packed);
}

// ============================================================================
// Chroma Key (RGB-based, optimized for CG/game textures)
// ============================================================================

// Unpack chroma key parameters
// chroma_packed.x: key_R | key_G
// chroma_packed.y: key_B | cutoff
// chroma_extra: feathering
inline void unpack_chroma_key(uint2 chroma_packed, uint chroma_extra, out float3 key_color, out float cutoff, out float feathering)
{
    float2 rg = unpack_f16x2(chroma_packed.x);
    float2 bt = unpack_f16x2(chroma_packed.y);
    key_color = float3(rg.x, rg.y, bt.x);
    cutoff = bt.y;
    feathering = f16tof32(chroma_extra);
}

// Apply chroma key effect
inline void apply_chroma_key(inout float4 color, float3 key_color, float cutoff, float feathering)
{
    if (cutoff < 0.001) return;

    // RGB distance (simple and predictable for CG textures)
    float3 diff = color.rgb - key_color;
    float dist = sqrt(dot(diff, diff));

    // mask: 0 = transparent (key color), 1 = opaque (keep)
    color.a *= saturate((dist - cutoff) / max(feathering, 0.001));
}

// Unpack fade and image_id from uint
inline void unpack_image_fade_id(uint packed, out float fade, out uint image_id)
{
    fade = f16tof32(packed & 0xFFFFu);
    image_id = (packed >> 16) & 0x1Fu;
}

// Sample image texture by id (uses combined Texture2DArray with dynamic layer)
inline float4 sample_image_texture(uint image_id, float2 uv)
{
    int layer = GetTextureLayerIndex(image_id, TEXTURE_TYPE_IMAGE);
    if (layer < 0) return float4(1, 1, 1, 1);  // No texture assigned
    return UNITY_SAMPLE_TEX2DARRAY(_TextureArray, float3(uv, layer));
}

#endif // TYPOGRAPHY_IMAGES_INCLUDED
