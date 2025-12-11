using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor
{
    /// <summary>
    /// Project単位でFonts配列を管理するScriptableObject。
    /// 同一Projectの全マテリアルで共有される。
    /// </summary>
    public class ProjectFontsStorage : ScriptableObject
    {
        private const string StorageFolder = "Assets/_Typography";
        private const string AssetPrefix = "ProjectFonts_";
        private const int MaxFonts = 8;

        [SerializeField]
        public List<Font> Fonts = new List<Font>();

        // Runtime cache
        private static readonly Dictionary<string, ProjectFontsStorage> _cache = new();

        /// <summary>
        /// 指定Projectのフォントリストを取得（自動マイグレーション付き）
        /// </summary>
        public static List<Font> GetFonts(string project)
        {
            var storage = GetOrCreate(project);
            return new List<Font>(storage.Fonts);
        }

        /// <summary>
        /// 指定Projectのフォントリストを設定
        /// </summary>
        public static void SetFonts(string project, List<Font> fonts)
        {
            var storage = GetOrCreate(project);

            Undo.RecordObject(storage, "Change Project Fonts");
            storage.Fonts = new List<Font>(fonts);
            EditorUtility.SetDirty(storage);
            AssetDatabase.SaveAssetIfDirty(storage);
        }

        /// <summary>
        /// 指定Projectのフォント数を取得
        /// </summary>
        public static int GetFontCount(string project)
        {
            var storage = GetOrCreate(project);
            return storage.Fonts.Count;
        }

        /// <summary>
        /// Storageを取得または作成
        /// </summary>
        public static ProjectFontsStorage GetOrCreate(string project)
        {
            if (string.IsNullOrEmpty(project))
                project = "Default";

            // Cache check
            if (_cache.TryGetValue(project, out var cached) && cached != null)
                return cached;

            // Try load existing
            string assetPath = GetAssetPath(project);
            var storage = AssetDatabase.LoadAssetAtPath<ProjectFontsStorage>(assetPath);

            if (storage == null)
            {
                // Create new
                if (!Directory.Exists(StorageFolder))
                    Directory.CreateDirectory(StorageFolder);

                storage = CreateInstance<ProjectFontsStorage>();
                AssetDatabase.CreateAsset(storage, assetPath);
                AssetDatabase.SaveAssets();
            }

            _cache[project] = storage;
            return storage;
        }

        /// <summary>
        /// 既存マテリアルタグからマイグレーション
        /// </summary>
        public static void MigrateFromMaterialTags(string project, Material mat)
        {
            var storage = GetOrCreate(project);

            // 既にFontsがあればスキップ
            if (storage.Fonts.Count > 0)
                return;

            // マテリアルタグからフォントを読み込み
            var fonts = LoadFontsFromMaterialTags(mat);
            if (fonts.Count > 0)
            {
                storage.Fonts = fonts;
                EditorUtility.SetDirty(storage);
                AssetDatabase.SaveAssetIfDirty(storage);
                Debug.Log($"[Typography] Migrated {fonts.Count} fonts from material to ProjectFontsStorage: {project}");
            }
        }

        /// <summary>
        /// マテリアルタグからフォントリストを読み込み（マイグレーション用）
        /// </summary>
        private static List<Font> LoadFontsFromMaterialTags(Material mat)
        {
            var fonts = new List<Font>();

            string countStr = mat.GetTag("_Fonts_Count", false, "0");
            if (!int.TryParse(countStr, out int count))
                count = 0;

            // 旧形式からのマイグレーション
            if (count == 0)
            {
                string[] oldPrefixes = { "_FontSettings_Font_", "_FontSetting_Font_" };
                foreach (var oldPrefix in oldPrefixes)
                {
                    for (int i = 0; i < MaxFonts; i++)
                    {
                        string path = mat.GetTag(oldPrefix + i, false, "");
                        if (string.IsNullOrEmpty(path))
                            break;
                        Font font = AssetDatabase.LoadAssetAtPath<Font>(path);
                        if (font != null)
                            fonts.Add(font);
                        else
                            break;
                    }
                    if (fonts.Count > 0)
                        break;
                }
                return fonts;
            }

            // 新形式
            for (int i = 0; i < count; i++)
            {
                string path = mat.GetTag("_Fonts_Font_" + i, false, "");
                Font font = string.IsNullOrEmpty(path) ? null : AssetDatabase.LoadAssetAtPath<Font>(path);
                fonts.Add(font);
            }

            // Trailing nulls を削除
            while (fonts.Count > 0 && fonts[fonts.Count - 1] == null)
                fonts.RemoveAt(fonts.Count - 1);

            return fonts;
        }

        /// <summary>
        /// キャッシュをクリア
        /// </summary>
        public static void ClearCache()
        {
            _cache.Clear();
        }

        private static string GetAssetPath(string project)
        {
            // ファイル名に使えない文字を置換
            string safeName = string.Join("_", project.Split(Path.GetInvalidFileNameChars()));
            return $"{StorageFolder}/{AssetPrefix}{safeName}.asset";
        }
    }
}
