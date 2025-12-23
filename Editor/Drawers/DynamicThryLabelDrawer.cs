using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Dynamic label drawer for ThryEditor group headers.
    /// Displays text content or texture name based on property name.
    ///
    /// Usage: Place immediately after m_end:
    ///   [HideInInspector] m_end_text_setting0 ("", Float) = 0
    ///   [DynamicThryLabel] _TextLabel0 ("Text Settings 0", Int) = 0
    ///
    ///   [HideInInspector] m_end_image_setting0 ("", Float) = 0
    ///   [DynamicThryLabel] _ImageLabel0 ("Image 0", Int) = 0
    /// </summary>
    public class DynamicThryLabelDrawer : MaterialPropertyDrawer
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

        public DynamicThryLabelDrawer() { }
        public DynamicThryLabelDrawer(string unused) { }

        private static string GetIdFromPropertyName(string propName)
        {
            var i = propName.Length - 1;
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
            if (editor?.target is not Material mat)
                return;

            var id = GetIdFromPropertyName(prop.name);
            var isImage = prop.name.Contains("Image");
            var displayLabel = isImage
                ? GetImageDisplayLabel(mat, id, label.text)
                : GetTextDisplayLabel(mat, id, label.text);

            var headerRect = Thry.ThryEditor.DrawingData.LastGuiObjectHeaderRect;
            var labelRect = new Rect(headerRect.x + 36f, headerRect.y - 2.5f, headerRect.width - 80f, headerRect.height);
            GUI.Label(labelRect, displayLabel, LabelStyle);
        }

        private static string GetTextDisplayLabel(Material mat, string id, string fallback)
        {
            var textContent = ContentDrawer.GetText(mat, id);
            return string.IsNullOrEmpty(textContent?.Trim()) ? fallback : TruncateText(textContent, 50);
        }

        private static string GetImageDisplayLabel(Material mat, string id, string fallback)
        {
            var texPropName = $"_ImageTexture{id}";
            var tex = mat.HasProperty(texPropName) ? mat.GetTexture(texPropName) : null;
            return tex != null ? tex.name : fallback;
        }

        private static string TruncateText(string text, int maxLength)
        {
            var singleLine = text.Replace("\n", " ").Replace("\r", "").Trim();
            return singleLine.Length <= maxLength ? singleLine : singleLine[..(maxLength - 3)] + "...";
        }
    }
}
