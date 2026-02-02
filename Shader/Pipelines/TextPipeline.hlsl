#ifndef TYPOGRAPHY_TEXT_PIPELINE_INCLUDED
#define TYPOGRAPHY_TEXT_PIPELINE_INCLUDED

// ============================================================================
// Text Pipeline
// Orchestrates Systems for text rendering
// ============================================================================

// Dependencies: Core.hlsl, Effects.hlsl, Components.hlsl, Systems.hlsl
// must be included before this file

// ============================================================================
// Text Vertex Output (6 slots)
// ============================================================================
struct text_v2f
{
    float4 vertex : SV_POSITION;
    float2 glyph_uv : TEXCOORD0;
    nointerpolation uint4 char_packed : TEXCOORD1;     // char_index, packed_info, color.rg, color.ba
    nointerpolation uint4 outline_packed : TEXCOORD2; // width|round, _, color.rg, color.ba
    nointerpolation uint4 shadow_packed : TEXCOORD3;  // intensity|soft, offset.xy, color.rg, color.ba
    nointerpolation uint4 noise_packed : TEXCOORD4;   // intensity|scale, speed|char_offset, color.rg, color.ba
    nointerpolation uint2 anim_packed : TEXCOORD5;    // opacity|shake.x, shake.y|block_fade
    // TEXCOORD6-15: available for future use
    UNITY_VERTEX_OUTPUT_STEREO
};

typedef text_v2f v2f;

// ============================================================================
// Text Pipeline Entry Point
// ============================================================================
inline bool process_text(
    inout text_v2f o,
    float2 corner_uv,
    int char_pos,
    TextLayer layer,
    uint text_id,
    float3 cam_pos,
    float3x3 cam_rot_inv,
    float tan_half_fov,
    float aspect,
    float quad_padding_global,
    float dfc_enabled,
    Texture2D<float4> data_texture,
    float4 data_texture_texel_size)
{
    // Stage 1: Visibility
    if (!visibility_check(layer.visibility.use)) return false;

    // Stage 2: Data Load
    TextDataResult data = load_text_data(data_texture, data_texture_texel_size, text_id, char_pos);
    if (!data.valid || (uint)char_pos >= data.char_count) return false;

    // Stage 3: Typewriter Visibility
    TypewriterResult tw = calculate_typewriter_visibility_full(
        char_pos, data.char_count,
        layer.typewriter.type, layer.typewriter.mode,
        layer.typewriter.progress, layer.typewriter.smooth,
        layer.block.visible, layer.block.animating, layer.block.char_delay);
    if (!tw.is_visible) return false;

    // Stage 4: Layout
    LayoutResult layout = calculate_layout(
        char_pos, data.char_count,
        layer.spacing.spacing, layer.spacing.anchor,
        layer.visibility.mode);
    float3 local_pos = layout.local_pos;

    if (layer.typewriter.centering == 1)
    {
        float align = calculate_center_alignment(
            data.char_count, layout.spacing_val,
            layer.typewriter.type, layer.typewriter.mode,
            layer.typewriter.progress, layer.typewriter.center_smooth,
            layer.block.visible, layer.block.animating);
        local_pos += (layer.visibility.mode == 2) ? float3(0, -align, 0) : float3(align, 0, 0);
    }

    // Stage 5: Deformation
    TypewriterDeform tw_deform = calculate_typewriter_deform(
        tw.anim_factor, layer.typewriter.direction, layer.typewriter.rotation);
    local_pos += tw_deform.position_offset;

    CurveDeform curve_deform = calculate_curve_deform(
        layout.normalized_pos, data.char_count,
        layer.curve.intensity, layer.curve.rotation,
        layer.curve.speed, layer.curve.offset, layer.curve.center,
        layout.spacing_val, _Time.y,
        layer.curve.x_0, layer.curve.x_1,
        layer.curve.y_0, layer.curve.y_1,
        layer.curve.z_0, layer.curve.z_1);
    local_pos += curve_deform.position_offset;

    float2 shake_off = calculate_shake_deform(
        char_pos, _Time.y,
        layer.shake.amplitude, layer.shake.frequency, layer.shake.blend);

    // Stage 6: Transform
    TransformData xform = build_transform_unified(
        layer.transform.position, layer.transform.rotation,
        layer.transform.scale, layer.transform.pivot, PIVOT_SCALE_TEXT);
    float3 world_pos = transform_to_world(local_pos, xform);

    float3x3 root_mat; float3 root_pos;
    GET_ROOT_TRANSFORM(layer.transform.root_index, root_mat, root_pos)
    world_pos = apply_root(world_pos, layer.transform.root_index, root_mat, root_pos);

    // Stage 7: Culling
    float margin = calculate_margin_unified(layer.transform.scale.xyz, MARGIN_BASE_TEXT);
    if (cull_object(world_pos, layer.transform.world_space, dfc_enabled,
                    cam_pos, cam_rot_inv, tan_half_fov, aspect, margin))
        return false;

    // Stage 8: Quad
    float3x3 char_rot = build_char_rotation(
        tw_deform.rotation, curve_deform.rotation_z,
        xform.rotation_scale, layer.transform.root_index, root_mat);

    float qpad = 1.0 + quad_padding_global;
    float3 corner = expand_text_quad(
        world_pos, corner_uv, char_rot,
        layer.typewriter.scale.xyz, tw.anim_factor, qpad);

    // Stage 9: Projection
    o.vertex = project_vertex(corner, layer.transform.world_space,
                              cam_pos, cam_rot_inv, tan_half_fov, aspect,
                              layer.transform.layer);

    // Stage 10: Pack (6 slots total)
    o.glyph_uv = corner_uv;

    // char_packed: char identity + text color in single uint4
    // packed_info bit layout (see Constants.hlsl):
    // bits 0-7: font_index, bit 8: outline_mode, bit 9: world_space
    // bits 10-12: noise_mode, bits 13-14: blend_mode, bits 15-31: reserved
    o.char_packed = uint4(
        data.char_index,
        PACK_FONT_INDEX(data.font_index)
            | PACK_OUTLINE_MODE(layer.outline.mode)
            | PACK_WORLD_SPACE(layer.transform.world_space)
            | PACK_NOISE_MODE(layer.noise.mode)
            | PACK_BLEND_MODE(layer.noise.blend_mode),
        pack_f16x2(layer.appearance.color.r, layer.appearance.color.g),
        pack_f16x2(layer.appearance.color.b, layer.appearance.color.a));

    // Outline: params + color (qpad read from uniform in FS)
    o.outline_packed = uint4(
        pack_f16x2(layer.outline.width * 0.5, layer.outline.round),
        0,  // unused
        pack_f16x2(layer.outline.color.r, layer.outline.color.g),
        pack_f16x2(layer.outline.color.b, layer.outline.color.a));

    // Shadow: params + color in single uint4
    o.shadow_packed = uint4(
        pack_f16x2(layer.shadow.intensity, layer.shadow.softness),
        pack_f16x2(layer.shadow.offset.x, layer.shadow.offset.y),
        pack_f16x2(layer.shadow.color.r, layer.shadow.color.g),
        pack_f16x2(layer.shadow.color.b, 1.0));

    // Noise: params + color in single uint4
    o.noise_packed = uint4(
        pack_f16x2(layer.noise.intensity, layer.noise.scale),
        pack_f16x2(layer.noise.speed, layout.normalized_pos),
        pack_f16x2(layer.noise.color.r, layer.noise.color.g),
        pack_f16x2(layer.noise.color.b, 1.0));

    // Animation: opacity, shake, block_fade
    float opacity = 1.0 - tw.anim_factor;
    o.anim_packed = uint2(
        pack_f16x2(opacity, shake_off.x),
        pack_f16x2(shake_off.y, tw.block_fade));

    return true;
}

#endif
