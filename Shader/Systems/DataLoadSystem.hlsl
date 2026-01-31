#ifndef TYPOGRAPHY_DATALOAD_SYSTEM_INCLUDED
#define TYPOGRAPHY_DATALOAD_SYSTEM_INCLUDED

// ============================================================================
// Data Load System
// Handles texture data loading for text characters
// ============================================================================

// Text data result from texture
struct TextDataResult
{
    uint char_count;
    uint font_index;
    uint char_index;
    bool valid;
};

// Complete text data loading
// Loads metadata (char_count, font_index) and character index in single function
// to avoid redundant texture_y calculation
inline TextDataResult load_text_data(
    Texture2D<float4> data_texture,
    float4 data_texture_texel_size,
    uint text_id,
    int char_pos)
{
    TextDataResult result;
    result.valid = false;
    result.char_count = 0;
    result.font_index = 0;
    result.char_index = 0;

    // Single texel_y calculation (was duplicated in separate functions)
    int2 texture_size = int2(data_texture_texel_size.zw);
    int texel_y = texture_size.y - 1 - text_id;

    // Load metadata from pixel 0
    float4 meta_pixel = data_texture.Load(int3(0, texel_y, 0));
    result.char_count = (uint)(meta_pixel.r * UINT16_MAX + TEXTURE_DATA_EPSILON);
    result.font_index = (uint)(meta_pixel.g * UINT16_MAX + TEXTURE_DATA_EPSILON);

    // Load character index
    // First 2 chars packed in meta_pixel.ba, rest in subsequent pixels
    float char_value;
    if (char_pos < 2)
    {
        char_value = (char_pos == 0) ? meta_pixel.b : meta_pixel.a;
    }
    else
    {
        int adjusted_pos = char_pos - 2;
        int pixel_x = 1 + (adjusted_pos >> 2);
        uint channel = adjusted_pos & 3u;
        float4 extra_pixel = data_texture.Load(int3(pixel_x, texel_y, 0));
        char_value = extract_channel(extra_pixel, channel);
    }

    result.char_index = (uint)(char_value * UINT16_MAX + TEXTURE_DATA_EPSILON);
    result.valid = (result.char_index != 0);

    return result;
}

#endif // TYPOGRAPHY_DATALOAD_SYSTEM_INCLUDED
