using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Content drawer for Typography shader.
    /// Handles Text mode (TextInput + FontIndex + Gen button).
    /// </summary>
    public class ContentDrawer : MaterialPropertyDrawer
    {
        private const string TagTextPrefix = "_TextInput_Text_";
        private const string TagMapping = "_TextInput_Mapping";
        private const string AtlasRootFolder = "Assets/Typography_Atlases";
        private const string TypographyShaderName = "GekikaraStore/Typography";
        private const int MaxTextInputs = 32;

        private static float RowHeight => EditorGUIUtility.singleLineHeight;
        private const float ButtonWidth = 50f;

        private static readonly Dictionary<string, string> TextCaches = new();
        private static readonly int FontTextureArray = Shader.PropertyToID("_FontTextureArray");
        private static readonly int AtlasSize = Shader.PropertyToID("_AtlasSize");

        public ContentDrawer() { }
        public ContentDrawer(string unused) { }

        private static string GetIdFromPropertyName(string propName)
        {
            var i = propName.Length - 1;
            while (i >= 0 && char.IsDigit(propName[i]))
                i--;
            return i < propName.Length - 1 ? propName.Substring(i + 1) : "0";
        }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            var mat = (Material)prop.targets[0];
            var id = GetIdFromPropertyName(prop.name);
            DrawTextMode(position, mat, id, label);
        }

        private void DrawTextMode(Rect position, Material mat, string id, GUIContent label)
        {
            var cacheKey = $"{mat.GetInstanceID()}_{id}";
            if (!TextCaches.TryGetValue(cacheKey, out var text))
            {
                text = LoadText(mat, id);
                TextCaches[cacheKey] = text;
            }

            var fonts = FontsDrawer.GetAllFonts(mat);

            // Row 1: [TextField][GenButton]
            var textRect = new Rect(position.x, position.y, position.width - ButtonWidth - 4f, RowHeight);
            var buttonRect = new Rect(position.xMax - ButtonWidth, position.y, ButtonWidth, RowHeight);

            EditorGUI.BeginChangeCheck();
            var newText = EditorGUI.TextField(textRect, label, text);
            if (EditorGUI.EndChangeCheck())
            {
                TextCaches[cacheKey] = newText;
                SaveText(mat, id, newText);
            }

            var allTexts = GetAllTexts(mat);
            var hasAnyText = allTexts.Exists(t => !string.IsNullOrEmpty(t?.Trim()));
            using (new EditorGUI.DisabledScope(fonts.Count == 0 || !hasAnyText))
            {
                if (GUI.Button(buttonRect, "Gen"))
                {
                    GeneratePipeline(mat, fonts, allTexts);
                }
            }

            // Row 2: [FontPopup]
            var fontRect = new Rect(position.x, position.y + RowHeight + 2f, position.width, RowHeight);
            DrawFontPopup(fontRect, mat, id, fonts);
        }

        private void DrawFontPopup(Rect position, Material mat, string id, List<Font> fonts)
        {
            var fontPropName = $"_FontIndex{id}";
            if (!mat.HasProperty(fontPropName)) return;

            string[] options;
            int[] values;

            if (fonts.Count == 0)
            {
                options = new[] { "(None)" };
                values = new[] { 0 };
            }
            else
            {
                options = new string[fonts.Count];
                values = new int[fonts.Count];
                for (int i = 0; i < fonts.Count; i++)
                {
                    options[i] = fonts[i] != null ? fonts[i].name : "(None)";
                    values[i] = i;
                }
            }

            var currentValue = mat.GetInt(fontPropName);
            if (currentValue >= fonts.Count)
                currentValue = 0;

            EditorGUI.BeginChangeCheck();
            var newValue = EditorGUI.IntPopup(position, "Font", currentValue, options, values);
            if (EditorGUI.EndChangeCheck())
            {
                Undo.RecordObject(mat, "Change Font");
                mat.SetInt(fontPropName, newValue);
                EditorUtility.SetDirty(mat);
            }
        }

        public static string GetText(Material mat, string id) => mat.GetTag(TagTextPrefix + id, false, "");

        private static string LoadText(Material mat, string id) => mat.GetTag(TagTextPrefix + id, false, "");

        private static void SaveText(Material mat, string id, string text)
        {
            Undo.RecordObject(mat, "Change Text");
            mat.SetOverrideTag(TagTextPrefix + id, text);
            EditorUtility.SetDirty(mat);
        }

        public static List<string> GetAllTexts(Material mat)
        {
            var texts = new List<string>();
            var lastNonEmpty = -1;

            for (var i = 0; i < MaxTextInputs; i++)
            {
                if (!string.IsNullOrEmpty(GetText(mat, i.ToString())))
                    lastNonEmpty = i;
            }

            for (var i = 0; i <= lastNonEmpty; i++)
                texts.Add(GetText(mat, i.ToString()) ?? "");

            return texts;
        }

        public static List<int> GetAllFontIndices(Material mat, int textCount)
        {
            var indices = new List<int>();
            for (var i = 0; i < textCount; i++)
            {
                var propName = $"_FontIndex{i}";
                var fontIndex = mat.HasProperty(propName) ? mat.GetInt(propName) : 0;
                indices.Add(fontIndex);
            }
            return indices;
        }

        private static string GetProjectAtlasDirectory(string project) => $"{AtlasRootFolder}/{project}";
        private static string GetMappingFilePath(string project, int fontIndex) => $"{GetProjectAtlasDirectory(project)}/mapping_{fontIndex}.txt";

        private static void SaveProjectMapping(string project, int fontIndex, List<string> chars)
        {
            var dir = GetProjectAtlasDirectory(project);
            if (!Directory.Exists(dir))
                Directory.CreateDirectory(dir);

            var path = GetMappingFilePath(project, fontIndex);
            File.WriteAllText(path, string.Join("", chars));
        }

        private static int CalculateOptimalAtlasSize(int charCount)
        {
            var size = 1;
            while (size * size < charCount)
                size *= 2;
            return Mathf.Max(2, size);
        }

        private void GeneratePipeline(Material mat, List<Font> fonts, List<string> texts)
        {
            var project = ProjectDrawer.GetProject(mat);
            var projectDir = GetProjectAtlasDirectory(project);

            var allProjectMaterials = FindAllProjectMaterials(project);
            var requiredCharsPerFont = new List<HashSet<string>>();
            for (var fontIdx = 0; fontIdx < fonts.Count; fontIdx++)
                requiredCharsPerFont.Add(new HashSet<string>());

            foreach (var projectMat in allProjectMaterials)
            {
                var matTexts = GetAllTexts(projectMat);
                var matFontIndices = GetAllFontIndices(projectMat, matTexts.Count);

                for (var textIdx = 0; textIdx < matTexts.Count; textIdx++)
                {
                    var fontIdx = matFontIndices[textIdx];
                    if (fontIdx < 0 || fontIdx >= fonts.Count) continue;
                    
                    var textChars = MSDFAtlasGenerator.ExtractUniqueTextElements(matTexts[textIdx]);
                    foreach (var c in textChars)
                        requiredCharsPerFont[fontIdx].Add(c);
                }
            }

            var perFontCharacters = new List<List<string>>();
            for (var fontIdx = 0; fontIdx < fonts.Count; fontIdx++)
                perFontCharacters.Add(requiredCharsPerFont[fontIdx].ToList());

            var fontIndexToArrayIndex = new Dictionary<int, int>();
            var usedFontIndices = new List<int>();
            for (var i = 0; i < fonts.Count; i++)
            {
                if (perFontCharacters[i].Count <= 0) continue;
                
                fontIndexToArrayIndex[i] = usedFontIndices.Count;
                usedFontIndices.Add(i);
            }

            if (usedFontIndices.Count == 0)
            {
                usedFontIndices.Add(0);
                fontIndexToArrayIndex[0] = 0;
                perFontCharacters[0].Add(" ");
            }

            var maxCharsPerFont = perFontCharacters.Where(c => c.Count > 0).Max(c => c.Count);
            var atlasSize = CalculateOptimalAtlasSize(maxCharsPerFont);

            if (!Directory.Exists(projectDir))
                Directory.CreateDirectory(projectDir);

            var perFontMappings = new List<string>();
            for (var i = 0; i < fonts.Count; i++)
                perFontMappings.Add(string.Join("", perFontCharacters[i]));

            var atlasPaths = new List<string>();

            foreach (var fontIdx in usedFontIndices)
            {
                SaveProjectMapping(project, fontIdx, perFontCharacters[fontIdx]);

                var atlasPath = $"{projectDir}/atlas_{fontIdx}.png";
                var atlasFullPath = Path.GetFullPath(Path.Combine(Application.dataPath, "..", atlasPath));

                var generatedPath = MSDFAtlasGenerator.Generate(fonts[fontIdx], perFontCharacters[fontIdx], atlasSize, atlasFullPath);
                if (string.IsNullOrEmpty(generatedPath))
                {
                    Debug.LogError($"Failed to generate atlas for font {fontIdx}");
                    return;
                }
                atlasPaths.Add(generatedPath);
            }

            var atlases = MSDFAtlasGenerator.ImportAtlases(atlasPaths);
            if (atlases.Any(a => a == null))
            {
                Debug.LogError("Some atlases failed to import");
                return;
            }

            var fontArray = CreateProjectTexture2DArray(atlases, project);
            if (fontArray == null)
            {
                Debug.LogError("Failed to create Texture2DArray");
                return;
            }

            // Delay material updates to avoid cascading reimports during asset import
            var mappingString = string.Join("|", perFontMappings);
            var fontCount = usedFontIndices.Count;
            EditorApplication.delayCall += () =>
            {
                foreach (var projectMat in allProjectMaterials)
                {
                    projectMat.SetTexture(FontTextureArray, fontArray);
                    projectMat.SetFloat(AtlasSize, atlasSize);
                    MSDFAtlasGenerator.BakeAtlasParams(projectMat, atlasSize);
                    projectMat.SetOverrideTag(TagMapping, mappingString);
                    RegenerateDataTexture(projectMat, perFontMappings, fontIndexToArrayIndex);
                    EditorUtility.SetDirty(projectMat);
                }
                AssetDatabase.SaveAssets();
                Debug.Log($"[{project}] Atlas regenerated: {fontCount} fonts, {maxCharsPerFont} chars, {atlasSize}x{atlasSize}");
            };
        }

        private static List<Material> FindAllProjectMaterials(string project)
        {
            var result = new HashSet<Material>();

            // Search scene renderers for Typography materials
            var renderers = Object.FindObjectsByType<Renderer>(FindObjectsSortMode.None);
            foreach (var renderer in renderers)
            {
                foreach (var mat in renderer.sharedMaterials)
                {
                    if (mat == null || mat.shader == null) continue;
                    if (mat.shader.name != TypographyShaderName) continue;
                    if (ProjectDrawer.GetProject(mat) != project) continue;
                    result.Add(mat);
                }
            }

            return result.ToList();
        }

        private void RegenerateDataTexture(Material mat, List<string> mappings, Dictionary<int, int> fontIndexToArrayIndex)
        {
            var texts = GetAllTexts(mat);
            if (texts.Count == 0) return;

            var fontIndices = GetAllFontIndices(mat, texts.Count);
            var arrayIndices = fontIndices.Select(fi => fontIndexToArrayIndex.ContainsKey(fi) ? fontIndexToArrayIndex[fi] : 0).ToList();

            var dataTexture = EncodeMultiFontDataTexture(texts, arrayIndices, mappings);
            if (dataTexture == null) return;

            var project = ProjectDrawer.GetProject(mat);
            var projectDir = GetProjectAtlasDirectory(project);
            var dataAssetName = $"{mat.name}_data";
            var dataPath = $"{projectDir}/{dataAssetName}.asset";
            dataTexture.name = dataAssetName;

            var existingData = AssetDatabase.LoadAssetAtPath<Texture2D>(dataPath);
            if (existingData != null)
            {
                EditorUtility.CopySerialized(dataTexture, existingData);
                mat.SetTexture("_DataTexture", existingData);
            }
            else
            {
                AssetDatabase.CreateAsset(dataTexture, dataPath);
                mat.SetTexture("_DataTexture", dataTexture);
            }
        }

        private Texture2DArray CreateProjectTexture2DArray(List<Texture2D> atlases, string project)
        {
            if (atlases.Count == 0) return null;

            var width = atlases[0].width;
            var height = atlases[0].height;
            var format = atlases[0].format;

            var fontArray = new Texture2DArray(width, height, atlases.Count, format, false, false);
            fontArray.filterMode = FilterMode.Bilinear;
            fontArray.wrapMode = TextureWrapMode.Clamp;
            fontArray.name = "fonts";

            for (var i = 0; i < atlases.Count; i++)
                Graphics.CopyTexture(atlases[i], 0, 0, fontArray, i, 0);

            fontArray.Apply(false, true);

            var projectDir = GetProjectAtlasDirectory(project);
            var arrayPath = $"{projectDir}/fonts.asset";

            var existingArray = AssetDatabase.LoadAssetAtPath<Texture2DArray>(arrayPath);
            if (existingArray != null)
            {
                EditorUtility.CopySerialized(fontArray, existingArray);
                return existingArray;
            }

            AssetDatabase.CreateAsset(fontArray, arrayPath);
            return fontArray;
        }

        private Texture2D EncodeMultiFontDataTexture(List<string> texts, List<int> fontIndices, List<string> perFontMappings)
        {
            if (texts.Count == 0)
                return null;

            var maxChars = texts.Max(t => ExtractTextElements(t).Count);
            var charsAfterFirst2 = Mathf.Max(0, maxChars - 2);
            var width = Mathf.Max(1, 1 + Mathf.CeilToInt(charsAfterFirst2 / 4.0f));
            var height = texts.Count;

            var texture = new Texture2D(width, height, TextureFormat.RGBA64, false)
            {
                filterMode = FilterMode.Point,
                wrapMode = TextureWrapMode.Clamp,
                anisoLevel = 0
            };

            var pixels = new Color[width * height];

            for (var y = 0; y < height; y++)
            {
                var fontIndex = fontIndices[y];
                var mapping = fontIndex < perFontMappings.Count ? perFontMappings[fontIndex] : "";
                var charToIndex = CreateCharacterMapping(mapping);
                var lineElements = ExtractTextElements(texts[y]);
                var pixelY = height - 1 - y;

                for (var x = 0; x < width; x++)
                {
                    var pixel = x == 0
                        ? EncodeHeaderPixel(lineElements, fontIndex, charToIndex)
                        : EncodeCharPixel(x, lineElements, charToIndex);
                    pixels[pixelY * width + x] = pixel;
                }
            }

            texture.SetPixels(pixels);
            texture.Apply();
            return texture;
        }

        private static Color EncodeHeaderPixel(List<string> elements, int fontIndex, Dictionary<string, ushort> charToIndex)
        {
            var r = elements.Count / 65535.0f;
            var g = fontIndex / 65535.0f;
            var b = GetCharIndexNormalized(elements, 0, charToIndex);
            var a = GetCharIndexNormalized(elements, 1, charToIndex);
            return new Color(r, g, b, a);
        }

        private static Color EncodeCharPixel(int x, List<string> elements, Dictionary<string, ushort> charToIndex)
        {
            var baseIdx = 2 + (x - 1) * 4;
            var r = GetCharIndexNormalized(elements, baseIdx, charToIndex);
            var g = GetCharIndexNormalized(elements, baseIdx + 1, charToIndex);
            var b = GetCharIndexNormalized(elements, baseIdx + 2, charToIndex);
            var a = GetCharIndexNormalized(elements, baseIdx + 3, charToIndex);
            return new Color(r, g, b, a);
        }

        private static float GetCharIndexNormalized(List<string> elements, int idx, Dictionary<string, ushort> charToIndex)
        {
            if (idx >= elements.Count)
                return 0f;
            return charToIndex.TryGetValue(elements[idx], out ushort charIdx) ? charIdx / 65535.0f : 0f;
        }

        private static List<string> ExtractTextElements(string text)
        {
            var elements = new List<string>();
            var enumerator = System.Globalization.StringInfo.GetTextElementEnumerator(text);
            while (enumerator.MoveNext())
            {
                var element = enumerator.Current.ToString();
                if (!string.IsNullOrEmpty(element) && !char.IsControl(element[0]))
                    elements.Add(element);
            }
            return elements;
        }

        private static Dictionary<string, ushort> CreateCharacterMapping(string mapping)
        {
            var charToIndex = new Dictionary<string, ushort>();
            var seen = new HashSet<string>();
            var enumerator = System.Globalization.StringInfo.GetTextElementEnumerator(mapping);
            ushort index = 1;

            while (enumerator.MoveNext())
            {
                var element = enumerator.Current.ToString();
                if (string.IsNullOrEmpty(element) || char.IsControl(element[0]))
                    continue;
                if (!seen.Add(element))
                    continue;
                charToIndex[element] = index++;
            }

            return charToIndex;
        }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            // Text mode: 2 rows (Text + Font)
            return RowHeight * 2 + 2f;
        }
    }
}
