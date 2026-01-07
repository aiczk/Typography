using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Font list drawer using ReorderableList (non-reorderable).
    /// Fonts are stored per-Project in TypographySettings (shared across all materials with same Project).
    /// </summary>
    public class FontsDrawer : MaterialPropertyDrawer
    {
        private const float ElementHeight = 20f;
        private const float HeaderHeight = 18f;
        private const float FooterHeight = 20f;
        private const float Padding = 2f;

        // Cache per project (not per material)
        private static readonly Dictionary<string, ReorderableListState> StateCache = new();

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
            var state = GetOrCreateState(editor);
            return state?.List?.GetHeight() ?? ElementHeight;
        }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            var state = GetOrCreateState(editor);
            if (state?.List == null) return;

            // Adjust for MaterialPropertyDrawer indent
            var listRect = EditorGUI.IndentedRect(position);
            var oldIndent = EditorGUI.indentLevel;

            EditorGUI.indentLevel = 0;
            state.List.DoList(listRect);
            EditorGUI.indentLevel = oldIndent;
        }

        private ReorderableListState GetOrCreateState(MaterialEditor editor)
        {
            if (editor?.target is not Material mat)
                return null;

            var project = ProjectDrawer.GetProject(mat);
            TypographySettings.MigrateFromMaterialTags(project, mat);

            if (!StateCache.TryGetValue(project, out var state))
            {
                state = CreateState(project);
                StateCache[project] = state;
                return state;
            }

            SyncFontsFromStorage(state, project);
            return state;
        }

        private static void SyncFontsFromStorage(ReorderableListState state, string project)
        {
            var storageFonts = TypographySettings.GetFonts(project);
            if (FontsEqual(state.Fonts, storageFonts))
                return;

            state.Fonts.Clear();
            state.Fonts.AddRange(storageFonts);
        }

        private static bool FontsEqual(List<Font> a, List<Font> b)
        {
            return a.Count == b.Count && !a.Where((t, i) => t != b[i]).Any();
        }

        private ReorderableListState CreateState(string project)
        {
            var state = new ReorderableListState
            {
                Project = project,
                Fonts = TypographySettings.GetFonts(project)
            };

            state.List = new ReorderableList(
                state.Fonts,
                typeof(Font),
                false,
                true,
                true,
                true
            )
            {
                elementHeight = ElementHeight,
                headerHeight = HeaderHeight,
                footerHeight = FooterHeight,

                drawHeaderCallback = rect =>
                {
                    EditorGUI.LabelField(rect, $"Fonts ({state.Fonts.Count}) [Project: {project}]");
                },

                drawElementCallback = (rect, index, _, _) =>
                {
                    rect.y += Padding;
                    rect.height = ElementHeight - Padding * 2;

                    // Index label
                    var indexRect = new Rect(rect.x, rect.y, 20f, rect.height);
                    EditorGUI.LabelField(indexRect, $"{index}:", EditorStyles.boldLabel);

                    // Font field
                    var fontRect = new Rect(rect.x + 15f, rect.y, rect.width - 15f, rect.height);
                    EditorGUI.BeginChangeCheck();
                    var newFont = (Font)EditorGUI.ObjectField(fontRect, state.Fonts[index], typeof(Font), false);
                    if (EditorGUI.EndChangeCheck())
                    {
                        state.Fonts[index] = newFont;
                        TypographySettings.SetFonts(project, state.Fonts);
                    }
                },

                onAddCallback = _ =>
                {
                    state.Fonts.Add(null);
                    TypographySettings.SetFonts(project, state.Fonts);
                },

                onRemoveCallback = list =>
                {
                    if (list.index < 0 || list.index >= state.Fonts.Count)
                        return;

                    state.Fonts.RemoveAt(list.index);
                    TypographySettings.SetFonts(project, state.Fonts);
                },

                onCanRemoveCallback = _ => state.Fonts.Count > 0
            };

            return state;
        }

        /// <summary>
        /// Gets all fonts for the material's project (excludes trailing nulls).
        /// </summary>
        public static List<Font> GetAllFonts(Material mat)
        {
            var project = ProjectDrawer.GetProject(mat);
            var fonts = TypographySettings.GetFonts(project);
            // Remove trailing nulls but keep intermediate nulls
            while (fonts.Count > 0 && fonts[^1] == null)
                fonts.RemoveAt(fonts.Count - 1);
            return fonts;
        }
    }
}
