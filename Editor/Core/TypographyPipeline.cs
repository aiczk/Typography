using System.Collections.Generic;
using System.Linq;
using Typography.Editor.Drawers;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Core
{
    /// <summary>
    /// Orchestrates the Typography generation pipeline.
    /// </summary>
    public static class TypographyPipeline
    {
        private static readonly int FontTextureArray = Shader.PropertyToID("_FontTextureArray");
        private static readonly int TextureArray = Shader.PropertyToID("_TextureArray");
        private static readonly int TextureLayerLUT = Shader.PropertyToID("_TextureLayerLUT");
        private static readonly int DataTexture = Shader.PropertyToID("_DataTexture");
        private const string TagMapping = "_TextInput_Mapping";

        /// <summary>
        /// Executes the full generation pipeline for a project.
        /// </summary>
        public static void Generate(Material mat, List<Font> fonts)
        {
            var project = ProjectDrawer.GetProject(mat);
            TypographyAssetPaths.EnsureProjectDirectoryExists(project);

            var allProjectMaterials = FindAllProjectMaterials(project);

            // Include the current material (may not be assigned to any Renderer in scene)
            if (!allProjectMaterials.Contains(mat))
                allProjectMaterials.Add(mat);

            var perFontChars = CollectPerFontCharacters(allProjectMaterials, fonts.Count);

            var (perFontCharacters, fontIndexToArrayIndex, usedFontIndices) =
                BuildFontMappings(perFontChars, fonts.Count);

            if (usedFontIndices.Count == 0)
            {
                Debug.LogWarning("[Typography] No characters to generate");
                return;
            }

            var maxChars = perFontCharacters.Where(c => c.Count > 0).Max(c => c.Count);
            var atlasSize = MSDFAtlasGenerator.CalculateOptimalAtlasSize(maxChars);
            var perFontMappings = perFontCharacters.Select(chars => string.Join("", chars)).ToList();

            var atlasPaths = GenerateAtlases(fonts, perFontCharacters, usedFontIndices, atlasSize, project);
            if (atlasPaths == null) return;

            var atlases = MSDFAtlasGenerator.ImportAtlases(atlasPaths);
            if (atlases.Any(a => a == null))
            {
                Debug.LogError("[Typography] Some atlases failed to import");
                return;
            }

            var fontArray = TextureBuilder.BuildFontArray(atlases, project);
            if (fontArray == null)
            {
                Debug.LogError("[Typography] Failed to create font Texture2DArray");
                return;
            }

            var unifiedMapping = string.Join("|", perFontMappings);
            var fontCount = usedFontIndices.Count;

            EditorApplication.delayCall += () =>
            {
                ApplyToAllMaterials(
                    allProjectMaterials, fontArray, atlasSize,
                    unifiedMapping, perFontMappings, fontIndexToArrayIndex, project, fontCount);
            };
        }

        /// <summary>
        /// Rebuilds texture arrays (MatCap/Image/Overlay) and LUT only.
        /// Does not regenerate font atlases or data textures.
        /// </summary>
        public static void ApplyTextures(Material mat)
        {
            var project = ProjectDrawer.GetProject(mat);
            TypographyAssetPaths.EnsureProjectDirectoryExists(project);

            var allProjectMaterials = FindAllProjectMaterials(project);

            // Include the current material (may not be assigned to any Renderer in scene)
            if (!allProjectMaterials.Contains(mat))
                allProjectMaterials.Add(mat);

            var textureResult = TextureBuilder.BuildTextureArray(mat, project);

            foreach (var m in allProjectMaterials)
            {
                if (textureResult.TextureArray != null)
                    m.SetTexture(TextureArray, textureResult.TextureArray);
                if (textureResult.LayerLUT != null)
                    m.SetTexture(TextureLayerLUT, textureResult.LayerLUT);

                EditorUtility.SetDirty(m);
            }

            AssetDatabase.SaveAssets();
            Debug.Log($"[{project}] Applied textures: {textureResult.TextureCount} layers");
        }

        private static void ApplyToAllMaterials(
            List<Material> materials,
            Texture2DArray fontArray,
            int atlasSize,
            string unifiedMapping,
            List<string> perFontMappings,
            Dictionary<int, int> fontIndexToArrayIndex,
            string project,
            int fontCount)
        {
            foreach (var mat in materials)
            {
                mat.SetTexture(FontTextureArray, fontArray);
                MSDFAtlasGenerator.BakeAtlasParams(mat, atlasSize);
                mat.SetOverrideTag(TagMapping, unifiedMapping);

                RegenerateDataTexture(mat, perFontMappings, fontIndexToArrayIndex);
                EditorUtility.SetDirty(mat);
            }

            AssetDatabase.SaveAssets();
            Debug.Log($"[{project}] Generated: {fontCount} fonts, {atlasSize}x{atlasSize}");
        }

        private static List<List<string>> CollectPerFontCharacters(List<Material> materials, int fontCount)
        {
            // Use List + HashSet to preserve insertion order (like downloaded version)
            var perFontChars = new List<List<string>>();
            var perFontSeen = new List<HashSet<string>>();
            for (var i = 0; i < fontCount; i++)
            {
                perFontChars.Add(new List<string>());
                perFontSeen.Add(new HashSet<string>());
            }

            foreach (var mat in materials)
            {
                var texts = ContentDrawer.GetAllTexts(mat);
                var fontIndices = ContentDrawer.GetAllFontIndices(mat, texts.Count);

                for (var i = 0; i < texts.Count; i++)
                {
                    var fontIdx = i < fontIndices.Count ? fontIndices[i] : 0;
                    if (fontIdx < 0 || fontIdx >= fontCount) continue;

                    foreach (var c in TextElementExtractor.ExtractUniqueElements(texts[i]))
                    {
                        if (perFontSeen[fontIdx].Add(c))
                            perFontChars[fontIdx].Add(c);
                    }
                }
            }

            return perFontChars;
        }

        private static (List<List<string>>, Dictionary<int, int>, List<int>) BuildFontMappings(List<List<string>> perFontChars, int fontCount)
        {
            var perFontCharacters = perFontChars;
            var fontIndexToArrayIndex = new Dictionary<int, int>();
            var usedFontIndices = new List<int>();

            for (var i = 0; i < fontCount; i++)
            {
                if (perFontCharacters[i].Count <= 0) continue;
                fontIndexToArrayIndex[i] = usedFontIndices.Count;
                usedFontIndices.Add(i);
            }

            if (usedFontIndices.Count == 0 && perFontCharacters.Count > 0)
            {
                usedFontIndices.Add(0);
                fontIndexToArrayIndex[0] = 0;
                perFontCharacters[0].Add(" ");
            }

            return (perFontCharacters, fontIndexToArrayIndex, usedFontIndices);
        }

        private static List<string> GenerateAtlases(
            List<Font> fonts,
            List<List<string>> perFontCharacters,
            List<int> usedFontIndices,
            int atlasSize,
            string project)
        {
            var atlasPaths = new List<string>();

            foreach (var fontIdx in usedFontIndices)
            {
                var atlasFullPath = TypographyAssetPaths.ToFullPath(
                    TypographyAssetPaths.GetFontAtlasPath(project, fontIdx));

                var generatedPath = MSDFAtlasGenerator.Generate(
                    fonts[fontIdx], perFontCharacters[fontIdx], atlasSize, atlasFullPath);

                if (string.IsNullOrEmpty(generatedPath))
                {
                    Debug.LogError($"[Typography] Failed to generate atlas for font {fontIdx}");
                    return null;
                }

                atlasPaths.Add(generatedPath);
            }

            return atlasPaths;
        }

        private static void RegenerateDataTexture(Material mat, List<string> perFontMappings, Dictionary<int, int> fontIndexToArrayIndex)
        {
            var texts = ContentDrawer.GetAllTexts(mat);
            if (texts.Count == 0) return;

            var fontIndices = ContentDrawer.GetAllFontIndices(mat, texts.Count);
            var perFontCharMappings = perFontMappings
                .Select(m => TextElementExtractor.CreateMapping(m, 1))
                .ToList();

            var dataTexture = DataTextureEncoder.Encode(
                texts, fontIndices, perFontCharMappings, fontIndexToArrayIndex);

            if (dataTexture == null) return;

            var project = ProjectDrawer.GetProject(mat);
            var dataPath = TypographyAssetPaths.GetDataTexturePath(project, mat.name);
            dataTexture.name = $"{mat.name}_data";

            var savedTexture = TextureBuilder.CreateOrUpdate(dataPath, () => dataTexture);
            mat.SetTexture(DataTexture, savedTexture);
        }

        private static List<Material> FindAllProjectMaterials(string project)
        {
            var result = new HashSet<Material>();

            foreach (var renderer in Object.FindObjectsByType<Renderer>(FindObjectsSortMode.None))
            {
                foreach (var mat in renderer.sharedMaterials)
                {
                    if (mat == null || mat.shader == null) continue;
                    if (mat.shader.name != TypographyAssetPaths.TypographyShaderName) continue;
                    if (ProjectDrawer.GetProject(mat) != project) continue;
                    result.Add(mat);
                }
            }

            return result.ToList();
        }
    }
}
