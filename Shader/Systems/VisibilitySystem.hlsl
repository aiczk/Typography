#ifndef TYPOGRAPHY_VISIBILITY_SYSTEM_INCLUDED
#define TYPOGRAPHY_VISIBILITY_SYSTEM_INCLUDED

// ============================================================================
// Visibility System
// Handles use/enabled check and typewriter visibility calculations
// ============================================================================

// Check if text layer is enabled
inline bool visibility_check(float use)
{
    return use >= 0.5;
}

// Typewriter visibility calculation (sequential mode)
// Returns anim_factor: 0 = fully visible, 1 = fully hidden
// smooth_width = number of characters in the fade zone
// progress = 0 → all hidden, progress = 1 → all visible
inline float calculate_typewriter_anim(
    int char_pos,
    uint char_count,
    int mode,
    float progress,
    float smooth_width)
{
    // Extend progress range so boundaries work correctly:
    // progress = 0 → all hidden, progress = 1 → all visible
    float total_range = (float)char_count + smooth_width;
    float extended_progress = total_range * saturate(progress);
    float fade_start = extended_progress - smooth_width;

    // Calculate effective position based on mode
    float effective_pos;
    if (mode == TYPEWRITER_LTR)
    {
        // Left to right: char 0 appears first
        effective_pos = (float)char_pos;
    }
    else if (mode == TYPEWRITER_RTL)
    {
        // Right to left: last char appears first
        effective_pos = (float)(char_count - 1 - char_pos);
    }
    else // TYPEWRITER_CENTER_OUT
    {
        // Center out: center chars appear first
        float center = (float)(char_count - 1) * 0.5;
        effective_pos = abs((float)char_pos - center) * 2.0;
    }

    // Calculate fade position: how far into the fade zone is this character?
    // t < 0: fully visible (before fade zone)
    // t = 0~1: fading (in fade zone)
    // t > 1: hidden (after fade zone)
    float t = (effective_pos - fade_start) / max(smooth_width, EPSILON);

    // Hard edge mode (smooth_width = 0)
    if (smooth_width <= EPSILON)
        return (effective_pos < fade_start + 0.5) ? 0.0 : 1.0;

    // Smooth fade with S-curve easing
    float visibility = 1.0 - saturate(t);
    visibility = ease_smooth(visibility);

    // Return anim_factor (inverted: 0 = visible, 1 = hidden)
    return 1.0 - visibility;
}

// Block mode visibility calculation
// Returns: is_visible, anim_factor, block_fade
struct BlockVisibility
{
    bool is_visible;
    float anim_factor;
    float block_fade;
};

inline BlockVisibility calculate_block_visibility(
    int char_pos,
    int block_visible,
    int block_animating,
    float progress,
    float smooth_width)
{
    BlockVisibility result;

    int total_display = block_visible + block_animating;
    bool is_animating = (char_pos >= block_visible) && (char_pos < total_display);
    result.is_visible = (char_pos < total_display);

    int pos_in_anim = max(char_pos - block_visible, 0);
    float max_delay = 1.0; // block_char_delay normalized
    float char_delay = (float)pos_in_anim / max((float)block_animating - 1.0, 1.0) * max_delay;
    float local_progress = saturate((progress - char_delay) * rcp(max(1.0 - char_delay, EPSILON)));

    float smooth_factor = (smooth_width <= EPSILON)
        ? ((local_progress >= 1.0 - EPSILON) ? 0.0 : 1.0)
        : (1.0 - saturate(local_progress / smooth_width));

    result.anim_factor = is_animating ? smooth_factor : 0.0;
    result.block_fade = 1.0 - result.anim_factor;

    return result;
}

// Combined typewriter visibility check
// Returns: is_visible, anim_factor, block_fade
struct TypewriterResult
{
    bool is_visible;
    float anim_factor;
    float block_fade;
};

inline TypewriterResult calculate_typewriter_visibility_full(
    int char_pos,
    uint char_count,
    int typewriter_type,
    int typewriter_mode,
    float typewriter_progress,
    float typewriter_smooth,
    int block_visible,
    int block_animating,
    float block_char_delay)
{
    TypewriterResult result;
    result.anim_factor = 0.0;
    result.block_fade = 1.0;
    result.is_visible = false;

    bool is_sequential = (typewriter_type == 0);

    if (is_sequential)
    {
        float anim = calculate_typewriter_anim(char_pos, char_count, typewriter_mode, typewriter_progress, typewriter_smooth);
        // Allow characters with any visibility to render (opacity handles the fade)
        // Only cull when completely invisible (anim >= 0.999)
        result.is_visible = (anim < 0.999);
        result.anim_factor = anim;
        result.block_fade = 1.0;
    }
    else
    {
        // Block mode with After Effects-style smooth transitions
        int total_display = block_visible + block_animating;
        bool is_animating = (char_pos >= block_visible) && (char_pos < total_display);
        // Extend visibility range slightly for smooth fade-in of next block
        result.is_visible = (char_pos < total_display + 1);

        int pos_in_anim = max(char_pos - block_visible, 0);
        float max_delay = block_char_delay;
        float char_delay = (float)pos_in_anim / max((float)block_animating - 1.0, 1.0) * max_delay;
        float local_progress = saturate((typewriter_progress - char_delay) * rcp(max(1.0 - char_delay, EPSILON)));

        // Apply easing to local_progress for smoother animation
        local_progress = ease_smooth(local_progress);

        float smooth_factor;
        if (typewriter_smooth <= EPSILON)
        {
            smooth_factor = (local_progress >= 1.0 - EPSILON) ? 0.0 : 1.0;
        }
        else
        {
            // Smooth fade using eased transition
            float visibility = saturate(local_progress / typewriter_smooth);
            visibility = ease_smooth(visibility);
            smooth_factor = 1.0 - visibility;
        }

        result.anim_factor = is_animating ? smooth_factor : 0.0;
        result.block_fade = 1.0 - result.anim_factor;
    }

    return result;
}

#endif // TYPOGRAPHY_VISIBILITY_SYSTEM_INCLUDED
