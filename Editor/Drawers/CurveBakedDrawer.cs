using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// CustomDrawer for baked AnimationCurve.
    /// Displays AnimationCurve editor and bakes to Vector4 properties on change.
    /// </summary>
    public class CurveBakedDrawer : MaterialPropertyDrawer
    {
        private const string TagPrefix = "_CurveBaked_";
        private const int SampleCount = 8;

        public CurveBakedDrawer() { }
        public CurveBakedDrawer(string unused) { }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return EditorGUIUtility.singleLineHeight;
        }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            Material mat = editor?.target as Material;
            if (mat == null) return;

            string axisAndId = GetAxisAndIdFromPropertyName(prop.name);
            if (string.IsNullOrEmpty(axisAndId)) return;

            AnimationCurve curve = LoadCurve(mat, axisAndId);

            EditorGUI.BeginChangeCheck();
            curve = EditorGUI.CurveField(position, label, curve);
            if (EditorGUI.EndChangeCheck())
            {
                Undo.RecordObject(mat, "Change Curve");
                SaveCurve(mat, axisAndId, curve);
                BakeCurveToVectors(mat, axisAndId, curve);
                EditorUtility.SetDirty(mat);
            }
        }

        private static string GetAxisAndIdFromPropertyName(string propName)
        {
            // _CurveX0 → "X0", _CurveY1 → "Y1"
            if (!propName.StartsWith("_Curve")) return null;
            return propName.Substring(6); // Remove "_Curve" prefix
        }

        private static AnimationCurve LoadCurve(Material mat, string axisAndId)
        {
            string json = mat.GetTag(TagPrefix + axisAndId, false, "");
            if (string.IsNullOrEmpty(json))
            {
                // Default: linear 0→1
                return AnimationCurve.Linear(0, 0, 1, 1);
            }

            try
            {
                var wrapper = JsonUtility.FromJson<CurveWrapper>(json);
                return wrapper?.curve ?? AnimationCurve.Linear(0, 0, 1, 1);
            }
            catch
            {
                return AnimationCurve.Linear(0, 0, 1, 1);
            }
        }

        private static void SaveCurve(Material mat, string axisAndId, AnimationCurve curve)
        {
            var wrapper = new CurveWrapper { curve = curve };
            string json = JsonUtility.ToJson(wrapper);
            mat.SetOverrideTag(TagPrefix + axisAndId, json);
        }

        private static void BakeCurveToVectors(Material mat, string axisAndId, AnimationCurve curve)
        {
            float[] samples = new float[SampleCount];
            float[] tangents = new float[SampleCount];

            for (int i = 0; i < SampleCount; i++)
            {
                float t = i / (float)(SampleCount - 1);
                samples[i] = curve.Evaluate(t);

                // 接線計算: 前方差分
                float t_next = Mathf.Min(t + 0.05f, 1.0f);
                float delta = t_next - t;
                if (delta < 0.001f) delta = 0.05f; // 端点での0除算防止
                float next_val = curve.Evaluate(t_next);
                float tangent = (next_val - samples[i]) / delta;

                // 正規化して0-1範囲に変換 (arctan で圧縮)
                tangents[i] = Mathf.Atan(tangent) / Mathf.PI + 0.5f;
            }

            // 既存: サンプル値
            Vector4 data0 = new Vector4(samples[0], samples[1], samples[2], samples[3]);
            Vector4 data1 = new Vector4(samples[4], samples[5], samples[6], samples[7]);

            // 新規: 接線値
            Vector4 tangentData0 = new Vector4(tangents[0], tangents[1], tangents[2], tangents[3]);
            Vector4 tangentData1 = new Vector4(tangents[4], tangents[5], tangents[6], tangents[7]);

            // 既存プロパティ
            string propData0 = $"_CurveData{axisAndId}_0";
            string propData1 = $"_CurveData{axisAndId}_1";

            // 新規プロパティ (T = Tangent)
            string propTangent0 = $"_CurveDataT{axisAndId}_0";
            string propTangent1 = $"_CurveDataT{axisAndId}_1";

            if (mat.HasProperty(propData0))
                mat.SetVector(propData0, data0);
            if (mat.HasProperty(propData1))
                mat.SetVector(propData1, data1);
            if (mat.HasProperty(propTangent0))
                mat.SetVector(propTangent0, tangentData0);
            if (mat.HasProperty(propTangent1))
                mat.SetVector(propTangent1, tangentData1);
        }

        [System.Serializable]
        private class CurveWrapper
        {
            public AnimationCurve curve;
        }
    }
}
