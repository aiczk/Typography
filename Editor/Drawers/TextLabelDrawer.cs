using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Overlay drawer that draws TextInput content on ThryEditor's group header.
    ///
    /// Usage: Place immediately after m_end:
    ///   [HideInInspector] m_start_text_setting0 ("", Float) = 0
    ///       ...
    ///   [HideInInspector] m_end_text_setting0 ("", Float) = 0
    ///   [TextLabel] _TextLabel0 ("Text Settings 0", Int) = 0
    /// </summary>
    public class TextLabelDrawer : MaterialPropertyDrawer
    {
        private static GUIStyle _labelStyle;
        private static GUIStyle LabelStyle
        {
            get
            {
                _labelStyle ??= new GUIStyle(EditorStyles.label)
                {
                    font = new GUIStyle(EditorStyles.label).font,
                    fontSize = GUI.skin.font.fontSize,
                    alignment = TextAnchor.MiddleLeft
                };
                return _labelStyle;
            }
        }

        public TextLabelDrawer() { }
        public TextLabelDrawer(string unused) { }

        private static string GetIdFromPropertyName(string propName)
        {
            int i = propName.Length - 1;
            while (i >= 0 && char.IsDigit(propName[i]))
                i--;
            return i < propName.Length - 1 ? propName.Substring(i + 1) : "0";
        }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return -EditorGUIUtility.standardVerticalSpacing - 2f;
        }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            Material mat = editor?.target as Material;
            if (mat == null) return;

            string id = GetIdFromPropertyName(prop.name);

            // Check Mode
            string modePropName = $"_Mode{id}";
            int mode = mat.HasProperty(modePropName) ? mat.GetInt(modePropName) : 0;

            string displayLabel;
            if (mode == 1)
            {
                // Image mode: show "Image: texturename"
                string imgPropName = $"_ImageTexture{id}";
                Texture tex = mat.HasProperty(imgPropName) ? mat.GetTexture(imgPropName) : null;
                displayLabel = tex != null ? $"Image: {tex.name}" : label.text;
            }
            else
            {
                // Text mode: show text content
                string textContent = ContentDrawer.GetText(mat, id);
                displayLabel = string.IsNullOrEmpty(textContent?.Trim()) ? label.text : TruncateText(textContent, 50);
            }

            // Use ThryEditor's DrawingData to get the last header rect (current frame)
            Rect headerRect = Thry.ThryEditor.DrawingData.LastGuiObjectHeaderRect;

            // Draw label on top of Thry's empty header
            Rect labelRect = new Rect(headerRect.x + 36f, headerRect.y - 2.5f, headerRect.width - 80f, headerRect.height);
            GUI.Label(labelRect, displayLabel, LabelStyle);
        }

        private static string TruncateText(string text, int maxLength)
        {
            string singleLine = text.Replace("\n", " ").Replace("\r", "").Trim();
            if (singleLine.Length <= maxLength)
                return singleLine;
            return singleLine.Substring(0, maxLength - 3) + "...";
        }
    }
}
