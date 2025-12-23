using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;
using Debug = UnityEngine.Debug;

namespace Typography.Editor
{
    public static class MSDFAtlasGenerator
    {
        private static readonly int AtlasInvSize = Shader.PropertyToID("_AtlasInvSize");
        private static readonly int AtlasMask = Shader.PropertyToID("_AtlasMask");
        private static readonly int AtlasShift = Shader.PropertyToID("_AtlasShift");
        private static readonly int AtlasCellSize = Shader.PropertyToID("_AtlasCellSize");
        private static readonly int AtlasHalfInvPxRange = Shader.PropertyToID("_AtlasHalfInvPxRange");
        private const int AtlasResolution = 4096;

        public static string GetMsdfAtlasGenPath()
        {
            // Find msdf-atlas-gen.exe relative to this script's location
            var guids = AssetDatabase.FindAssets("msdf-atlas-gen");
            foreach (var guid in guids)
            {
                var path = AssetDatabase.GUIDToAssetPath(guid);
                if (path.EndsWith("msdf-atlas-gen.exe"))
                {
                    return Path.GetFullPath(path);
                }
            }
            // Fallback to same folder as MSDFAtlasGenerator.cs
            var scriptPath = AssetDatabase.FindAssets("MSDFAtlasGenerator t:MonoScript");
            if (scriptPath.Length <= 0) return null;
            
            var csPath = AssetDatabase.GUIDToAssetPath(scriptPath[0]);
            var dir = Path.GetDirectoryName(csPath);
            return Path.GetFullPath(Path.Combine(dir!, "msdf-atlas-gen.exe"));
        }

        public static string GetFontPath(Font font)
        {
            if (font == null) return null;

            var assetPath = AssetDatabase.GetAssetPath(font);
            if (string.IsNullOrEmpty(assetPath)) return null;

            var fullPath = Path.GetFullPath(assetPath);

            if (File.Exists(fullPath)) return fullPath;
            
            Debug.LogError($"Font file not found at: {fullPath}");
            return null;

        }

        /// <summary>
        /// Generates MSDF atlas and returns asset path (not imported yet).
        /// Call ImportAtlases() after all atlases are generated.
        /// </summary>
        public static string Generate(Font font, List<string> characters, int atlasSize, string outputPath)
        {
            if (font == null)
            {
                Debug.LogError("Font is null");
                return null;
            }

            if (characters == null || characters.Count == 0)
            {
                Debug.LogError("No characters to generate");
                return null;
            }

            var atlasGenPath = GetMsdfAtlasGenPath();
            if (!File.Exists(atlasGenPath))
            {
                Debug.LogError($"msdf-atlas-gen.exe not found at: {atlasGenPath}");
                return null;
            }

            var fontPath = GetFontPath(font);
            if (string.IsNullOrEmpty(fontPath)) return null;

            // Create temp charset file in same directory as msdf-atlas-gen.exe
            var atlasGenDir = Path.GetDirectoryName(atlasGenPath);
            var charsetPath = Path.Combine(atlasGenDir!, "temp_charset_gen.txt");
            var escapedCharacters = string.Join("", characters).Replace("\\", @"\\").Replace("\"", "\\\"");
            var characterString = "\"" + escapedCharacters + "\"";
            File.WriteAllText(charsetPath, characterString, System.Text.Encoding.UTF8);

            // Delete existing output if exists
            if (File.Exists(outputPath)) File.Delete(outputPath);

            // Calculate parameters
            var cellSize = AtlasResolution / atlasSize;
            var pxRange = Mathf.Max(2, cellSize / 32);

            var startInfo = new ProcessStartInfo
            {
                FileName = atlasGenPath,
                Arguments = $"-font \"{fontPath}\" -charset \"{charsetPath}\" -type mtsdf -dimensions {AtlasResolution} {AtlasResolution} -uniformgrid -uniformcols {atlasSize} -uniformcell {cellSize} {cellSize} -pxpadding 32 -pxrange {pxRange} -threads 0 -imageout \"{outputPath}\"",
                UseShellExecute = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                CreateNoWindow = true
            };

            try
            {
                EditorUtility.DisplayProgressBar("Generating MSDF Atlas", $"Processing {font.name}...", 0.5f);

                using var process = Process.Start(startInfo);
                if (process == null)
                {
                    Debug.LogError("Failed to start msdf-atlas-gen process");
                    return null;
                }

                var output = process.StandardOutput.ReadToEnd();
                var error = process.StandardError.ReadToEnd();
                process.WaitForExit();

                if (process.ExitCode != 0 || !File.Exists(outputPath))
                {
                    Debug.LogError($"msdf-atlas-gen failed. Exit code: {process.ExitCode}");
                    if (!string.IsNullOrEmpty(output)) Debug.LogError($"Output: {output}");
                    if (!string.IsNullOrEmpty(error)) Debug.LogError($"Error: {error}");
                    return null;
                }

                var relativePath = "Assets" + outputPath.Substring(Application.dataPath.Length).Replace("\\", "/");
                return relativePath;
            }
            catch (System.Exception e)
            {
                Debug.LogError($"Failed to run msdf-atlas-gen: {e.Message}");
                return null;
            }
            finally
            {
                EditorUtility.ClearProgressBar();
            }
        }

        /// <summary>
        /// Batch imports and configures multiple atlas textures at once.
        /// More efficient than importing one by one.
        /// </summary>
        public static List<Texture2D> ImportAtlases(List<string> assetPaths)
        {
            if (assetPaths == null || assetPaths.Count == 0)
                return new List<Texture2D>();

            // Configure importer settings first (creates .meta files if needed)
            foreach (var path in assetPaths.Where(path => !string.IsNullOrEmpty(path)))
            {
                ConfigureTextureImporter(path);
            }

            // Single batch import with configured settings
            AssetDatabase.StartAssetEditing();
            try
            {
                foreach (var path in assetPaths.Where(path => !string.IsNullOrEmpty(path)))
                {
                    AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceUpdate | ImportAssetOptions.DontDownloadFromCacheServer);
                }
            }
            finally
            {
                AssetDatabase.StopAssetEditing();
            }

            // Load all textures
            var textures = new List<Texture2D>();
            foreach (string path in assetPaths)
            {
                if (string.IsNullOrEmpty(path))
                {
                    textures.Add(null);
                    continue;
                }

                var tex = AssetDatabase.LoadAssetAtPath<Texture2D>(path);
                if (tex != null)
                {
                    textures.Add(tex);
                }
                else
                {
                    Debug.LogError($"Failed to load atlas: {path}");
                    textures.Add(null);
                }
            }

            return textures;
        }

        private static void ConfigureTextureImporter(string assetPath)
        {
            var importer = AssetImporter.GetAtPath(assetPath) as TextureImporter;
            if (importer == null) return;

            importer.sRGBTexture = false;
            importer.mipmapEnabled = false;
            importer.anisoLevel = 0;
            importer.filterMode = FilterMode.Bilinear;
            importer.maxTextureSize = 2048;
            importer.textureCompression = TextureImporterCompression.CompressedHQ;

            // Standalone: BC7 explicit (high quality, 8bpp, 4MB for 2048x2048)
            var standaloneSettings = importer.GetPlatformTextureSettings("Standalone");
            standaloneSettings.overridden = true;
            standaloneSettings.format = TextureImporterFormat.BC7;
            standaloneSettings.maxTextureSize = 2048;
            standaloneSettings.compressionQuality = 100;
            importer.SetPlatformTextureSettings(standaloneSettings);

            // Save settings without triggering reimport
            EditorUtility.SetDirty(importer);
            AssetDatabase.WriteImportSettingsIfDirty(assetPath);
        }

        /// <summary>
        /// Bakes atlas parameters to material for shader optimization.
        /// Call this when _AtlasSize changes.
        /// </summary>
        public static void BakeAtlasParams(Material mat, int atlasSize)
        {
            if (mat == null || atlasSize <= 0) return;

            var invSize = 1.0f / atlasSize;
            var mask = atlasSize - 1;
            var shift = (int)Mathf.Log(atlasSize, 2);
            var cellSize = AtlasResolution * invSize;
            var halfInvPxRange = 0.5f / Mathf.Max(2.0f, cellSize / 32.0f);

            mat.SetFloat(AtlasInvSize, invSize);
            mat.SetInt(AtlasMask, mask);
            mat.SetInt(AtlasShift, shift);
            mat.SetFloat(AtlasCellSize, cellSize);
            mat.SetFloat(AtlasHalfInvPxRange, halfInvPxRange);
        }

        /// <summary>
        /// Extracts unique text elements (grapheme clusters) from input string.
        /// Used for building character mapping for MSDF atlas generation.
        /// </summary>
        public static List<string> ExtractUniqueTextElements(string input)
        {
            var elements = new List<string>();
            var seen = new HashSet<string>();
            var enumerator = System.Globalization.StringInfo.GetTextElementEnumerator(input);

            while (enumerator.MoveNext())
            {
                var element = enumerator.Current.ToString();
                if (string.IsNullOrEmpty(element) || char.IsControl(element[0]) || char.IsWhiteSpace(element[0]))
                    continue;
                if (!seen.Add(element))
                    continue;
                elements.Add(element);
            }

            return elements;
        }
    }
}
