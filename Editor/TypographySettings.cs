using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor
{
    /// <summary>
    /// ScriptableObject that manages fonts array per project.
    /// Shared across all materials within the same project.
    /// </summary>
    public class TypographySettings : ScriptableObject
    {
        private const string AtlasRootFolder = "Assets/Typography_Atlases";
        private const int MaxFonts = 8;

        [SerializeField] public List<Font> fonts = new();

        private static readonly Dictionary<string, TypographySettings> Cache = new();

        public static List<Font> GetFonts(string project)
        {
            var storage = GetOrCreate(project);
            return new List<Font>(storage.fonts);
        }

        public static void SetFonts(string project, List<Font> fonts)
        {
            var storage = GetOrCreate(project);

            Undo.RecordObject(storage, "Change Project Fonts");
            storage.fonts = new List<Font>(fonts);
            EditorUtility.SetDirty(storage);
            AssetDatabase.SaveAssetIfDirty(storage);
        }

        public static TypographySettings GetOrCreate(string project)
        {
            if (string.IsNullOrEmpty(project))
                project = "Default";

            if (Cache.TryGetValue(project, out var cached) && cached != null)
                return cached;

            var safeName = string.Join("_", project.Split(Path.GetInvalidFileNameChars()));
            var assetPath = GetAssetPath(safeName);
            var storage = AssetDatabase.LoadAssetAtPath<TypographySettings>(assetPath);

            if (storage == null)
            {
                var projectDir = $"{AtlasRootFolder}/{safeName}";
                if (!Directory.Exists(projectDir))
                    Directory.CreateDirectory(projectDir);

                storage = CreateInstance<TypographySettings>();
                AssetDatabase.CreateAsset(storage, assetPath);
                AssetDatabase.SaveAssets();
            }

            Cache[project] = storage;
            return storage;
        }

        public static void MigrateFromMaterialTags(string project, Material mat)
        {
            var storage = GetOrCreate(project);

            if (storage.fonts.Count > 0)
                return;

            var fonts = LoadFontsFromMaterialTags(mat);
            if (fonts.Count <= 0) return;
            
            storage.fonts = fonts;
            EditorUtility.SetDirty(storage);
            AssetDatabase.SaveAssetIfDirty(storage);
            Debug.Log($"[Typography] Migrated {fonts.Count} fonts from material to TypographySettings: {project}");
        }

        private static List<Font> LoadFontsFromMaterialTags(Material mat)
        {
            var countStr = mat.GetTag("_Fonts_Count", false, "0");
            int.TryParse(countStr, out var count);

            return count == 0 ? LoadFontsFromLegacyTags(mat) : LoadFontsFromNewTags(mat, count);
        }

        private static List<Font> LoadFontsFromLegacyTags(Material mat)
        {
            string[] prefixes = { "_FontSettings_Font_", "_FontSetting_Font_" };

            foreach (var prefix in prefixes)
            {
                var fonts = LoadFontsWithPrefix(mat, prefix);
                if (fonts.Count <= 0) continue;
                
                return fonts;
            }

            return new List<Font>();
        }

        private static List<Font> LoadFontsWithPrefix(Material mat, string prefix)
        {
            var fonts = new List<Font>();

            for (var i = 0; i < MaxFonts; i++)
            {
                var path = mat.GetTag(prefix + i, false, "");
                if (string.IsNullOrEmpty(path))
                    break;

                var font = AssetDatabase.LoadAssetAtPath<Font>(path);
                if (font == null)
                    break;

                fonts.Add(font);
            }

            return fonts;
        }

        private static List<Font> LoadFontsFromNewTags(Material mat, int count)
        {
            var fonts = new List<Font>();

            for (var i = 0; i < count; i++)
            {
                var path = mat.GetTag("_Fonts_Font_" + i, false, "");
                var font = string.IsNullOrEmpty(path) ? null : AssetDatabase.LoadAssetAtPath<Font>(path);
                fonts.Add(font);
            }

            TrimTrailingNulls(fonts);
            return fonts;
        }

        private static void TrimTrailingNulls(List<Font> fonts)
        {
            while (fonts.Count > 0 && fonts[^1] == null)
                fonts.RemoveAt(fonts.Count - 1);
        }

        private static string GetAssetPath(string safeName)
        {
            return $"{AtlasRootFolder}/{safeName}/{safeName}_Settings.asset";
        }
    }
}
