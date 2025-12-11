using System.Collections.Generic;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Font list drawer using ReorderableList (non-reorderable).
    /// Fonts are stored per-Project in ProjectFontsStorage (shared across all materials with same Project).
    /// </summary>
    public class FontsDrawer : MaterialPropertyDrawer
    {
        private const int MaxFonts = 8;
        private const float ElementHeight = 20f;
        private const float HeaderHeight = 18f;
        private const float FooterHeight = 20f;
        private const float Padding = 2f;

        // Cache per project (not per material)
        private static readonly Dictionary<string, ReorderableListState> _stateCache = new();

        private class ReorderableListState
        {
            public List<Font> Fonts;
            public ReorderableList List;
            public string Project;
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

            string project = ProjectDrawer.GetProject(mat);

            // マイグレーション: 既存マテリアルタグからStorageへ
            ProjectFontsStorage.MigrateFromMaterialTags(project, mat);

            if (!_stateCache.TryGetValue(project, out var state) || state.Project != project)
            {
                state = CreateState(project);
                _stateCache[project] = state;
            }
            else
            {
                // Storageから最新のFontsを同期
                var storageFonts = ProjectFontsStorage.GetFonts(project);
                if (!FontsEqual(state.Fonts, storageFonts))
                {
                    state.Fonts.Clear();
                    state.Fonts.AddRange(storageFonts);
                }
            }

            return state;
        }

        private static bool FontsEqual(List<Font> a, List<Font> b)
        {
            if (a.Count != b.Count) return false;
            for (int i = 0; i < a.Count; i++)
                if (a[i] != b[i]) return false;
            return true;
        }

        private ReorderableListState CreateState(string project)
        {
            var state = new ReorderableListState
            {
                Project = project,
                Fonts = ProjectFontsStorage.GetFonts(project)
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
                    EditorGUI.LabelField(rect, $"Fonts ({state.Fonts.Count}) [Project: {project}]");
                },

                drawElementCallback = (rect, index, isActive, isFocused) =>
                {
                    rect.y += Padding;
                    rect.height = ElementHeight - Padding * 2;

                    // Index label
                    Rect indexRect = new Rect(rect.x, rect.y, 20f, rect.height);
                    EditorGUI.LabelField(indexRect, $"{index}:", EditorStyles.boldLabel);

                    // Font field
                    Rect fontRect = new Rect(rect.x + 15f, rect.y, rect.width - 15f, rect.height);
                    EditorGUI.BeginChangeCheck();
                    Font newFont = (Font)EditorGUI.ObjectField(fontRect, state.Fonts[index], typeof(Font), false);
                    if (EditorGUI.EndChangeCheck())
                    {
                        state.Fonts[index] = newFont;
                        ProjectFontsStorage.SetFonts(project, state.Fonts);
                    }
                },

                onAddCallback = list =>
                {
                    if (state.Fonts.Count < MaxFonts)
                    {
                        state.Fonts.Add(null);
                        ProjectFontsStorage.SetFonts(project, state.Fonts);
                    }
                },

                onRemoveCallback = list =>
                {
                    if (list.index >= 0 && list.index < state.Fonts.Count)
                    {
                        state.Fonts.RemoveAt(list.index);
                        ProjectFontsStorage.SetFonts(project, state.Fonts);
                    }
                },

                onCanAddCallback = list => state.Fonts.Count < MaxFonts,

                onCanRemoveCallback = list => state.Fonts.Count > 0
            };

            return state;
        }

        #region Static API (for external access)

        /// <summary>
        /// Gets all fonts for the material's project (excludes trailing nulls).
        /// </summary>
        public static List<Font> GetAllFonts(Material mat)
        {
            string project = ProjectDrawer.GetProject(mat);
            var fonts = ProjectFontsStorage.GetFonts(project);
            // Remove trailing nulls but keep intermediate nulls
            while (fonts.Count > 0 && fonts[fonts.Count - 1] == null)
                fonts.RemoveAt(fonts.Count - 1);
            return fonts;
        }

        /// <summary>
        /// Gets font at specific index for the material's project.
        /// </summary>
        public static Font GetFont(Material mat, int index)
        {
            string project = ProjectDrawer.GetProject(mat);
            var fonts = ProjectFontsStorage.GetFonts(project);
            return index >= 0 && index < fonts.Count ? fonts[index] : null;
        }

        /// <summary>
        /// Invalidates cache for a specific project.
        /// </summary>
        public static void InvalidateCache(string project)
        {
            if (_stateCache.ContainsKey(project))
                _stateCache.Remove(project);
        }

        /// <summary>
        /// Clears all cache.
        /// </summary>
        public static void ClearCache()
        {
            _stateCache.Clear();
        }

        #endregion
    }
}
