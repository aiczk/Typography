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
    }
}
