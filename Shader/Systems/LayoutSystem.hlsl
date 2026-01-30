#ifndef TYPOGRAPHY_LAYOUT_SYSTEM_INCLUDED
#define TYPOGRAPHY_LAYOUT_SYSTEM_INCLUDED

// ============================================================================
// Layout System
// Handles character positioning, spacing, and anchor calculations
// ============================================================================

// Layout result for a single character
struct LayoutResult
{
    float3 local_pos;
    float normalized_pos;  // 0-1 position in text for curve sampling
};

// Calculate character position with spacing and anchor
inline LayoutResult calculate_layout(
    int char_pos,
    uint char_count,
    float spacing,
    int spacing_anchor,
    int mode)  // 0=horizontal, 2=vertical
{
    LayoutResult result;

    float spacing_val = 1.0 + spacing;
    float step = spacing_val * TEXT_GLYPH_SCALE;
    float total_length = (char_count - 1) * step;
    float base_total = (char_count - 1) * TEXT_GLYPH_SCALE;

    // Anchor: 0=center, 1=left (keep left fixed), 2=right (keep right fixed)
    float start_pos;
    if (spacing_anchor == 1)
        start_pos = -base_total * 0.5;
    else if (spacing_anchor == 2)
        start_pos = base_total * 0.5 - total_length;
    else
        start_pos = -total_length * 0.5;

    float char_offset = start_pos + char_pos * step;

    // Mode: 0=horizontal (x-axis), 2=vertical (y-axis)
    result.local_pos = (mode == 2)
        ? float3(0, -char_offset, 0)
        : float3(char_offset, 0, 0);

    result.normalized_pos = (float)char_pos / max(char_count - 1, 1);

    return result;
}

// Calculate dynamic center alignment offset
inline float calculate_center_alignment(
    uint char_count,
    float spacing,
    int typewriter_type,
    int typewriter_mode,
    float typewriter_progress,
    float typewriter_center_smooth,
    int block_visible,
    int block_animating)
{
    float spacing_val = 1.0 + spacing;
    float step = spacing_val * TEXT_GLYPH_SCALE;
    float total_length = (char_count - 1) * step;
    float start_pos = -total_length * 0.5;

    float visible_start_f, visible_end_f;

    if (typewriter_type == 0)
    {
        // Sequential mode
        float progress_pos = typewriter_progress * (float)char_count;
        float discrete_end = ceil(progress_pos) - 1.0;
        float continuous_end = progress_pos - 1.0;
        float blended_end = lerp(discrete_end, continuous_end, typewriter_center_smooth);

        if (typewriter_mode == 1) // RTL
        {
            visible_end_f = (float)char_count - 1.0;
            visible_start_f = visible_end_f - blended_end;
        }
        else // LTR or CenterOut
        {
            visible_start_f = 0.0;
            visible_end_f = blended_end;
        }
    }
    else
    {
        // Block mode
        visible_start_f = 0.0;
        visible_end_f = (float)(block_visible + block_animating) - 1.0;
    }

    visible_start_f = max(0.0, visible_start_f);
    visible_end_f = clamp(visible_end_f, 0.0, (float)char_count - 1.0);

    float visible_left = start_pos + visible_start_f * step;
    float visible_right = start_pos + visible_end_f * step;

    return -(visible_left + visible_right) * 0.5;
}

#endif // TYPOGRAPHY_LAYOUT_SYSTEM_INCLUDED
