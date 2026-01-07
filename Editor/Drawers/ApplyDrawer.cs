using Typography.Editor.Core;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Apply button drawer for texture array rebuilding.
    /// Rebuilds MatCap/Image/Overlay TextureArray and Layer LUT without font regeneration.
    /// </summary>
    public class ApplyDrawer : MaterialPropertyDrawer
    {
        private readonly float _widthFactor;

        public ApplyDrawer() : this(1) { }
        public ApplyDrawer(float widthFactor) => _widthFactor = widthFactor;

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor) 
            => EditorGUIUtility.singleLineHeight * 1.25f;

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            if (editor?.target is not Material mat) return;

            var indentedRect = EditorGUI.IndentedRect(position);
            indentedRect.width *= _widthFactor;

            if (GUI.Button(indentedRect, "Apply"))
                TypographyPipeline.ApplyTextures(mat);
        }
    }
}
