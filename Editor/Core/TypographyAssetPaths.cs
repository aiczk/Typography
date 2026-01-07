using System.IO;
using UnityEngine;

namespace Typography.Editor.Core
{
    /// <summary>
    /// Centralized path management for Typography assets.
    /// </summary>
    public static class TypographyAssetPaths
    {
        public const string AtlasRootFolder = "Assets/Typography_Atlases";
        public const string TypographyShaderName = "GekikaraStore/Typography";

        public static string GetProjectDirectory(string project)
        {
            var safeName = SanitizeProjectName(project);
            return $"{AtlasRootFolder}/{safeName}";
        }

        public static string GetFontAtlasPath(string project, int fontIndex) =>
            $"{GetProjectDirectory(project)}/atlas_{fontIndex}.png";

        public static string GetFontArrayPath(string project) =>
            $"{GetProjectDirectory(project)}/fonts.asset";

        public static string GetTextureArrayPath(string project) =>
            $"{GetProjectDirectory(project)}/textures.asset";

        public static string GetLayerLUTPath(string project) =>
            $"{GetProjectDirectory(project)}/layer_lut.asset";

        public static string GetDataTexturePath(string project, string materialName) =>
            $"{GetProjectDirectory(project)}/{materialName}_data.asset";

        public static string GetSettingsPath(string project)
        {
            var safeName = SanitizeProjectName(project);
            return $"{AtlasRootFolder}/{safeName}/{safeName}_Settings.asset";
        }

        public static string GetMappingPath(string project, int fontIndex) =>
            $"{GetProjectDirectory(project)}/mapping_{fontIndex}.txt";

        public static string ToFullPath(string assetPath) =>
            Path.GetFullPath(Path.Combine(Application.dataPath, "..", assetPath));

        public static string ToAssetPath(string fullPath)
        {
            var normalized = fullPath.Replace("\\", "/");
            var dataPath = Application.dataPath.Replace("\\", "/");
            return normalized.StartsWith(dataPath)
                ? "Assets" + normalized.Substring(dataPath.Length)
                : normalized;
        }

        public static void EnsureDirectoryExists(string assetPath)
        {
            var fullPath = ToFullPath(Path.GetDirectoryName(assetPath));
            if (!Directory.Exists(fullPath))
                Directory.CreateDirectory(fullPath);
        }

        public static void EnsureProjectDirectoryExists(string project)
        {
            var dir = GetProjectDirectory(project);
            var fullPath = ToFullPath(dir);
            if (!Directory.Exists(fullPath))
                Directory.CreateDirectory(fullPath);
        }

        private static string SanitizeProjectName(string project)
        {
            return string.IsNullOrEmpty(project) ? "Default" : string.Join("_", project.Split(Path.GetInvalidFileNameChars()));
        }
    }
}
