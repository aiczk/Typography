using System.Collections.Generic;
using System.Linq;
using Typography.Editor.Core;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Content drawer for Typography shader.
    /// Handles Text mode UI (TextInput + FontIndex + Gen button).
    /// </summary>
    public class ContentDrawer : MaterialPropertyDrawer
    {
        private const string TagTextPrefix = "_TextInput_Text_";
        private const int MaxTextInputs = 10;

        private static float RowHeight => EditorGUIUtility.singleLineHeight;
        private const float ButtonWidth = 50f;

        private static readonly Dictionary<string, string> TextCaches = new();

        public ContentDrawer() { }
        public ContentDrawer(string unused) { }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            var mat = (Material)prop.targets[0];
            var id = GetIdFromPropertyName(prop.name);
            DrawTextMode(position, mat, id, label);
        }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return RowHeight * 2 + 2f;
        }

        private void DrawTextMode(Rect position, Material mat, string id, GUIContent label)
        {
            var cacheKey = $"{mat.GetInstanceID()}_{id}";
            if (!TextCaches.TryGetValue(cacheKey, out var text))
            {
                text = LoadText(mat, id);
                TextCaches[cacheKey] = text;
            }

            var fonts = FontsDrawer.GetAllFonts(mat);

            var textRect = new Rect(position.x, position.y, position.width - ButtonWidth - 4f, RowHeight);
            var buttonRect = new Rect(position.xMax - ButtonWidth, position.y, ButtonWidth, RowHeight);

            EditorGUI.BeginChangeCheck();
            var newText = EditorGUI.TextField(textRect, label, text);
            if (EditorGUI.EndChangeCheck())
            {
                TextCaches[cacheKey] = newText;
                SaveText(mat, id, newText);
            }

            var allTexts = GetAllTexts(mat);
            var hasAnyText = allTexts.Exists(t => !string.IsNullOrEmpty(t?.Trim()));
            using (new EditorGUI.DisabledScope(fonts.Count == 0 || !hasAnyText))
            {
                if (GUI.Button(buttonRect, "Gen"))
                    TypographyPipeline.Generate(mat, fonts);
            }

            var fontRect = new Rect(position.x, position.y + RowHeight + 2f, position.width, RowHeight);
            DrawFontPopup(fontRect, mat, id, fonts);
        }

        private void DrawFontPopup(Rect position, Material mat, string id, List<Font> fonts)
        {
            var fontPropName = $"_FontIndex{id}";
            if (!mat.HasProperty(fontPropName)) return;

            var options = fonts.Count == 0 ? new[] { "(None)" } : fonts.Select(f => f != null ? f.name : "(None)").ToArray();
            var values = fonts.Count == 0 ? new[] { 0 } : Enumerable.Range(0, fonts.Count).ToArray();

            var currentValue = Mathf.Min(mat.GetInt(fontPropName), Mathf.Max(0, fonts.Count - 1));

            EditorGUI.BeginChangeCheck();
            var newValue = EditorGUI.IntPopup(position, "Font", currentValue, options, values);
            if (EditorGUI.EndChangeCheck())
            {
                Undo.RecordObject(mat, "Change Font");
                mat.SetInt(fontPropName, newValue);
                EditorUtility.SetDirty(mat);
            }
        }

        private static string GetIdFromPropertyName(string propName)
        {
            var i = propName.Length - 1;
            while (i >= 0 && char.IsDigit(propName[i])) i--;
            return i < propName.Length - 1 ? propName.Substring(i + 1) : "0";
        }

        
        public static string GetText(Material mat, string id) => mat.GetTag(TagTextPrefix + id, false, "");
        private static string LoadText(Material mat, string id) => mat.GetTag(TagTextPrefix + id, false, "");

        private static void SaveText(Material mat, string id, string text)
        {
            Undo.RecordObject(mat, "Change Text");
            mat.SetOverrideTag(TagTextPrefix + id, text);
            EditorUtility.SetDirty(mat);
        }

        public static List<string> GetAllTexts(Material mat)
        {
            var texts = new List<string>();
            var lastNonEmpty = -1;

            for (var i = 0; i < MaxTextInputs; i++)
                if (!string.IsNullOrEmpty(GetText(mat, i.ToString())))
                    lastNonEmpty = i;

            for (var i = 0; i <= lastNonEmpty; i++)
                texts.Add(GetText(mat, i.ToString()) ?? "");

            return texts;
        }

        public static List<int> GetAllFontIndices(Material mat, int textCount)
        {
            var indices = new List<int>();
            for (var i = 0; i < textCount; i++)
            {
                var propName = $"_FontIndex{i}";
                indices.Add(mat.HasProperty(propName) ? mat.GetInt(propName) : 0);
            }
            return indices;
        }
    }
}
