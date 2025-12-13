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
        private const int AtlasResolution = 4096;

        public static string GetMsdfAtlasGenPath()
        {
            // Find msdf-atlas-gen.exe relative to this script's location
            string[] guids = AssetDatabase.FindAssets("msdf-atlas-gen");
            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                if (path.EndsWith("msdf-atlas-gen.exe"))
                {
                    return Path.GetFullPath(path);
                }
            }
            // Fallback to same folder as MSDFAtlasGenerator.cs
            var scriptPath = AssetDatabase.FindAssets("MSDFAtlasGenerator t:MonoScript");
            if (scriptPath.Length > 0)
            {
                string csPath = AssetDatabase.GUIDToAssetPath(scriptPath[0]);
                string dir = Path.GetDirectoryName(csPath);
                return Path.GetFullPath(Path.Combine(dir, "msdf-atlas-gen.exe"));
            }
            return null;
        }

        public static string GetFontPath(Font font)
        {
            if (font == null) return null;

            string assetPath = AssetDatabase.GetAssetPath(font);
            if (string.IsNullOrEmpty(assetPath)) return null;

            string fullPath = Path.GetFullPath(assetPath);

            if (!File.Exists(fullPath))
            {
                Debug.LogError($"Font file not found at: {fullPath}");
                return null;
            }

            return fullPath;
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

            string atlasGenPath = GetMsdfAtlasGenPath();
            if (!File.Exists(atlasGenPath))
            {
                Debug.LogError($"msdf-atlas-gen.exe not found at: {atlasGenPath}");
                return null;
            }

            string fontPath = GetFontPath(font);
            if (string.IsNullOrEmpty(fontPath)) return null;

            // Create temp charset file in same directory as msdf-atlas-gen.exe
            string atlasGenDir = Path.GetDirectoryName(atlasGenPath);
            string charsetPath = Path.Combine(atlasGenDir, "temp_charset_gen.txt");
            string escapedCharacters = string.Join("", characters).Replace("\\", @"\\").Replace("\"", "\\\"");
            string characterString = "\"" + escapedCharacters + "\"";
            File.WriteAllText(charsetPath, characterString, System.Text.Encoding.UTF8);

            // Delete existing output if exists
            if (File.Exists(outputPath)) File.Delete(outputPath);

            // Calculate parameters
            int cellSize = AtlasResolution / atlasSize;
            int pxRange = Mathf.Max(2, cellSize / 32);

            var startInfo = new ProcessStartInfo
            {
                FileName = atlasGenPath,
                Arguments = $"-font \"{fontPath}\" -charset \"{charsetPath}\" -type mtsdf -dimensions {AtlasResolution} {AtlasResolution} -uniformgrid -uniformcols {atlasSize} -uniformcell {cellSize} {cellSize} -pxpadding 6 -pxrange {pxRange} -threads 0 -imageout \"{outputPath}\"",
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
                    EditorUtility.ClearProgressBar();
                    Debug.LogError("Failed to start msdf-atlas-gen process");
                    return null;
                }

                string output = process.StandardOutput.ReadToEnd();
                string error = process.StandardError.ReadToEnd();
                process.WaitForExit();

                EditorUtility.ClearProgressBar();

                if (process.ExitCode == 0 && File.Exists(outputPath))
                {
                    // Convert to asset path
                    string relativePath = "Assets" + outputPath.Substring(Application.dataPath.Length).Replace("\\", "/");

                    // Return path for batch import later
                    return relativePath;
                }

                Debug.LogError($"msdf-atlas-gen failed. Exit code: {process.ExitCode}");
                if (!string.IsNullOrEmpty(output)) Debug.LogError($"Output: {output}");
                if (!string.IsNullOrEmpty(error)) Debug.LogError($"Error: {error}");
            }
            catch (System.Exception e)
            {
                EditorUtility.ClearProgressBar();
                Debug.LogError($"Failed to run msdf-atlas-gen: {e.Message}");
            }

            return null;
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
        /// Extracts unique text elements (grapheme clusters) from input string.
        /// Used for building character mapping for MSDF atlas generation.
        /// </summary>
        public static List<string> ExtractUniqueTextElements(string input)
        {
            var elements = new List<string>();
            var enumerator = System.Globalization.StringInfo.GetTextElementEnumerator(input);

            while (enumerator.MoveNext())
            {
                string element = enumerator.Current.ToString();
                if (string.IsNullOrEmpty(element) || char.IsControl(element[0]) || char.IsWhiteSpace(element[0])) continue;
                if (elements.Contains(element)) continue;
                elements.Add(element);
            }

            return elements;
        }
    }
}
