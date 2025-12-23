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
            if (editor?.target is not Material mat)
                return;

            var axisAndId = GetAxisAndIdFromPropertyName(prop.name);
            if (string.IsNullOrEmpty(axisAndId))
                return;

            var curve = LoadCurve(mat, axisAndId);

            EditorGUI.BeginChangeCheck();
            curve = EditorGUI.CurveField(position, label, curve);
            if (!EditorGUI.EndChangeCheck())
                return;

            Undo.RecordObject(mat, "Change Curve");
            SaveCurve(mat, axisAndId, curve);
            BakeCurveToVectors(mat, axisAndId, curve);
            EditorUtility.SetDirty(mat);
        }

        private static string GetAxisAndIdFromPropertyName(string propName)
        {
            // _CurveX0 → "X0", _CurveY1 → "Y1"
            return !propName.StartsWith("_Curve") ? null : propName[6..]; // Remove "_Curve" prefix
        }

        private static AnimationCurve CreateDefaultCurve() => AnimationCurve.Constant(0, 1, 0);

        private static AnimationCurve LoadCurve(Material mat, string axisAndId)
        {
            var json = mat.GetTag(TagPrefix + axisAndId, false, "");
            if (string.IsNullOrEmpty(json))
                return CreateDefaultCurve();

            try
            {
                var wrapper = JsonUtility.FromJson<CurveWrapper>(json);
                return wrapper?.curve ?? CreateDefaultCurve();
            }
            catch
            {
                return CreateDefaultCurve();
            }
        }

        private static void SaveCurve(Material mat, string axisAndId, AnimationCurve curve)
        {
            var wrapper = new CurveWrapper { curve = curve };
            var json = JsonUtility.ToJson(wrapper);
            mat.SetOverrideTag(TagPrefix + axisAndId, json);
        }

        private static void BakeCurveToVectors(Material mat, string axisAndId, AnimationCurve curve)
        {
            var samples = new float[SampleCount];
            var tangents = new float[SampleCount];

            for (var i = 0; i < SampleCount; i++)
            {
                var t = i / (float)(SampleCount - 1);
                samples[i] = curve.Evaluate(t);

                // 接線計算: 前方差分
                var t_next = Mathf.Min(t + 0.05f, 1.0f);
                var delta = t_next - t;
                if (delta < 0.001f) delta = 0.05f; // 端点での0除算防止
                var next_val = curve.Evaluate(t_next);
                var tangent = (next_val - samples[i]) / delta;

                // 正規化して0-1範囲に変換 (arctan で圧縮)
                tangents[i] = Mathf.Atan(tangent) / Mathf.PI + 0.5f;
            }

            // 既存: サンプル値
            var data0 = new Vector4(samples[0], samples[1], samples[2], samples[3]);
            var data1 = new Vector4(samples[4], samples[5], samples[6], samples[7]);

            // 新規: 接線値
            var tangentData0 = new Vector4(tangents[0], tangents[1], tangents[2], tangents[3]);
            var tangentData1 = new Vector4(tangents[4], tangents[5], tangents[6], tangents[7]);

            // 既存プロパティ
            var propData0 = $"_CurveData{axisAndId}_0";
            var propData1 = $"_CurveData{axisAndId}_1";

            // 新規プロパティ (T = Tangent)
            var propTangent0 = $"_CurveDataT{axisAndId}_0";
            var propTangent1 = $"_CurveDataT{axisAndId}_1";

            if (mat.HasProperty(propData0))
                mat.SetVector(propData0, data0);
            if (mat.HasProperty(propData1))
                mat.SetVector(propData1, data1);
            if (mat.HasProperty(propTangent0))
                mat.SetVector(propTangent0, tangentData0);
            if (mat.HasProperty(propTangent1))
                mat.SetVector(propTangent1, tangentData1);

            // 平均値を計算して _CurveCenter に保存
            UpdateCurveCenter(mat, axisAndId, samples);
        }

        private static void UpdateCurveCenter(Material mat, string axisAndId, float[] samples)
        {
            // axisAndId: "X0", "Y1", "Z2" など
            if (axisAndId.Length < 2) return;

            var axis = axisAndId[0]; // 'X', 'Y', 'Z'
            var id = axisAndId[1..];  // "0", "1", ...

            var propCenter = $"_CurveCenter{id}";
            if (!mat.HasProperty(propCenter)) return;

            // 8サンプルの平均を計算
            var sum = 0f;
            foreach (var s in samples) sum += s;
            var average = sum / samples.Length;

            // 正規化（カーブ値は0-1、シェーダーでは * 2.0 - 1.0 で -1 to 1 に変換される）
            var normalizedAverage = average * 2.0f - 1.0f;

            // 現在の _CurveCenter を取得し、該当軸のみ更新
            var center = mat.GetVector(propCenter);
            switch (axis)
            {
                case 'X': center.x = normalizedAverage; break;
                case 'Y': center.y = normalizedAverage; break;
                case 'Z': center.z = normalizedAverage; break;
            }
            mat.SetVector(propCenter, center);
        }

        [System.Serializable]
        private class CurveWrapper
        {
            public AnimationCurve curve;
        }
    }
}
