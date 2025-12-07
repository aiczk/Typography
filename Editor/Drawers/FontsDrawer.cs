using System.Collections.Generic;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Font list drawer using ReorderableList (non-reorderable).
    /// Stores font paths in material tags and provides a unified list UI.
    /// </summary>
    public class FontsDrawer : MaterialPropertyDrawer
    {
        private const string TagCountKey = "_Fonts_Count";
        private const string TagFontPrefix = "_Fonts_Font_";
        private const int MaxFonts = 8;
        private const float ElementHeight = 20f;
        private const float HeaderHeight = 18f;
        private const float FooterHeight = 20f;
        private const float Padding = 2f;

        // Cache per material instance
        private static readonly Dictionary<int, ReorderableListState> _stateCache = new();

        private class ReorderableListState
        {
            public List<Font> Fonts;
            public ReorderableList List;
            public Material Material;
        }

        public FontsDrawer() { }
        public FontsDrawer(string unused) { }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            var state = GetOrCreateState(prop, editor);
            if (state?.List == null) return ElementHeight;
            return state.List.GetHeight();
        }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            var state = GetOrCreateState(prop, editor);
            if (state?.List == null) return;
            
            // Adjust for MaterialPropertyDrawer indent
            Rect listRect = EditorGUI.IndentedRect(position);
            int oldIndent = EditorGUI.indentLevel;
            
            EditorGUI.indentLevel = 0;
            state.List.DoList(listRect);
            EditorGUI.indentLevel = oldIndent;
        }

        private ReorderableListState GetOrCreateState(MaterialProperty prop, MaterialEditor editor)
        {
            Material mat = editor?.target as Material;
            if (mat == null) return null;

            int instanceId = mat.GetInstanceID();

            if (!_stateCache.TryGetValue(instanceId, out var state) || state.Material != mat)
            {
                state = CreateState(mat);
                _stateCache[instanceId] = state;
            }

            return state;
        }

        private ReorderableListState CreateState(Material mat)
        {
            var state = new ReorderableListState
            {
                Material = mat,
                Fonts = LoadFonts(mat)
            };

            state.List = new ReorderableList(
                state.Fonts,
                typeof(Font),
                false,  // draggable = false (並び替え無効)
                true,   // displayHeader
                true,   // displayAddButton
                true    // displayRemoveButton
            )
            {
                elementHeight = ElementHeight,
                headerHeight = HeaderHeight,
                footerHeight = FooterHeight,

                drawHeaderCallback = rect =>
                {
                    EditorGUI.LabelField(rect, $"Fonts ({state.Fonts.Count})");
                },

                drawElementCallback = (rect, index, isActive, isFocused) =>
                {
                    rect.y += Padding;
                    rect.height = ElementHeight - Padding * 2;

                    // Index label
                    Rect indexRect = new Rect(rect.x, rect.y, 20f, rect.height);
                    EditorGUI.LabelField(indexRect, $"{index.ToString()}:", EditorStyles.boldLabel);

                    // Font field
                    Rect fontRect = new Rect(rect.x + 15f, rect.y, rect.width - 15f, rect.height);
                    EditorGUI.BeginChangeCheck();
                    Font newFont = (Font)EditorGUI.ObjectField(fontRect, state.Fonts[index], typeof(Font), false);
                    if (EditorGUI.EndChangeCheck())
                    {
                        state.Fonts[index] = newFont;
                        SaveFonts(mat, state.Fonts);
                    }
                },

                onAddCallback = list =>
                {
                    if (state.Fonts.Count < MaxFonts)
                    {
                        state.Fonts.Add(null);
                        SaveFonts(mat, state.Fonts);
                    }
                },

                onRemoveCallback = list =>
                {
                    if (list.index >= 0 && list.index < state.Fonts.Count)
                    {
                        state.Fonts.RemoveAt(list.index);
                        SaveFonts(mat, state.Fonts);
                    }
                },

                onCanAddCallback = list => state.Fonts.Count < MaxFonts,

                onCanRemoveCallback = list => state.Fonts.Count > 0
            };

            return state;
        }

        #region Static API (for external access)

        /// <summary>
        /// Gets all fonts from material (excludes trailing nulls).
        /// </summary>
        public static List<Font> GetAllFonts(Material mat)
        {
            var fonts = LoadFonts(mat);
            // Remove trailing nulls but keep intermediate nulls
            while (fonts.Count > 0 && fonts[fonts.Count - 1] == null)
                fonts.RemoveAt(fonts.Count - 1);
            return fonts;
        }

        /// <summary>
        /// Gets font at specific index.
        /// </summary>
        public static Font GetFont(Material mat, int index)
        {
            var fonts = LoadFonts(mat);
            return index >= 0 && index < fonts.Count ? fonts[index] : null;
        }

        #endregion

        #region Persistence

        private static List<Font> LoadFonts(Material mat)
        {
            var fonts = new List<Font>();

            string countStr = mat.GetTag(TagCountKey, false, "0");
            if (!int.TryParse(countStr, out int count))
                count = 0;

            // Migrate from old format if count is 0 but old tags exist
            if (count == 0)
            {
                fonts = MigrateFromOldFormat(mat);
                if (fonts.Count > 0)
                {
                    SaveFonts(mat, fonts);
                    return fonts;
                }
            }

            for (int i = 0; i < count; i++)
            {
                string path = mat.GetTag(TagFontPrefix + i, false, "");
                Font font = string.IsNullOrEmpty(path) ? null : AssetDatabase.LoadAssetAtPath<Font>(path);
                fonts.Add(font);
            }

            return fonts;
        }

        private static void SaveFonts(Material mat, List<Font> fonts)
        {
            Undo.RecordObject(mat, "Change Fonts");

            // Clear old entries first
            string oldCountStr = mat.GetTag(TagCountKey, false, "0");
            if (int.TryParse(oldCountStr, out int oldCount))
            {
                for (int i = fonts.Count; i < oldCount; i++)
                    mat.SetOverrideTag(TagFontPrefix + i, "");
            }

            // Save new entries
            mat.SetOverrideTag(TagCountKey, fonts.Count.ToString());
            for (int i = 0; i < fonts.Count; i++)
            {
                string path = fonts[i] != null ? AssetDatabase.GetAssetPath(fonts[i]) : "";
                mat.SetOverrideTag(TagFontPrefix + i, path);
            }

            EditorUtility.SetDirty(mat);

            // Invalidate cache
            int instanceId = mat.GetInstanceID();
            if (_stateCache.ContainsKey(instanceId))
                _stateCache.Remove(instanceId);
        }

        /// <summary>
        /// Migrate from old FontSettingDrawer format (_FontSetting_Font_N)
        /// </summary>
        private static List<Font> MigrateFromOldFormat(Material mat)
        {
            var fonts = new List<Font>();

            // Try multiple old formats
            string[] oldPrefixes = { "_FontSettings_Font_", "_FontSetting_Font_" };

            foreach (var oldPrefix in oldPrefixes)
            {
                for (int i = 0; i < MaxFonts; i++)
                {
                    string path = mat.GetTag(oldPrefix + i, false, "");
                    if (string.IsNullOrEmpty(path))
                        break;

                    Font font = AssetDatabase.LoadAssetAtPath<Font>(path);
                    if (font != null)
                        fonts.Add(font);
                    else
                        break;
                }

                if (fonts.Count > 0)
                    break;
            }

            return fonts;
        }

        #endregion
    }
}
