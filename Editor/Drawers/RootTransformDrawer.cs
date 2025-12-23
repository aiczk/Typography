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
        private const float Deg2Rad = Mathf.Deg2Rad;

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            EditorGUI.BeginChangeCheck();

            // Vector3 field (like [Vector3] drawer)
            var value = prop.vectorValue;
            var v3 = EditorGUI.Vector3Field(position, label, new Vector3(value.x, value.y, value.z));
            if (!EditorGUI.EndChangeCheck()) return;
            
            prop.vectorValue = new Vector4(v3.x, v3.y, v3.z, value.w);

            foreach (var target in prop.targets)
            {
                if (target is not Material mat) continue;
                UpdateAllRootMatrices(mat);
            }
        }

        public static void UpdateAllRootMatrices(Material mat)
        {
            for (var i = 0; i < 5; i++)
                UpdateRootMatrix(mat, i);
        }

        public static void UpdateRootMatrix(Material mat, int rootIndex)
        {
            var rotProp = $"_RootRotation{rootIndex}";
            var scaleProp = $"_RootScale{rootIndex}";
            var row0Prop = $"_RootMatrix{rootIndex}_Row0";
            var row1Prop = $"_RootMatrix{rootIndex}_Row1";
            var row2Prop = $"_RootMatrix{rootIndex}_Row2";

            if (!mat.HasProperty(rotProp) || !mat.HasProperty(scaleProp))
                return;

            var rotation = mat.GetVector(rotProp);
            var scale = mat.GetVector(scaleProp);

            // Build rotation matrix (Euler XYZ)
            var sx = Mathf.Sin(rotation.x * Deg2Rad);
            var cx = Mathf.Cos(rotation.x * Deg2Rad);
            var sy = Mathf.Sin(rotation.y * Deg2Rad);
            var cy = Mathf.Cos(rotation.y * Deg2Rad);
            var sz = Mathf.Sin(rotation.z * Deg2Rad);
            var cz = Mathf.Cos(rotation.z * Deg2Rad);

            // Rotation matrix (same as shader's rotation_matrix)
            // Row-major: [cy*cz, -cy*sz, sy]
            //            [sx*sy*cz + cx*sz, -sx*sy*sz + cx*cz, -sx*cy]
            //            [-cx*sy*cz + sx*sz, cx*sy*sz + sx*cz, cx*cy]

            // Apply scale to rotation matrix (rotation * scale)
            var row0 = new Vector4(
                cy * cz * scale.x,
                -cy * sz * scale.y,
                sy * scale.z,
                0
            );
            var row1 = new Vector4(
                (sx * sy * cz + cx * sz) * scale.x,
                (-sx * sy * sz + cx * cz) * scale.y,
                -sx * cy * scale.z,
                0
            );
            var row2 = new Vector4(
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
