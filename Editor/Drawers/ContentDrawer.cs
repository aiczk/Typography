using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor.Drawers
{
    /// <summary>
    /// Unified content drawer for Typography shader.
    /// Handles Text mode (TextInput + FontIndex + Gen button) and Image mode (ImageTexture).
    /// </summary>
    public class ContentDrawer : MaterialPropertyDrawer
    {
        private const string TagTextPrefix = "_TextInput_Text_";
        private const string TagMapping = "_TextInput_Mapping";
        private const string AtlasRootFolder = "Assets/Typography_Atlases";
        private const int MaxTextInputs = 32;

        private static float RowHeight => EditorGUIUtility.singleLineHeight;
        private const float ButtonWidth = 50f;
        private const float FontPopupWidth = 80f;

        private static Dictionary<string, string> _textCaches = new();

        public ContentDrawer() { }
        public ContentDrawer(string unused) { }

        private static string GetIdFromPropertyName(string propName)
        {
            int i = propName.Length - 1;
            while (i >= 0 && char.IsDigit(propName[i]))
                i--;
            return i < propName.Length - 1 ? propName.Substring(i + 1) : "0";
        }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            Material mat = (Material)prop.targets[0];
            string id = GetIdFromPropertyName(prop.name);

            // Check Mode
            string modePropName = $"_Mode{id}";
            int mode = mat.HasProperty(modePropName) ? mat.GetInt(modePropName) : 0;

            if (mode == 1)
                DrawImageMode(position, mat, id);
            else
                DrawTextMode(position, mat, id, label);
        }

        private void DrawImageMode(Rect position, Material mat, string id)
        {
            string imgPropName = $"_ImageTexture{id}";
            Texture tex = mat.HasProperty(imgPropName) ? mat.GetTexture(imgPropName) : null;

            EditorGUI.BeginChangeCheck();
            Texture newTex = (Texture)EditorGUI.ObjectField(position, "Image", tex, typeof(Texture), false);
            if (EditorGUI.EndChangeCheck() && mat.HasProperty(imgPropName))
            {
                Undo.RecordObject(mat, "Change Image");
                mat.SetTexture(imgPropName, newTex);
                EditorUtility.SetDirty(mat);
            }
        }

        private void DrawTextMode(Rect position, Material mat, string id, GUIContent label)
        {
            string cacheKey = $"{mat.GetInstanceID()}_{id}";
            if (!_textCaches.TryGetValue(cacheKey, out var text))
            {
                text = LoadText(mat, id);
                _textCaches[cacheKey] = text;
            }

            List<Font> fonts = FontsDrawer.GetAllFonts(mat);

            // Row 1: [TextField][GenButton]
            Rect textRect = new Rect(position.x, position.y, position.width - ButtonWidth - 4f, RowHeight);
            Rect buttonRect = new Rect(position.xMax - ButtonWidth, position.y, ButtonWidth, RowHeight);

            EditorGUI.BeginChangeCheck();
            string newText = EditorGUI.TextField(textRect, label, text);
            if (EditorGUI.EndChangeCheck())
            {
                _textCaches[cacheKey] = newText;
                SaveText(mat, id, newText);
            }

            List<string> allTexts = GetAllTexts(mat);
            bool hasAnyText = allTexts.Exists(t => !string.IsNullOrEmpty(t?.Trim()));
            using (new EditorGUI.DisabledScope(fonts.Count == 0 || !hasAnyText))
            {
                if (GUI.Button(buttonRect, "Gen"))
                {
                    GeneratePipeline(mat, fonts, allTexts);
                }
            }

            // Row 2: [FontPopup]
            Rect fontRect = new Rect(position.x, position.y + RowHeight + 2f, position.width, RowHeight);
            DrawFontPopup(fontRect, mat, id, fonts);
        }

        private void DrawFontPopup(Rect position, Material mat, string id, List<Font> fonts)
        {
            string fontPropName = $"_FontIndex{id}";
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

            int currentValue = mat.GetInt(fontPropName);
            if (currentValue >= fonts.Count)
                currentValue = 0;

            EditorGUI.BeginChangeCheck();
            int newValue = EditorGUI.IntPopup(position, "Font", currentValue, options, values);
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
            int lastNonEmpty = -1;

            for (int i = 0; i < MaxTextInputs; i++)
            {
                if (!string.IsNullOrEmpty(GetText(mat, i.ToString())))
                    lastNonEmpty = i;
            }

            for (int i = 0; i <= lastNonEmpty; i++)
                texts.Add(GetText(mat, i.ToString()) ?? "");

            return texts;
        }

        public static List<int> GetAllFontIndices(Material mat, int textCount)
        {
            var indices = new List<int>();
            for (int i = 0; i < textCount; i++)
            {
                string propName = $"_FontIndex{i}";
                int fontIndex = mat.HasProperty(propName) ? mat.GetInt(propName) : 0;
                indices.Add(fontIndex);
            }
            return indices;
        }

        private static string GetProjectAtlasDirectory(string project) => $"{AtlasRootFolder}/{project}";

        private static string GetMappingFilePath(string project, int fontIndex) =>
            $"{GetProjectAtlasDirectory(project)}/mapping_{fontIndex}.txt";

        private static void SaveProjectMapping(string project, int fontIndex, List<string> chars)
        {
            string dir = GetProjectAtlasDirectory(project);
            if (!Directory.Exists(dir))
                Directory.CreateDirectory(dir);

            string path = GetMappingFilePath(project, fontIndex);
            File.WriteAllText(path, string.Join("", chars));
        }

        private static int CalculateOptimalAtlasSize(int charCount)
        {
            int size = 1;
            while (size * size < charCount)
                size *= 2;
            return Mathf.Max(2, size);
        }

        private void GeneratePipeline(Material mat, List<Font> fonts, List<string> texts)
        {
            string project = ProjectDrawer.GetProject(mat);
            string projectDir = GetProjectAtlasDirectory(project);

            var allProjectMaterials = FindAllProjectMaterials(project);
            var requiredCharsPerFont = new List<HashSet<string>>();
            for (int fontIdx = 0; fontIdx < fonts.Count; fontIdx++)
                requiredCharsPerFont.Add(new HashSet<string>());

            foreach (var projectMat in allProjectMaterials)
            {
                List<string> matTexts = GetAllTexts(projectMat);
                List<int> matFontIndices = GetAllFontIndices(projectMat, matTexts.Count);

                for (int textIdx = 0; textIdx < matTexts.Count; textIdx++)
                {
                    int fontIdx = matFontIndices[textIdx];
                    if (fontIdx >= 0 && fontIdx < fonts.Count)
                    {
                        var textChars = MSDFAtlasGenerator.ExtractUniqueTextElements(matTexts[textIdx]);
                        foreach (var c in textChars)
                            requiredCharsPerFont[fontIdx].Add(c);
                    }
                }
            }

            var perFontCharacters = new List<List<string>>();
            for (int fontIdx = 0; fontIdx < fonts.Count; fontIdx++)
                perFontCharacters.Add(requiredCharsPerFont[fontIdx].ToList());

            var fontIndexToArrayIndex = new Dictionary<int, int>();
            var usedFontIndices = new List<int>();
            for (int i = 0; i < fonts.Count; i++)
            {
                if (perFontCharacters[i].Count > 0)
                {
                    fontIndexToArrayIndex[i] = usedFontIndices.Count;
                    usedFontIndices.Add(i);
                }
            }

            if (usedFontIndices.Count == 0)
            {
                usedFontIndices.Add(0);
                fontIndexToArrayIndex[0] = 0;
                perFontCharacters[0].Add(" ");
            }

            int maxCharsPerFont = perFontCharacters.Where(c => c.Count > 0).Max(c => c.Count);
            int atlasSize = CalculateOptimalAtlasSize(maxCharsPerFont);

            if (!Directory.Exists(projectDir))
                Directory.CreateDirectory(projectDir);

            var perFontMappings = new List<string>();
            for (int i = 0; i < fonts.Count; i++)
                perFontMappings.Add(string.Join("", perFontCharacters[i]));

            var atlasPaths = new List<string>();

            for (int arrayIdx = 0; arrayIdx < usedFontIndices.Count; arrayIdx++)
            {
                int fontIdx = usedFontIndices[arrayIdx];
                SaveProjectMapping(project, fontIdx, perFontCharacters[fontIdx]);

                string atlasPath = $"{projectDir}/atlas_{fontIdx}.png";
                string atlasFullPath = Path.GetFullPath(Path.Combine(Application.dataPath, "..", atlasPath));

                string generatedPath = MSDFAtlasGenerator.Generate(fonts[fontIdx], perFontCharacters[fontIdx], atlasSize, atlasFullPath);
                if (string.IsNullOrEmpty(generatedPath))
                {
                    Debug.LogError($"Failed to generate atlas for font {fontIdx}");
                    return;
                }
                atlasPaths.Add(generatedPath);
            }

            List<Texture2D> atlases = MSDFAtlasGenerator.ImportAtlases(atlasPaths);
            if (atlases.Any(a => a == null))
            {
                Debug.LogError("Some atlases failed to import");
                return;
            }

            Texture2DArray fontArray = CreateProjectTexture2DArray(atlases, project);
            if (fontArray == null)
            {
                Debug.LogError("Failed to create Texture2DArray");
                return;
            }

            // Delay material updates to avoid cascading reimports during asset import
            string mappingString = string.Join("|", perFontMappings);
            int fontCount = usedFontIndices.Count;
            int charCount = maxCharsPerFont;
            EditorApplication.delayCall += () =>
            {
                foreach (var projectMat in allProjectMaterials)
                {
                    projectMat.SetTexture("_FontTextureArray", fontArray);
                    projectMat.SetFloat("_AtlasSize", atlasSize);
                    projectMat.SetOverrideTag(TagMapping, mappingString);
                    RegenerateDataTexture(projectMat, fonts, perFontMappings, fontIndexToArrayIndex);
                    EditorUtility.SetDirty(projectMat);
                }
                AssetDatabase.SaveAssets();
                Debug.Log($"[{project}] Atlas regenerated: {fontCount} fonts, {charCount} chars, {atlasSize}x{atlasSize}");
            };
        }

        private const string TypographyShaderName = "GekikaraStore/Typography";

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
                    if (ProjectDrawer.GetProject(mat) == project)
                        result.Add(mat);
                }
            }

            return result.ToList();
        }

        private void RegenerateDataTexture(Material mat, List<Font> fonts, List<string> mappings, Dictionary<int, int> fontIndexToArrayIndex)
        {
            List<string> texts = GetAllTexts(mat);
            if (texts.Count == 0) return;

            List<int> fontIndices = GetAllFontIndices(mat, texts.Count);
            var arrayIndices = fontIndices.Select(fi => fontIndexToArrayIndex.ContainsKey(fi) ? fontIndexToArrayIndex[fi] : 0).ToList();

            Texture2D dataTexture = EncodeMultiFontDataTexture(texts, arrayIndices, mappings);
            if (dataTexture == null) return;

            string project = ProjectDrawer.GetProject(mat);
            string projectDir = GetProjectAtlasDirectory(project);
            string dataPath = $"{projectDir}/{mat.name}_data.asset";

            Texture2D existingData = AssetDatabase.LoadAssetAtPath<Texture2D>(dataPath);
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

            int width = atlases[0].width;
            int height = atlases[0].height;
            TextureFormat format = atlases[0].format;

            var fontArray = new Texture2DArray(width, height, atlases.Count, format, false, false);
            fontArray.filterMode = FilterMode.Bilinear;
            fontArray.wrapMode = TextureWrapMode.Clamp;

            for (int i = 0; i < atlases.Count; i++)
                Graphics.CopyTexture(atlases[i], 0, 0, fontArray, i, 0);

            fontArray.Apply(false, true);

            string projectDir = GetProjectAtlasDirectory(project);
            string arrayPath = $"{projectDir}/fonts.asset";

            Texture2DArray existingArray = AssetDatabase.LoadAssetAtPath<Texture2DArray>(arrayPath);
            if (existingArray != null)
            {
                EditorUtility.CopySerialized(fontArray, existingArray);
                return existingArray;
            }
            else
            {
                AssetDatabase.CreateAsset(fontArray, arrayPath);
                return fontArray;
            }
        }

        private Texture2D EncodeMultiFontDataTexture(List<string> texts, List<int> fontIndices, List<string> perFontMappings)
        {
            int lineCount = texts.Count;
            if (lineCount == 0) return null;

            int maxChars = 0;
            for (int i = 0; i < texts.Count; i++)
            {
                int charCount = 0;
                var enumerator = System.Globalization.StringInfo.GetTextElementEnumerator(texts[i]);
                while (enumerator.MoveNext())
                {
                    string element = enumerator.Current.ToString();
                    if (!string.IsNullOrEmpty(element) && !char.IsControl(element[0]))
                        charCount++;
                }
                maxChars = Mathf.Max(maxChars, charCount);
            }

            int charsAfterFirst2 = Mathf.Max(0, maxChars - 2);
            int width = 1 + Mathf.CeilToInt(charsAfterFirst2 / 4.0f);
            width = Mathf.Max(1, width);
            int height = lineCount;

            var texture = new Texture2D(width, height, TextureFormat.RGBA64, false)
            {
                filterMode = FilterMode.Point,
                wrapMode = TextureWrapMode.Clamp,
                anisoLevel = 0
            };

            var pixels = new Color[width * height];

            for (int y = 0; y < height; y++)
            {
                string text = texts[y];
                int fontIndex = fontIndices[y];

                string mapping = fontIndex < perFontMappings.Count ? perFontMappings[fontIndex] : "";
                var charToIndex = CreateCharacterMapping(mapping);

                var lineElements = new List<string>();
                var enumerator = System.Globalization.StringInfo.GetTextElementEnumerator(text);
                while (enumerator.MoveNext())
                {
                    string element = enumerator.Current.ToString();
                    if (!string.IsNullOrEmpty(element) && !char.IsControl(element[0]))
                        lineElements.Add(element);
                }

                int pixelY = height - 1 - y;

                for (int x = 0; x < width; x++)
                {
                    float r = 0, g = 0, b = 0, a = 0;

                    if (x == 0)
                    {
                        r = lineElements.Count / 65535.0f;
                        g = fontIndex / 65535.0f;
                        b = (lineElements.Count > 0 && charToIndex.TryGetValue(lineElements[0], out ushort idx0)) ? idx0 / 65535.0f : 0;
                        a = (lineElements.Count > 1 && charToIndex.TryGetValue(lineElements[1], out ushort idx1)) ? idx1 / 65535.0f : 0;
                    }
                    else
                    {
                        int baseCharIdx = 2 + (x - 1) * 4;
                        r = (baseCharIdx < lineElements.Count && charToIndex.TryGetValue(lineElements[baseCharIdx], out ushort i0)) ? i0 / 65535.0f : 0;
                        g = (baseCharIdx + 1 < lineElements.Count && charToIndex.TryGetValue(lineElements[baseCharIdx + 1], out ushort i1)) ? i1 / 65535.0f : 0;
                        b = (baseCharIdx + 2 < lineElements.Count && charToIndex.TryGetValue(lineElements[baseCharIdx + 2], out ushort i2)) ? i2 / 65535.0f : 0;
                        a = (baseCharIdx + 3 < lineElements.Count && charToIndex.TryGetValue(lineElements[baseCharIdx + 3], out ushort i3)) ? i3 / 65535.0f : 0;
                    }

                    pixels[pixelY * width + x] = new Color(r, g, b, a);
                }
            }

            texture.SetPixels(pixels);
            texture.Apply();
            return texture;
        }

        private static Dictionary<string, ushort> CreateCharacterMapping(string mapping)
        {
            var charToIndex = new Dictionary<string, ushort>();
            var elements = new List<string>();
            var enumerator = System.Globalization.StringInfo.GetTextElementEnumerator(mapping);
            while (enumerator.MoveNext())
            {
                string element = enumerator.Current.ToString();
                if (!string.IsNullOrEmpty(element) && !char.IsControl(element[0]) && !elements.Contains(element))
                    elements.Add(element);
            }

            for (int i = 0; i < elements.Count; i++)
                charToIndex[elements[i]] = (ushort)(i + 1);

            return charToIndex;
        }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            Material mat = (Material)prop.targets[0];
            string id = GetIdFromPropertyName(prop.name);
            string modePropName = $"_Mode{id}";
            int mode = mat.HasProperty(modePropName) ? mat.GetInt(modePropName) : 0;

            // Text mode (Horizontal/Vertical): 2 rows (Text + Font), Image mode: 1 row
            return (mode == 0 || mode == 2) ? RowHeight * 2 + 2f : RowHeight;
        }
    }
}
