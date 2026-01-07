using System.Collections.Generic;
using System.Globalization;

namespace Typography.Editor.Core
{
    /// <summary>
    /// Unified text element extraction for Unicode grapheme clusters.
    /// </summary>
    public static class TextElementExtractor
    {
        /// <summary>
        /// Extracts all text elements (grapheme clusters) from input string.
        /// Filters out control characters but keeps whitespace.
        /// </summary>
        public static List<string> ExtractElements(string text)
        {
            var elements = new List<string>();
            if (string.IsNullOrEmpty(text)) return elements;

            var enumerator = StringInfo.GetTextElementEnumerator(text);
            while (enumerator.MoveNext())
            {
                var element = enumerator.Current.ToString();
                if (!string.IsNullOrEmpty(element) && !char.IsControl(element[0]))
                    elements.Add(element);
            }
            return elements;
        }

        /// <summary>
        /// Extracts unique text elements, excluding control characters.
        /// Used for building character sets for atlas generation.
        /// </summary>
        public static List<string> ExtractUniqueElements(string text)
        {
            var elements = new List<string>();
            var seen = new HashSet<string>();
            if (string.IsNullOrEmpty(text)) return elements;

            var enumerator = StringInfo.GetTextElementEnumerator(text);
            while (enumerator.MoveNext())
            {
                var element = enumerator.Current.ToString();
                if (string.IsNullOrEmpty(element)) continue;
                if (char.IsControl(element[0])) continue;
                if (!seen.Add(element)) continue;
                elements.Add(element);
            }
            return elements;
        }

        /// <summary>
        /// Creates a character-to-index mapping from a mapping string.
        /// Index starts at baseIndex (typically 1, as 0 is reserved for null/padding).
        /// </summary>
        public static Dictionary<string, ushort> CreateMapping(string mappingString, int baseIndex = 1)
        {
            var mapping = new Dictionary<string, ushort>();
            var seen = new HashSet<string>();
            if (string.IsNullOrEmpty(mappingString)) return mapping;

            var enumerator = StringInfo.GetTextElementEnumerator(mappingString);
            var index = baseIndex;

            while (enumerator.MoveNext())
            {
                var element = enumerator.Current.ToString();
                if (string.IsNullOrEmpty(element) || char.IsControl(element[0])) continue;
                if (!seen.Add(element)) continue;
                mapping[element] = (ushort)index++;
            }
            return mapping;
        }
    }
}
