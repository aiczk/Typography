using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Project name drawer for atlas sharing.
    /// Stores project name in material tag "_Project".
    /// </summary>
    public class ProjectDrawer : MaterialPropertyDrawer
    {
        private const string TagProject = "_Project";
        private const string DefaultProject = "Default";

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            var mat = (Material)prop.targets[0];

            var project = mat.GetTag(TagProject, false, DefaultProject);
            if (string.IsNullOrEmpty(project))
                project = DefaultProject;

            EditorGUI.BeginChangeCheck();
            var newProject = EditorGUI.DelayedTextField(position, label, project);
            if (EditorGUI.EndChangeCheck())
            {
                // Sanitize: remove invalid path characters
                newProject = SanitizeProjectName(newProject);
                if (string.IsNullOrEmpty(newProject))
                    newProject = DefaultProject;

                Undo.RecordObject(mat, "Change Project");
                mat.SetOverrideTag(TagProject, newProject);
                EditorUtility.SetDirty(mat);
            }
        }

        public static string GetProject(Material mat)
        {
            var project = mat.GetTag(TagProject, false, DefaultProject);
            return string.IsNullOrEmpty(project) ? DefaultProject : project;
        }

        private static string SanitizeProjectName(string name)
        {
            if (string.IsNullOrEmpty(name))
                return DefaultProject;

            var invalid = System.IO.Path.GetInvalidFileNameChars();
            return new string(name.Where(c => !invalid.Contains(c)).ToArray()).Trim();
        }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return 18f;
        }
    }
}
