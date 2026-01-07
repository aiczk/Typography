using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using Object = UnityEngine.Object;

namespace Typography.Editor.Core
{
    /// <summary>
    /// Builds and manages texture assets for Typography.
    /// </summary>
    public static class TextureBuilder
    {
        public const int DefaultTextureSize = 512;
        public const int MaxSlotsPerType = 32;
        public const int TextureTypeCount = 3;  // Image, MatCap, Overlay

        private static readonly string[] TexturePrefixes = { "_ImageTexture", "_MatCapTex", "_TextureTex" };
        
        public static T CreateOrUpdate<T>(string assetPath, Func<T> creator) where T : Object
        {
            TypographyAssetPaths.EnsureDirectoryExists(assetPath);

            var existing = AssetDatabase.LoadAssetAtPath<T>(assetPath);

            if (existing != null)
            {
                var asset = creator();

                // Check dimensions for Texture2D
                if (existing is Texture2D existingTex && asset is Texture2D newTex)
                {
                    if (existingTex.width != newTex.width || existingTex.height != newTex.height ||
                        existingTex.format != newTex.format)
                    {
                        // Size/format mismatch: delete existing and create new
                        AssetDatabase.DeleteAsset(assetPath);
                        AssetDatabase.CreateAsset(asset, assetPath);
                        return AssetDatabase.LoadAssetAtPath<T>(assetPath);
                    }
                }

                // Check dimensions for Texture2DArray
                if (existing is Texture2DArray existingArr && asset is Texture2DArray newArr)
                {
                    if (existingArr.width != newArr.width || existingArr.height != newArr.height ||
                        existingArr.depth != newArr.depth || existingArr.format != newArr.format)
                    {
                        // Size/format/depth mismatch: delete existing and create new
                        AssetDatabase.DeleteAsset(assetPath);
                        AssetDatabase.CreateAsset(asset, assetPath);
                        return AssetDatabase.LoadAssetAtPath<T>(assetPath);
                    }
                }

                EditorUtility.CopySerialized(asset, existing);
                Object.DestroyImmediate(asset);
                return existing;
            }

            var newAsset = creator();
            AssetDatabase.CreateAsset(newAsset, assetPath);
            return AssetDatabase.LoadAssetAtPath<T>(assetPath);
        }

        public static Texture2D ConvertToRGBA32(Texture2D source, int targetSize)
        {
            var rt = RenderTexture.GetTemporary(targetSize, targetSize, 0, RenderTextureFormat.ARGB32);
            Graphics.Blit(source, rt);

            var prev = RenderTexture.active;
            RenderTexture.active = rt;

            var result = new Texture2D(targetSize, targetSize, TextureFormat.RGBA32, false);
            result.ReadPixels(new Rect(0, 0, targetSize, targetSize), 0, 0);
            result.Apply();

            RenderTexture.active = prev;
            RenderTexture.ReleaseTemporary(rt);

            return result;
        }

        public struct BuildResult
        {
            public Texture2DArray TextureArray;
            public Texture2D LayerLUT;
            public int TextureCount;
        }

        public static BuildResult BuildTextureArray(Material mat, string project, int textureSize = DefaultTextureSize)
        {
            var textures = new List<Texture2D>();
            var textureToLayer = new Dictionary<int, int>();
            var layerIndices = new byte[MaxSlotsPerType, TextureTypeCount];

            for (var s = 0; s < MaxSlotsPerType; s++)
                for (var t = 0; t < TextureTypeCount; t++)
                    layerIndices[s, t] = 255;

            for (var type = 0; type < TextureTypeCount; type++)
                CollectTextures(mat, TexturePrefixes[type], type, textures, layerIndices, textureToLayer);

            var lut = CreateLayerLUT(layerIndices, project);

            if (textures.Count == 0)
                return new BuildResult { TextureArray = null, LayerLUT = lut, TextureCount = 0 };

            var array = CreateTextureArray(textures, textureSize);
            var arrayPath = TypographyAssetPaths.GetTextureArrayPath(project);
            var savedArray = CreateOrUpdate(arrayPath, () => array);

            return new BuildResult { TextureArray = savedArray, LayerLUT = lut, TextureCount = textures.Count };
        }

        public static Texture2DArray BuildFontArray(List<Texture2D> atlases, string project)
        {
            if (atlases == null || atlases.Count == 0) return null;

            var width = atlases[0].width;
            var height = atlases[0].height;
            var format = atlases[0].format;

            var fontArray = new Texture2DArray(width, height, atlases.Count, format, false, true)
            {
                filterMode = FilterMode.Bilinear,
                wrapMode = TextureWrapMode.Clamp,
                name = "fonts"
            };

            for (var i = 0; i < atlases.Count; i++)
                Graphics.CopyTexture(atlases[i], 0, 0, fontArray, i, 0);

            fontArray.Apply(false, true);

            var arrayPath = TypographyAssetPaths.GetFontArrayPath(project);
            return CreateOrUpdate(arrayPath, () => fontArray);
        }

        private static void CollectTextures(
            Material mat, string prefix, int textureType,
            List<Texture2D> textures, byte[,] layerIndices, Dictionary<int, int> textureToLayer)
        {
            for (var slot = 0; slot < MaxSlotsPerType; slot++)
            {
                var propName = $"{prefix}{slot}";
                if (!mat.HasProperty(propName)) continue;

                if (mat.GetTexture(propName) is not Texture2D tex) continue;

                var texId = tex.GetInstanceID();

                if (textureToLayer.TryGetValue(texId, out var existingLayer))
                {
                    layerIndices[slot, textureType] = (byte)existingLayer;
                }
                else
                {
                    var layerIndex = textures.Count;
                    textures.Add(tex);
                    textureToLayer[texId] = layerIndex;
                    layerIndices[slot, textureType] = (byte)layerIndex;
                }
            }
        }

        private static Texture2DArray CreateTextureArray(List<Texture2D> textures, int textureSize)
        {
            var array = new Texture2DArray(textureSize, textureSize, textures.Count, TextureFormat.RGBA32, false, true)
            {
                filterMode = FilterMode.Bilinear,
                wrapMode = TextureWrapMode.Repeat,
                name = "textures"
            };

            for (var i = 0; i < textures.Count; i++)
            {
                var converted = ConvertToRGBA32(textures[i], textureSize);
                Graphics.CopyTexture(converted, 0, 0, array, i, 0);
                Object.DestroyImmediate(converted);
            }

            array.Apply(false, true);
            return array;
        }

        private static Texture2D CreateLayerLUT(byte[,] layerIndices, string project)
        {
            // Optimized LUT layout (32x2, RG8):
            // Row 0: R = Image layer
            // Row 1: R = MatCap layer, G = Overlay layer (packed for single fetch in Text pass)
            var lut = new Texture2D(MaxSlotsPerType, 2, TextureFormat.RG16, false, true)
            {
                filterMode = FilterMode.Point,
                wrapMode = TextureWrapMode.Clamp,
                name = "layer_lut"
            };

            var pixels = new Color[MaxSlotsPerType * 2];
            for (var slot = 0; slot < MaxSlotsPerType; slot++)
            {
                // Row 0: Image layer in R channel
                pixels[slot] = new Color(layerIndices[slot, 0] / 255f, 0, 0, 1);
                // Row 1: MatCap in R, Overlay in G (packed for Text pass optimization)
                pixels[MaxSlotsPerType + slot] = new Color(
                    layerIndices[slot, 1] / 255f,  // MatCap
                    layerIndices[slot, 2] / 255f,  // Overlay
                    0, 1);
            }

            lut.SetPixels(pixels);
            lut.Apply(false, true);

            var lutPath = TypographyAssetPaths.GetLayerLUTPath(project);
            return CreateOrUpdate(lutPath, () => lut);
        }
    }
}
