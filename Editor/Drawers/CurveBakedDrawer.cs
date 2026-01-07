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

                // Forward difference for tangent
                var t_next = Mathf.Min(t + 0.05f, 1.0f);
                var delta = t_next - t;
                if (delta < 0.001f) delta = 0.05f;
                var next_val = curve.Evaluate(t_next);
                var tangent = (next_val - samples[i]) / delta;

                // Normalize to 0-1 using arctan
                tangents[i] = Mathf.Atan(tangent) / Mathf.PI + 0.5f;
            }

            var data0 = new Vector4(samples[0], samples[1], samples[2], samples[3]);
            var data1 = new Vector4(samples[4], samples[5], samples[6], samples[7]);
            var tangentData0 = new Vector4(tangents[0], tangents[1], tangents[2], tangents[3]);
            var tangentData1 = new Vector4(tangents[4], tangents[5], tangents[6], tangents[7]);

            var propData0 = $"_CurveData{axisAndId}_0";
            var propData1 = $"_CurveData{axisAndId}_1";
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

            UpdateCurveCenter(mat, axisAndId, samples);
        }

        private static void UpdateCurveCenter(Material mat, string axisAndId, float[] samples)
        {
            if (axisAndId.Length < 2) return;

            var axis = axisAndId[0];
            var id = axisAndId[1..];

            var propCenter = $"_CurveCenter{id}";
            if (!mat.HasProperty(propCenter)) return;

            var sum = 0f;
            foreach (var s in samples) sum += s;
            var average = sum / samples.Length;

            // Shader converts 0-1 to -1..1 via *2-1
            var normalizedAverage = average * 2.0f - 1.0f;

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
