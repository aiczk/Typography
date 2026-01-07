using System.Collections.Generic;
using UnityEngine;

namespace Typography.Editor.Core
{
    /// <summary>
    /// Encodes text data into GPU-readable texture format.
    /// </summary>
    public static class DataTextureEncoder
    {
        /// <summary>
        /// Encodes multiple text lines into a RGBA64 data texture.
        /// </summary>
        /// <param name="texts">List of text strings to encode</param>
        /// <param name="fontIndices">Font index for each text line</param>
        /// <param name="perFontMappings">Character mappings per font</param>
        /// <param name="fontIndexToArrayIndex">Maps font index to texture array layer</param>
        /// <returns>Encoded data texture or null if no texts</returns>
        public static Texture2D Encode(
            List<string> texts,
            List<int> fontIndices,
            List<Dictionary<string, ushort>> perFontMappings,
            Dictionary<int, int> fontIndexToArrayIndex)
        {
            if (texts == null || texts.Count == 0)
                return null;

            // Calculate dimensions
            var maxChars = 0;
            foreach (var text in texts)
            {
                var count = TextElementExtractor.ExtractElements(text).Count;
                if (count > maxChars) maxChars = count;
            }

            var charsAfterFirst2 = Mathf.Max(0, maxChars - 2);
            var width = Mathf.Max(1, 1 + Mathf.CeilToInt(charsAfterFirst2 / 4.0f));
            var height = texts.Count;

            var texture = new Texture2D(width, height, TextureFormat.RGBA64, false)
            {
                filterMode = FilterMode.Point,
                wrapMode = TextureWrapMode.Clamp,
                anisoLevel = 0
            };

            var pixels = new Color[width * height];

            for (var y = 0; y < height; y++)
            {
                var fontIdx = y < fontIndices.Count ? fontIndices[y] : 0;
                var charMapping = fontIdx < perFontMappings.Count
                    ? perFontMappings[fontIdx]
                    : new Dictionary<string, ushort>();
                var arrayIndex = fontIndexToArrayIndex.TryGetValue(fontIdx, out var idx) ? idx : 0;

                var lineElements = TextElementExtractor.ExtractElements(texts[y]);
                var pixelY = height - 1 - y;

                for (var x = 0; x < width; x++)
                {
                    pixels[pixelY * width + x] = x == 0
                        ? EncodeHeaderPixel(lineElements, charMapping, arrayIndex)
                        : EncodeCharPixel(x, lineElements, charMapping);
                }
            }

            texture.SetPixels(pixels);
            texture.Apply();
            return texture;
        }

        /// <summary>
        /// Encodes header pixel: character count, font array index, first 2 characters.
        /// </summary>
        private static Color EncodeHeaderPixel(
            List<string> elements,
            Dictionary<string, ushort> charMapping,
            int fontArrayIndex)
        {
            return new Color(
                elements.Count / 65535.0f,
                fontArrayIndex / 65535.0f,
                GetCharIndexNormalized(elements, 0, charMapping),
                GetCharIndexNormalized(elements, 1, charMapping)
            );
        }

        /// <summary>
        /// Encodes character pixel: 4 characters per pixel.
        /// </summary>
        private static Color EncodeCharPixel(
            int x,
            List<string> elements,
            Dictionary<string, ushort> charMapping)
        {
            var baseIdx = 2 + (x - 1) * 4;
            return new Color(
                GetCharIndexNormalized(elements, baseIdx, charMapping),
                GetCharIndexNormalized(elements, baseIdx + 1, charMapping),
                GetCharIndexNormalized(elements, baseIdx + 2, charMapping),
                GetCharIndexNormalized(elements, baseIdx + 3, charMapping)
            );
        }

        /// <summary>
        /// Gets normalized character index (0-1 range for 16-bit storage).
        /// </summary>
        private static float GetCharIndexNormalized(
            List<string> elements,
            int idx,
            Dictionary<string, ushort> charToIndex)
        {
            if (idx >= elements.Count) return 0f;
            return charToIndex.TryGetValue(elements[idx], out var charIdx)
                ? charIdx / 65535.0f
                : 0f;
        }
    }
}
