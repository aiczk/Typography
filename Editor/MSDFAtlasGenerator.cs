using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Typography.Editor.Core;
using UnityEditor;
using UnityEngine;
using Debug = UnityEngine.Debug;

namespace Typography.Editor
{
    /// <summary>
    /// Handles MSDF atlas generation via external msdf-atlas-gen.exe process.
    /// </summary>
    public static class MSDFAtlasGenerator
    {
        private static readonly int AtlasInvSize = Shader.PropertyToID("_AtlasInvSize");
        private static readonly int AtlasMask = Shader.PropertyToID("_AtlasMask");
        private static readonly int AtlasShift = Shader.PropertyToID("_AtlasShift");
        private static readonly int AtlasHalfInvPxRange = Shader.PropertyToID("_AtlasHalfInvPxRange");
        private const int AtlasResolution = 4096;

        public static string GetMsdfAtlasGenPath()
        {
            var guids = AssetDatabase.FindAssets("msdf-atlas-gen");
            foreach (var guid in guids)
            {
                var path = AssetDatabase.GUIDToAssetPath(guid);
                if (path.EndsWith("msdf-atlas-gen.exe"))
                    return Path.GetFullPath(path);
            }

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
        /// Generates MSDF atlas and returns asset path.
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

            var atlasGenDir = Path.GetDirectoryName(atlasGenPath);
            var charsetPath = Path.Combine(atlasGenDir!, "temp_charset_gen.txt");
            var escapedCharacters = string.Join("", characters).Replace("\\", @"\\").Replace("\"", "\\\"");
            File.WriteAllText(charsetPath, $"\"{escapedCharacters}\"", System.Text.Encoding.UTF8);

            if (File.Exists(outputPath)) File.Delete(outputPath);

            var cellSize = AtlasResolution / atlasSize;
            var args = $"-font \"{fontPath}\" -charset \"{charsetPath}\" -type mtsdf " +
                       $"-dimensions {AtlasResolution} {AtlasResolution} " +
                       $"-uniformgrid -uniformcols {atlasSize} -uniformcell {cellSize} {cellSize} " +
                       $"-emrange 0.3 -threads 0 -coloringstrategy distance " +
                       $"-imageout \"{outputPath}\"";

            return ExecuteProcess(atlasGenPath, args, font.name, outputPath);
        }

        private static string ExecuteProcess(string exePath, string args, string displayName, string outputPath)
        {
            var startInfo = new ProcessStartInfo
            {
                FileName = exePath,
                Arguments = args,
                UseShellExecute = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                CreateNoWindow = true
            };

            try
            {
                EditorUtility.DisplayProgressBar("Generating MSDF Atlas", $"Processing {displayName}...", 0.5f);

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
                    if (!string.IsNullOrEmpty(output)) Debug.Log($"Output: {output}");
                    if (!string.IsNullOrEmpty(error)) Debug.LogError($"Error: {error}");
                    return null;
                }

                return TypographyAssetPaths.ToAssetPath(outputPath);
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
        /// Batch imports and configures multiple atlas textures.
        /// </summary>
        public static List<Texture2D> ImportAtlases(List<string> assetPaths)
        {
            if (assetPaths == null || assetPaths.Count == 0)
                return new List<Texture2D>();

            AssetDatabase.StartAssetEditing();
            try
            {
                foreach (var path in assetPaths.Where(path => !string.IsNullOrEmpty(path)))
                    AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceUpdate);
            }
            finally
            {
                AssetDatabase.StopAssetEditing();
            }

            foreach (var path in assetPaths.Where(path => !string.IsNullOrEmpty(path)))
                ConfigureTextureImporter(path);

            return assetPaths.Select(path =>
                string.IsNullOrEmpty(path) ? null : AssetDatabase.LoadAssetAtPath<Texture2D>(path)
            ).ToList();
        }

        private static void ConfigureTextureImporter(string assetPath)
        {
            var importer = AssetImporter.GetAtPath(assetPath) as TextureImporter;
            if (importer == null) return;

            importer.textureType = TextureImporterType.Default;
            importer.sRGBTexture = false;
            importer.mipmapEnabled = false;
            importer.streamingMipmaps = false;
            importer.isReadable = false;
            importer.anisoLevel = 0;
            importer.filterMode = FilterMode.Bilinear;
            importer.wrapMode = TextureWrapMode.Clamp;
            importer.npotScale = TextureImporterNPOTScale.None;
            importer.alphaSource = TextureImporterAlphaSource.FromInput;
            importer.alphaIsTransparency = false;
            importer.maxTextureSize = AtlasResolution;
            importer.textureCompression = TextureImporterCompression.CompressedHQ;

            var standaloneSettings = importer.GetPlatformTextureSettings("Standalone");
            standaloneSettings.overridden = true;
            standaloneSettings.format = TextureImporterFormat.BC7;
            standaloneSettings.maxTextureSize = AtlasResolution;
            standaloneSettings.compressionQuality = 100;
            importer.SetPlatformTextureSettings(standaloneSettings);

            importer.SaveAndReimport();
        }

        /// <summary>
        /// Bakes atlas parameters to material for shader optimization.
        /// </summary>
        public static void BakeAtlasParams(Material mat, int atlasSize)
        {
            if (mat == null || atlasSize <= 0) return;

            mat.SetFloat(AtlasInvSize, 1.0f / atlasSize);
            mat.SetInt(AtlasMask, atlasSize - 1);
            mat.SetInt(AtlasShift, (int)Mathf.Log(atlasSize, 2));
            mat.SetFloat(AtlasHalfInvPxRange, 0.5f / 0.3f);
        }

        /// <summary>
        /// Calculates optimal atlas size based on character count.
        /// </summary>
        public static int CalculateOptimalAtlasSize(int charCount)
        {
            var size = 1;
            while (size * size < charCount)
                size *= 2;
            return Mathf.Max(2, size);
        }
    }
}
