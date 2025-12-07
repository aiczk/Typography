using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Calculates and updates precomputed Root Transform matrices when rotation/scale changes.
    /// Attach to _RootRotation{N} or _RootScale{N} properties.
    /// </summary>
    public class RootTransformDrawer : MaterialPropertyDrawer
    {
        private const float DEG2RAD = Mathf.Deg2Rad;

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            EditorGUI.BeginChangeCheck();

            // Vector3 field (like [Vector3] drawer)
            Vector4 value = prop.vectorValue;
            Vector3 v3 = EditorGUI.Vector3Field(position, label, new Vector3(value.x, value.y, value.z));
            if (EditorGUI.EndChangeCheck())
            {
                prop.vectorValue = new Vector4(v3.x, v3.y, v3.z, value.w);

                foreach (var target in prop.targets)
                {
                    if (target is Material mat)
                        UpdateAllRootMatrices(mat);
                }
            }
        }

        public static void UpdateAllRootMatrices(Material mat)
        {
            for (int i = 0; i < 5; i++)
                UpdateRootMatrix(mat, i);
        }

        public static void UpdateRootMatrix(Material mat, int rootIndex)
        {
            string rotProp = $"_RootRotation{rootIndex}";
            string scaleProp = $"_RootScale{rootIndex}";
            string row0Prop = $"_RootMatrix{rootIndex}_Row0";
            string row1Prop = $"_RootMatrix{rootIndex}_Row1";
            string row2Prop = $"_RootMatrix{rootIndex}_Row2";

            if (!mat.HasProperty(rotProp) || !mat.HasProperty(scaleProp))
                return;

            Vector4 rotation = mat.GetVector(rotProp);
            Vector4 scale = mat.GetVector(scaleProp);

            // Build rotation matrix (Euler XYZ)
            float sx = Mathf.Sin(rotation.x * DEG2RAD);
            float cx = Mathf.Cos(rotation.x * DEG2RAD);
            float sy = Mathf.Sin(rotation.y * DEG2RAD);
            float cy = Mathf.Cos(rotation.y * DEG2RAD);
            float sz = Mathf.Sin(rotation.z * DEG2RAD);
            float cz = Mathf.Cos(rotation.z * DEG2RAD);

            // Rotation matrix (same as shader's rotation_matrix)
            // Row-major: [cy*cz, -cy*sz, sy]
            //            [sx*sy*cz + cx*sz, -sx*sy*sz + cx*cz, -sx*cy]
            //            [-cx*sy*cz + sx*sz, cx*sy*sz + sx*cz, cx*cy]

            // Apply scale to rotation matrix (rotation * scale)
            Vector4 row0 = new Vector4(
                cy * cz * scale.x,
                -cy * sz * scale.y,
                sy * scale.z,
                0
            );
            Vector4 row1 = new Vector4(
                (sx * sy * cz + cx * sz) * scale.x,
                (-sx * sy * sz + cx * cz) * scale.y,
                -sx * cy * scale.z,
                0
            );
            Vector4 row2 = new Vector4(
                (-cx * sy * cz + sx * sz) * scale.x,
                (cx * sy * sz + sx * cz) * scale.y,
                cx * cy * scale.z,
                0
            );

            mat.SetVector(row0Prop, row0);
            mat.SetVector(row1Prop, row1);
            mat.SetVector(row2Prop, row2);
        }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            // Vector3Field uses 2 lines when label is present (label + fields)
            return EditorGUIUtility.singleLineHeight * 2 + EditorGUIUtility.standardVerticalSpacing;
        }
    }
}
