using UnityEngine;
using UnityEditor;

[InitializeOnLoad]
public class EnableKeyword
{
    static EnableKeyword() => EditorApplication.update += UpdateKeyword;

    private static void UpdateKeyword()
    {
#if UNITY_EDITOR
        Shader.EnableKeyword("UNITY_EDITOR");
#endif
    }
}