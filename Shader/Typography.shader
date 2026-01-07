Shader "GekikaraStore/Typography"
{
    Properties
    {
        [HideInInspector] shader_is_using_thry_editor("", Float) = 0
        [HideInInspector] _ForgotToLockMaterial ("%.%.%.%.%.%.%.%.%.%.%.%.%.%.%.%.%.%.%.%.", Int) = 1
        [ThryShaderOptimizerLockButton] _ShaderOptimizerEnabled ("", Int) = 0
        [HideInInspector] GeometryShader_Enabled ("", Float) = 1
        [HideInInspector] shader_master_label("<b><i><color=#858585>T</color><color=#9D9D9D>y</color><color=#B5B5B5>p</color><color=#CECECE>o</color><color=#E6E6E6>g</color><color=#FFFFFF>r</color><color=#E6E6E6>a</color><color=#CECECE>p</color><color=#B5B5B5>h</color><color=#9D9D9D>y</color></i></b>", Float) = 0
        [HideInInspector] _DFC ("Debug Frustum Culling", Float) = 0

        [Project] _Project ("Project", Int) = 0

        [HideInInspector] m_start_camera_setting ("<b><i><color=#C0C0C0>C</color><color=#C4C4C4>a</color><color=#C8C8C8>m</color><color=#CCCCCC>e</color><color=#D0D0D0>r</color><color=#D4D4D4>a</color> <color=#DDDDDD>S</color><color=#E1E1E1>e</color><color=#E5E5E5>t</color><color=#E9E9E9>t</color><color=#EEEEEE>i</color><color=#F2F2F2>n</color><color=#F6F6F6>g</color><color=#FAFAFA>s</color></i></b>", Float) = 0
            [Vector3] _CameraPosition ("Position", Vector) = (0, 0, -100, 0)
            [Vector3] _CameraRotation ("Rotation", Vector) = (0, 0, 0, 0)
            _CameraFOV ("FOV", Range(10, 120)) = 60.0
        [HideInInspector] m_end_camera_setting ("Camera Settings", Float) = 0
        
        [HideInInspector] m_start_root_setting ("<b><i><color=#FF8000>R</color><color=#FF8811>o</color><color=#FF9022>o</color><color=#FF9933>t</color> <color=#FFAA55>T</color><color=#FFB266>r</color><color=#FFBB77>a</color><color=#FFC388>n</color><color=#FFCC99>s</color><color=#FFD4AA>f</color><color=#FFDDBB>o</color><color=#FFE5CC>r</color><color=#FFEEDD>m</color><color=#FFF6EE>s</color></i></b>", Float) = 0
            [HideInInspector] m_start_root0 ("Root 1", Float) = 0
                [Vector3] _RootPosition0 ("Position", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootRotation0 ("Rotation", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootScale0 ("Scale", Vector) = (1, 1, 1, 0)
                [HideInInspector] _RootMatrix0_Row0 ("", Vector) = (1, 0, 0, 0)
                [HideInInspector] _RootMatrix0_Row1 ("", Vector) = (0, 1, 0, 0)
                [HideInInspector] _RootMatrix0_Row2 ("", Vector) = (0, 0, 1, 0)
            [HideInInspector] m_end_root0 ("Root 1", Float) = 0
            [HideInInspector] m_start_root1 ("Root 2", Float) = 0
                [Vector3] _RootPosition1 ("Position", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootRotation1 ("Rotation", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootScale1 ("Scale", Vector) = (1, 1, 1, 0)
                [HideInInspector] _RootMatrix1_Row0 ("", Vector) = (1, 0, 0, 0)
                [HideInInspector] _RootMatrix1_Row1 ("", Vector) = (0, 1, 0, 0)
                [HideInInspector] _RootMatrix1_Row2 ("", Vector) = (0, 0, 1, 0)
            [HideInInspector] m_end_root1 ("Root 2", Float) = 0
            [HideInInspector] m_start_root2 ("Root 3", Float) = 0
                [Vector3] _RootPosition2 ("Position", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootRotation2 ("Rotation", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootScale2 ("Scale", Vector) = (1, 1, 1, 0)
                [HideInInspector] _RootMatrix2_Row0 ("", Vector) = (1, 0, 0, 0)
                [HideInInspector] _RootMatrix2_Row1 ("", Vector) = (0, 1, 0, 0)
                [HideInInspector] _RootMatrix2_Row2 ("", Vector) = (0, 0, 1, 0)
            [HideInInspector] m_end_root2 ("Root 3", Float) = 0
            [HideInInspector] m_start_root3 ("Root 4", Float) = 0
                [Vector3] _RootPosition3 ("Position", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootRotation3 ("Rotation", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootScale3 ("Scale", Vector) = (1, 1, 1, 0)
                [HideInInspector] _RootMatrix3_Row0 ("", Vector) = (1, 0, 0, 0)
                [HideInInspector] _RootMatrix3_Row1 ("", Vector) = (0, 1, 0, 0)
                [HideInInspector] _RootMatrix3_Row2 ("", Vector) = (0, 0, 1, 0)
            [HideInInspector] m_end_root3 ("Root 4", Float) = 0
            [HideInInspector] m_start_root4 ("Root 5", Float) = 0
                [Vector3] _RootPosition4 ("Position", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootRotation4 ("Rotation", Vector) = (0, 0, 0, 0)
                [RootTransform] _RootScale4 ("Scale", Vector) = (1, 1, 1, 0)
                [HideInInspector] _RootMatrix4_Row0 ("", Vector) = (1, 0, 0, 0)
                [HideInInspector] _RootMatrix4_Row1 ("", Vector) = (0, 1, 0, 0)
                [HideInInspector] _RootMatrix4_Row2 ("", Vector) = (0, 0, 1, 0)
            [HideInInspector] m_end_root4 ("Root 5", Float) = 0
        [HideInInspector] m_end_root_setting ("Root Transforms", Float) = 0

        [HideInInspector] m_start_image_setting ("<b><i><color=#008040>I</color><color=#12894D>m</color><color=#24925B>a</color><color=#369B68>g</color><color=#48A476>e</color> <color=#6DB691>S</color><color=#7FBF9F>e</color><color=#91C8AD>t</color><color=#A3D1BA>t</color><color=#B6DAC8>i</color><color=#C8E3D6>n</color><color=#DAECE3>g</color><color=#ECF5F1>s</color></i></b>", Float) = 0
        
            [HideInInspector][Toggle] _ImageUse0 ("", Float) = 0
            [HideInInspector] m_start_image_setting0 (" --{reference_property:_ImageUse0}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace0 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex0 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI0 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture0 ("Image--{reference_properties:[_ApplyTexturesI0]}", 2D) = "white" {}
                [IntRange] _ImageLayer0 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor0 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition0 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation0 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale0 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot0 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook0 ("Flipbook", Float) = 0
                    _ImageFlipbookCols0 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows0 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed0 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook0 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey0 ("Chroma Key", Float) = 0
                    _ImageChromaKey0 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold0 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering0 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey0 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting0 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel0 ("Image 0", Int) = 0
        
            [HideInInspector][Toggle] _ImageUse1 ("", Float) = 0
            [HideInInspector] m_start_image_setting1 (" --{reference_property:_ImageUse1}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace1 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex1 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI1 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture1 ("Image--{reference_properties:[_ApplyTexturesI1]}", 2D) = "white" {}
                [IntRange] _ImageLayer1 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor1 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition1 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation1 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale1 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot1 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook1 ("Flipbook", Float) = 0
                    _ImageFlipbookCols1 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows1 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed1 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook1 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey1 ("Chroma Key", Float) = 0
                    _ImageChromaKey1 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold1 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering1 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey1 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting1 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel1 ("Image 1", Int) = 0
        
            [HideInInspector][Toggle] _ImageUse2 ("", Float) = 0
            [HideInInspector] m_start_image_setting2 (" --{reference_property:_ImageUse2}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace2 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex2 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI2 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture2 ("Image--{reference_properties:[_ApplyTexturesI2]}", 2D) = "white" {}
                [IntRange] _ImageLayer2 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor2 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition2 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation2 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale2 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot2 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook2 ("Flipbook", Float) = 0
                    _ImageFlipbookCols2 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows2 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed2 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook2 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey2 ("Chroma Key", Float) = 0
                    _ImageChromaKey2 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold2 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering2 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey2 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting2 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel2 ("Image 2", Int) = 0
        
            [HideInInspector][Toggle] _ImageUse3 ("", Float) = 0
            [HideInInspector] m_start_image_setting3 (" --{reference_property:_ImageUse3}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace3 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex3 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI3 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture3 ("Image--{reference_properties:[_ApplyTexturesI3]}", 2D) = "white" {}
                [IntRange] _ImageLayer3 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor3 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition3 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation3 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale3 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot3 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook3 ("Flipbook", Float) = 0
                    _ImageFlipbookCols3 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows3 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed3 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook3 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey3 ("Chroma Key", Float) = 0
                    _ImageChromaKey3 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold3 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering3 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey3 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting3 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel3 ("Image 3", Int) = 0
        
            [HideInInspector][Toggle] _ImageUse4 ("", Float) = 0
            [HideInInspector] m_start_image_setting4 (" --{reference_property:_ImageUse4}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace4 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex4 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI4 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture4 ("Image--{reference_properties:[_ApplyTexturesI4]}", 2D) = "white" {}
                [IntRange] _ImageLayer4 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor4 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition4 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation4 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale4 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot4 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook4 ("Flipbook", Float) = 0
                    _ImageFlipbookCols4 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows4 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed4 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook4 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey4 ("Chroma Key", Float) = 0
                    _ImageChromaKey4 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold4 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering4 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey4 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting4 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel4 ("Image 4", Int) = 0
        
            [HideInInspector][Toggle] _ImageUse5 ("", Float) = 0
            [HideInInspector] m_start_image_setting5 (" --{reference_property:_ImageUse5}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace5 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex5 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI5 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture5 ("Image--{reference_properties:[_ApplyTexturesI5]}", 2D) = "white" {}
                [IntRange] _ImageLayer5 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor5 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition5 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation5 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale5 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot5 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook5 ("Flipbook", Float) = 0
                    _ImageFlipbookCols5 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows5 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed5 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook5 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey5 ("Chroma Key", Float) = 0
                    _ImageChromaKey5 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold5 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering5 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey5 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting5 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel5 ("Image 5", Int) = 0
        
            [HideInInspector][Toggle] _ImageUse6 ("", Float) = 0
            [HideInInspector] m_start_image_setting6 (" --{reference_property:_ImageUse6}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace6 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex6 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI6 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture6 ("Image--{reference_properties:[_ApplyTexturesI6]}", 2D) = "white" {}
                [IntRange] _ImageLayer6 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor6 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition6 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation6 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale6 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot6 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook6 ("Flipbook", Float) = 0
                    _ImageFlipbookCols6 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows6 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed6 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook6 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey6 ("Chroma Key", Float) = 0
                    _ImageChromaKey6 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold6 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering6 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey6 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting6 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel6 ("Image 6", Int) = 0

            [HideInInspector][Toggle] _ImageUse7 ("", Float) = 0
            [HideInInspector] m_start_image_setting7 (" --{reference_property:_ImageUse7}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace7 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex7 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI7 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture7 ("Image--{reference_properties:[_ApplyTexturesI7]}", 2D) = "white" {}
                [IntRange] _ImageLayer7 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor7 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition7 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation7 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale7 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot7 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook7 ("Flipbook", Float) = 0
                    _ImageFlipbookCols7 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows7 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed7 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook7 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey7 ("Chroma Key", Float) = 0
                    _ImageChromaKey7 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold7 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering7 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey7 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting7 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel7 ("Image 7", Int) = 0

            [HideInInspector][Toggle] _ImageUse8 ("", Float) = 0
            [HideInInspector] m_start_image_setting8 (" --{reference_property:_ImageUse8}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace8 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex8 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI8 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture8 ("Image--{reference_properties:[_ApplyTexturesI8]}", 2D) = "white" {}
                [IntRange] _ImageLayer8 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor8 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition8 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation8 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale8 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot8 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook8 ("Flipbook", Float) = 0
                    _ImageFlipbookCols8 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows8 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed8 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook8 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey8 ("Chroma Key", Float) = 0
                    _ImageChromaKey8 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold8 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering8 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey8 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting8 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel8 ("Image 8", Int) = 0

            [HideInInspector][Toggle] _ImageUse9 ("", Float) = 0
            [HideInInspector] m_start_image_setting9 (" --{reference_property:_ImageUse9}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace9 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex9 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI9 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture9 ("Image--{reference_properties:[_ApplyTexturesI9]}", 2D) = "white" {}
                [IntRange] _ImageLayer9 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor9 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition9 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation9 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale9 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot9 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook9 ("Flipbook", Float) = 0
                    _ImageFlipbookCols9 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows9 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed9 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook9 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey9 ("Chroma Key", Float) = 0
                    _ImageChromaKey9 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold9 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering9 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey9 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting9 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel9 ("Image 9", Int) = 0

            [HideInInspector][Toggle] _ImageUse10 ("", Float) = 0
            [HideInInspector] m_start_image_setting10 (" --{reference_property:_ImageUse10}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace10 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex10 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI10 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture10 ("Image--{reference_properties:[_ApplyTexturesI10]}", 2D) = "white" {}
                [IntRange] _ImageLayer10 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor10 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition10 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation10 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale10 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot10 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook10 ("Flipbook", Float) = 0
                    _ImageFlipbookCols10 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows10 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed10 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook10 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey10 ("Chroma Key", Float) = 0
                    _ImageChromaKey10 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold10 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering10 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey10 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting10 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel10 ("Image 10", Int) = 0

            [HideInInspector][Toggle] _ImageUse11 ("", Float) = 0
            [HideInInspector] m_start_image_setting11 (" --{reference_property:_ImageUse11}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace11 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex11 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI11 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture11 ("Image--{reference_properties:[_ApplyTexturesI11]}", 2D) = "white" {}
                [IntRange] _ImageLayer11 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor11 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition11 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation11 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale11 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot11 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook11 ("Flipbook", Float) = 0
                    _ImageFlipbookCols11 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows11 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed11 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook11 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey11 ("Chroma Key", Float) = 0
                    _ImageChromaKey11 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold11 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering11 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey11 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting11 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel11 ("Image 11", Int) = 0

            [HideInInspector][Toggle] _ImageUse12 ("", Float) = 0
            [HideInInspector] m_start_image_setting12 (" --{reference_property:_ImageUse12}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace12 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex12 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI12 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture12 ("Image--{reference_properties:[_ApplyTexturesI12]}", 2D) = "white" {}
                [IntRange] _ImageLayer12 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor12 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition12 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation12 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale12 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot12 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook12 ("Flipbook", Float) = 0
                    _ImageFlipbookCols12 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows12 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed12 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook12 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey12 ("Chroma Key", Float) = 0
                    _ImageChromaKey12 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold12 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering12 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey12 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting12 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel12 ("Image 12", Int) = 0

            [HideInInspector][Toggle] _ImageUse13 ("", Float) = 0
            [HideInInspector] m_start_image_setting13 (" --{reference_property:_ImageUse13}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace13 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex13 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI13 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture13 ("Image--{reference_properties:[_ApplyTexturesI13]}", 2D) = "white" {}
                [IntRange] _ImageLayer13 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor13 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition13 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation13 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale13 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot13 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook13 ("Flipbook", Float) = 0
                    _ImageFlipbookCols13 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows13 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed13 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook13 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey13 ("Chroma Key", Float) = 0
                    _ImageChromaKey13 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold13 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering13 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey13 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting13 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel13 ("Image 13", Int) = 0

            [HideInInspector][Toggle] _ImageUse14 ("", Float) = 0
            [HideInInspector] m_start_image_setting14 (" --{reference_property:_ImageUse14}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace14 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex14 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI14 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture14 ("Image--{reference_properties:[_ApplyTexturesI14]}", 2D) = "white" {}
                [IntRange] _ImageLayer14 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor14 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition14 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation14 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale14 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot14 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook14 ("Flipbook", Float) = 0
                    _ImageFlipbookCols14 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows14 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed14 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook14 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey14 ("Chroma Key", Float) = 0
                    _ImageChromaKey14 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold14 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering14 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey14 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting14 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel14 ("Image 14", Int) = 0

            [HideInInspector][Toggle] _ImageUse15 ("", Float) = 0
            [HideInInspector] m_start_image_setting15 (" --{reference_property:_ImageUse15}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace15 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex15 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI15 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture15 ("Image--{reference_properties:[_ApplyTexturesI15]}", 2D) = "white" {}
                [IntRange] _ImageLayer15 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor15 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition15 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation15 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale15 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot15 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook15 ("Flipbook", Float) = 0
                    _ImageFlipbookCols15 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows15 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed15 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook15 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey15 ("Chroma Key", Float) = 0
                    _ImageChromaKey15 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold15 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering15 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey15 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting15 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel15 ("Image 15", Int) = 0

            [HideInInspector][Toggle] _ImageUse16 ("", Float) = 0
            [HideInInspector] m_start_image_setting16 (" --{reference_property:_ImageUse16}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace16 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex16 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI16 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture16 ("Image--{reference_properties:[_ApplyTexturesI16]}", 2D) = "white" {}
                [IntRange] _ImageLayer16 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor16 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition16 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation16 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale16 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot16 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook16 ("Flipbook", Float) = 0
                    _ImageFlipbookCols16 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows16 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed16 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook16 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey16 ("Chroma Key", Float) = 0
                    _ImageChromaKey16 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold16 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering16 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey16 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting16 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel16 ("Image 16", Int) = 0

            [HideInInspector][Toggle] _ImageUse17 ("", Float) = 0
            [HideInInspector] m_start_image_setting17 (" --{reference_property:_ImageUse17}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace17 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex17 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI17 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture17 ("Image--{reference_properties:[_ApplyTexturesI17]}", 2D) = "white" {}
                [IntRange] _ImageLayer17 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor17 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition17 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation17 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale17 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot17 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook17 ("Flipbook", Float) = 0
                    _ImageFlipbookCols17 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows17 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed17 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook17 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey17 ("Chroma Key", Float) = 0
                    _ImageChromaKey17 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold17 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering17 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey17 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting17 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel17 ("Image 17", Int) = 0

            [HideInInspector][Toggle] _ImageUse18 ("", Float) = 0
            [HideInInspector] m_start_image_setting18 (" --{reference_property:_ImageUse18}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace18 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex18 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI18 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture18 ("Image--{reference_properties:[_ApplyTexturesI18]}", 2D) = "white" {}
                [IntRange] _ImageLayer18 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor18 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition18 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation18 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale18 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot18 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook18 ("Flipbook", Float) = 0
                    _ImageFlipbookCols18 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows18 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed18 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook18 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey18 ("Chroma Key", Float) = 0
                    _ImageChromaKey18 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold18 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering18 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey18 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting18 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel18 ("Image 18", Int) = 0

            [HideInInspector][Toggle] _ImageUse19 ("", Float) = 0
            [HideInInspector] m_start_image_setting19 (" --{reference_property:_ImageUse19}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace19 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex19 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI19 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture19 ("Image--{reference_properties:[_ApplyTexturesI19]}", 2D) = "white" {}
                [IntRange] _ImageLayer19 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor19 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition19 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation19 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale19 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot19 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook19 ("Flipbook", Float) = 0
                    _ImageFlipbookCols19 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows19 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed19 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook19 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey19 ("Chroma Key", Float) = 0
                    _ImageChromaKey19 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold19 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering19 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey19 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting19 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel19 ("Image 19", Int) = 0

            [HideInInspector][Toggle] _ImageUse20 ("", Float) = 0
            [HideInInspector] m_start_image_setting20 (" --{reference_property:_ImageUse20}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace20 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex20 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI20 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture20 ("Image--{reference_properties:[_ApplyTexturesI20]}", 2D) = "white" {}
                [IntRange] _ImageLayer20 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor20 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition20 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation20 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale20 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot20 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook20 ("Flipbook", Float) = 0
                    _ImageFlipbookCols20 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows20 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed20 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook20 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey20 ("Chroma Key", Float) = 0
                    _ImageChromaKey20 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold20 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering20 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey20 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting20 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel20 ("Image 20", Int) = 0

            [HideInInspector][Toggle] _ImageUse21 ("", Float) = 0
            [HideInInspector] m_start_image_setting21 (" --{reference_property:_ImageUse21}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace21 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex21 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI21 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture21 ("Image--{reference_properties:[_ApplyTexturesI21]}", 2D) = "white" {}
                [IntRange] _ImageLayer21 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor21 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition21 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation21 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale21 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot21 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook21 ("Flipbook", Float) = 0
                    _ImageFlipbookCols21 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows21 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed21 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook21 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey21 ("Chroma Key", Float) = 0
                    _ImageChromaKey21 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold21 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering21 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey21 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting21 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel21 ("Image 21", Int) = 0

            [HideInInspector][Toggle] _ImageUse22 ("", Float) = 0
            [HideInInspector] m_start_image_setting22 (" --{reference_property:_ImageUse22}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace22 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex22 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI22 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture22 ("Image--{reference_properties:[_ApplyTexturesI22]}", 2D) = "white" {}
                [IntRange] _ImageLayer22 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor22 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition22 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation22 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale22 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot22 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook22 ("Flipbook", Float) = 0
                    _ImageFlipbookCols22 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows22 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed22 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook22 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey22 ("Chroma Key", Float) = 0
                    _ImageChromaKey22 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold22 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering22 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey22 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting22 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel22 ("Image 22", Int) = 0

            [HideInInspector][Toggle] _ImageUse23 ("", Float) = 0
            [HideInInspector] m_start_image_setting23 (" --{reference_property:_ImageUse23}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace23 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex23 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI23 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture23 ("Image--{reference_properties:[_ApplyTexturesI23]}", 2D) = "white" {}
                [IntRange] _ImageLayer23 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor23 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition23 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation23 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale23 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot23 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook23 ("Flipbook", Float) = 0
                    _ImageFlipbookCols23 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows23 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed23 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook23 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey23 ("Chroma Key", Float) = 0
                    _ImageChromaKey23 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold23 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering23 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey23 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting23 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel23 ("Image 23", Int) = 0

            [HideInInspector][Toggle] _ImageUse24 ("", Float) = 0
            [HideInInspector] m_start_image_setting24 (" --{reference_property:_ImageUse24}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace24 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex24 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI24 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture24 ("Image--{reference_properties:[_ApplyTexturesI24]}", 2D) = "white" {}
                [IntRange] _ImageLayer24 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor24 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition24 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation24 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale24 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot24 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook24 ("Flipbook", Float) = 0
                    _ImageFlipbookCols24 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows24 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed24 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook24 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey24 ("Chroma Key", Float) = 0
                    _ImageChromaKey24 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold24 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering24 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey24 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting24 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel24 ("Image 24", Int) = 0

            [HideInInspector][Toggle] _ImageUse25 ("", Float) = 0
            [HideInInspector] m_start_image_setting25 (" --{reference_property:_ImageUse25}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace25 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex25 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI25 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture25 ("Image--{reference_properties:[_ApplyTexturesI25]}", 2D) = "white" {}
                [IntRange] _ImageLayer25 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor25 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition25 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation25 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale25 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot25 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook25 ("Flipbook", Float) = 0
                    _ImageFlipbookCols25 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows25 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed25 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook25 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey25 ("Chroma Key", Float) = 0
                    _ImageChromaKey25 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold25 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering25 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey25 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting25 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel25 ("Image 25", Int) = 0

            [HideInInspector][Toggle] _ImageUse26 ("", Float) = 0
            [HideInInspector] m_start_image_setting26 (" --{reference_property:_ImageUse26}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace26 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex26 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI26 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture26 ("Image--{reference_properties:[_ApplyTexturesI26]}", 2D) = "white" {}
                [IntRange] _ImageLayer26 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor26 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition26 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation26 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale26 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot26 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook26 ("Flipbook", Float) = 0
                    _ImageFlipbookCols26 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows26 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed26 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook26 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey26 ("Chroma Key", Float) = 0
                    _ImageChromaKey26 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold26 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering26 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey26 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting26 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel26 ("Image 26", Int) = 0

            [HideInInspector][Toggle] _ImageUse27 ("", Float) = 0
            [HideInInspector] m_start_image_setting27 (" --{reference_property:_ImageUse27}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace27 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex27 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI27 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture27 ("Image--{reference_properties:[_ApplyTexturesI27]}", 2D) = "white" {}
                [IntRange] _ImageLayer27 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor27 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition27 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation27 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale27 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot27 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook27 ("Flipbook", Float) = 0
                    _ImageFlipbookCols27 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows27 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed27 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook27 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey27 ("Chroma Key", Float) = 0
                    _ImageChromaKey27 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold27 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering27 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey27 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting27 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel27 ("Image 27", Int) = 0

            [HideInInspector][Toggle] _ImageUse28 ("", Float) = 0
            [HideInInspector] m_start_image_setting28 (" --{reference_property:_ImageUse28}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace28 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex28 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI28 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture28 ("Image--{reference_properties:[_ApplyTexturesI28]}", 2D) = "white" {}
                [IntRange] _ImageLayer28 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor28 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition28 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation28 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale28 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot28 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook28 ("Flipbook", Float) = 0
                    _ImageFlipbookCols28 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows28 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed28 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook28 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey28 ("Chroma Key", Float) = 0
                    _ImageChromaKey28 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold28 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering28 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey28 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting28 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel28 ("Image 28", Int) = 0

            [HideInInspector][Toggle] _ImageUse29 ("", Float) = 0
            [HideInInspector] m_start_image_setting29 (" --{reference_property:_ImageUse29}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace29 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex29 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI29 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture29 ("Image--{reference_properties:[_ApplyTexturesI29]}", 2D) = "white" {}
                [IntRange] _ImageLayer29 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor29 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition29 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation29 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale29 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot29 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook29 ("Flipbook", Float) = 0
                    _ImageFlipbookCols29 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows29 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed29 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook29 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey29 ("Chroma Key", Float) = 0
                    _ImageChromaKey29 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold29 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering29 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey29 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting29 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel29 ("Image 29", Int) = 0

            [HideInInspector][Toggle] _ImageUse30 ("", Float) = 0
            [HideInInspector] m_start_image_setting30 (" --{reference_property:_ImageUse30}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace30 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex30 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI30 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture30 ("Image--{reference_properties:[_ApplyTexturesI30]}", 2D) = "white" {}
                [IntRange] _ImageLayer30 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor30 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition30 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation30 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale30 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot30 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook30 ("Flipbook", Float) = 0
                    _ImageFlipbookCols30 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows30 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed30 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook30 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey30 ("Chroma Key", Float) = 0
                    _ImageChromaKey30 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold30 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering30 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey30 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting30 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel30 ("Image 30", Int) = 0

            [HideInInspector][Toggle] _ImageUse31 ("", Float) = 0
            [HideInInspector] m_start_image_setting31 (" --{reference_property:_ImageUse31}", Float) = 0
                [Enum(Screen, 0, World, 1)] _ImageWorldSpace31 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _ImageRootIndex31 ("Root", Int) = 0
                [HideInInspector][Apply(1.03)] _ApplyTexturesI31 ("", Int) = 0
                [StylizedLargeTexture] _ImageTexture31 ("Image--{reference_properties:[_ApplyTexturesI31]}", 2D) = "white" {}
                [IntRange] _ImageLayer31 ("Layer", Range(0, 31)) = 0
                [HDR] _ImageColor31 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _ImagePosition31 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _ImageRotation31 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _ImageScale31 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _ImagePivot31 ("Pivot", Vector) = (0, 0, 0, 0)
                [HideInInspector] m_start_flipbook31 ("Flipbook", Float) = 0
                    _ImageFlipbookCols31 ("Columns", Range(1, 16)) = 1
                    _ImageFlipbookRows31 ("Rows", Range(1, 16)) = 1
                    _ImageFlipbookSpeed31 ("Speed (FPS)", Range(0, 60)) = 0
                [HideInInspector] m_end_flipbook31 ("Flipbook", Float) = 0
                [HideInInspector] m_start_chromakey31 ("Chroma Key", Float) = 0
                    _ImageChromaKey31 ("Key Color", Color) = (0, 1, 0, 1)
                    _ImageChromaThreshold31 ("Threshold", Range(0, 1)) = 0
                    _ImageChromaFeathering31 ("Feathering", Range(0, 1)) = 0
                [HideInInspector] m_end_chromakey31 ("Chroma Key", Float) = 0
            [HideInInspector] m_end_image_setting31 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel31 ("Image 31", Int) = 0

        [HideInInspector] m_end_image_setting ("Image Settings", Float) = 0
        
        [HideInInspector] m_start_text_setting ("<b><i><color=#008080>T</color><color=#138989>e</color><color=#279393>x</color><color=#3A9D9D>t</color> <color=#62B0B0>S</color><color=#75BABA>e</color><color=#89C4C4>t</color><color=#9CCECE>t</color><color=#B0D7D7>i</color><color=#C4E1E1>n</color><color=#D7EBEB>g</color><color=#EBF5F5>s</color></i></b>", Float) = 0
            [Fonts] _Fonts ("Fonts", Int) = 0
            [HideInInspector][Toggle] _Use0 ("", Float) = 1
            //ifex _Use0==0
            [HideInInspector] m_start_text_setting0 (" --{reference_property:_Use0}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace0 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex0 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode0 ("Mode", Int) = 0
                [Content] _TextInput0 ("Text", Int) = 0
                [HideInInspector] _FontIndex0 ("Font", Int) = 0
                [IntRange] _Layer0 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor0 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position0 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation0 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale0 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot0 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator0 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter0 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType0 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode0 ("Direction --{condition_showS:(_TypewriterType0==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering0 ("Centering", Int) = 0
                        _TypewriterCenterSmooth0 ("Center Smooth --{condition_showS:(_TypewriterCentering0==1)}", Range(0, 1)) = 1
                        _BlockVisible0 ("Visible Count --{condition_showS:(_TypewriterType0==1)}", Int) = 0
                        _BlockAnimating0 ("Animating Count --{condition_showS:(_TypewriterType0==1)}", Int) = 0
                        _TypewriterProgress0 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth0 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay0 ("Char Delay --{condition_showS:(_TypewriterType0==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection0 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation0 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale0 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter0 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing0 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor0 ("Anchor", Int) = 0
                       _Spacing0 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing0 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator0 ("Animator", Float) = 0

                [HideInInspector] m_start_effect0 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path0 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX0 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX0_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX0_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY0 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY0_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY0_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ0 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ0_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ0_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX0_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX0_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY0_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY0_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ0_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ0_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity0 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset0 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed0 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation0 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter0 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path0 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake0 ("Shake", Float) = 0
                        _ShakeAmplitude0 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency0 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend0 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake0 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline0 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode0 ("Mode", Int) = 0
                        _OutlineWidth0 ("Width", Range(0, 1)) = 0
                        _OutlineRound0 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor0 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline0 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow0 ("Drop Shadow", Float) = 0
                        _ShadowIntensity0 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness0 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType0 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples0 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset0 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor0 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow0 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap0 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures0 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex0 ("Texture--{reference_properties:[_ApplyTextures0]}", 2D) = "white" {}
                        _MatCapIntensity0 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel0 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend0 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap0 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture0 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT0 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex0 ("Texture--{reference_properties:[_ApplyTexturesT0]}", 2D) = "white" {}
                        _TextureIntensity0 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode0 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture0 ("Texture", Float) = 0

                [HideInInspector] m_end_effect0 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting0 ("", Float) = 0
            [DynamicThryLabel] _TextLabel0 ("TextLabel0", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use1 ("", Float) = 0
            //ifex _Use1==0
            [HideInInspector] m_start_text_setting1 (" --{reference_property:_Use1}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace1 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex1 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode1 ("Mode", Int) = 0
                [Content] _TextInput1 ("Text", Int) = 0
                [HideInInspector] _FontIndex1 ("Font", Int) = 0
                [IntRange] _Layer1 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor1 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position1 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation1 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale1 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot1 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator1 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter1 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType1 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode1 ("Direction --{condition_showS:(_TypewriterType1==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering1 ("Centering", Int) = 0
                        _TypewriterCenterSmooth1 ("Center Smooth --{condition_showS:(_TypewriterCentering1==1)}", Range(0, 1)) = 1
                        _BlockVisible1 ("Visible Count --{condition_showS:(_TypewriterType1==1)}", Int) = 0
                        _BlockAnimating1 ("Animating Count --{condition_showS:(_TypewriterType1==1)}", Int) = 0
                        _TypewriterProgress1 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth1 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay1 ("Char Delay --{condition_showS:(_TypewriterType1==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection1 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation1 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale1 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter1 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing1 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor1 ("Anchor", Int) = 0
                       _Spacing1 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing1 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator1 ("Animator", Float) = 0

                [HideInInspector] m_start_effect1 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path1 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX1 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX1_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX1_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY1 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY1_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY1_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ1 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ1_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ1_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX1_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX1_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY1_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY1_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ1_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ1_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity1 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset1 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed1 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation1 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter1 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path1 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake1 ("Shake", Float) = 0
                        _ShakeAmplitude1 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency1 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend1 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake1 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline1 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode1 ("Mode", Int) = 0
                        _OutlineWidth1 ("Width", Range(0, 1)) = 0
                        _OutlineRound1 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor1 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline1 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow1 ("Drop Shadow", Float) = 0
                        _ShadowIntensity1 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness1 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType1 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples1 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset1 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor1 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow1 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap1 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures1 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex1 ("Texture--{reference_properties:[_ApplyTextures1]}", 2D) = "white" {}
                        _MatCapIntensity1 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel1 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend1 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap1 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture1 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT1 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex1 ("Texture--{reference_properties:[_ApplyTexturesT1]}", 2D) = "white" {}
                        _TextureIntensity1 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode1 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture1 ("Texture", Float) = 0

                [HideInInspector] m_end_effect1 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting1 ("", Float) = 0
            [DynamicThryLabel] _TextLabel1 ("TextLabel1", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use2 ("", Float) = 0
            //ifex _Use2==0
            [HideInInspector] m_start_text_setting2 (" --{reference_property:_Use2}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace2 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex2 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode2 ("Mode", Int) = 0
                [Content] _TextInput2 ("Text", Int) = 0
                [HideInInspector] _FontIndex2 ("Font", Int) = 0
                [IntRange] _Layer2 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor2 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position2 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation2 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale2 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot2 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator2 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter2 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType2 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode2 ("Direction --{condition_showS:(_TypewriterType2==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering2 ("Centering", Int) = 0
                        _TypewriterCenterSmooth2 ("Center Smooth --{condition_showS:(_TypewriterCentering2==1)}", Range(0, 1)) = 1
                        _BlockVisible2 ("Visible Count --{condition_showS:(_TypewriterType2==1)}", Int) = 0
                        _BlockAnimating2 ("Animating Count --{condition_showS:(_TypewriterType2==1)}", Int) = 0
                        _TypewriterProgress2 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth2 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay2 ("Char Delay --{condition_showS:(_TypewriterType2==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection2 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation2 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale2 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter2 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing2 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor2 ("Anchor", Int) = 0
                       _Spacing2 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing2 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator2 ("Animator", Float) = 0

                [HideInInspector] m_start_effect2 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path2 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX2 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX2_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX2_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY2 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY2_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY2_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ2 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ2_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ2_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX2_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX2_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY2_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY2_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ2_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ2_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity2 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset2 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed2 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation2 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter2 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path2 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake2 ("Shake", Float) = 0
                        _ShakeAmplitude2 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency2 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend2 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake2 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline2 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode2 ("Mode", Int) = 0
                        _OutlineWidth2 ("Width", Range(0, 1)) = 0
                        _OutlineRound2 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor2 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline2 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow2 ("Drop Shadow", Float) = 0
                        _ShadowIntensity2 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness2 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType2 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples2 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset2 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor2 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow2 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap2 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures2 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex2 ("Texture--{reference_properties:[_ApplyTextures2]}", 2D) = "white" {}
                        _MatCapIntensity2 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel2 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend2 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap2 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture2 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT2 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex2 ("Texture--{reference_properties:[_ApplyTexturesT2]}", 2D) = "white" {}
                        _TextureIntensity2 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode2 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture2 ("Texture", Float) = 0

                [HideInInspector] m_end_effect2 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting2 ("", Float) = 0
            [DynamicThryLabel] _TextLabel2 ("TextLabel2", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use3 ("", Float) = 0
            //ifex _Use3==0
            [HideInInspector] m_start_text_setting3 (" --{reference_property:_Use3}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace3 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex3 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode3 ("Mode", Int) = 0
                [Content] _TextInput3 ("Text", Int) = 0
                [HideInInspector] _FontIndex3 ("Font", Int) = 0
                [IntRange] _Layer3 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor3 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position3 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation3 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale3 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot3 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator3 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter3 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType3 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode3 ("Direction --{condition_showS:(_TypewriterType3==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering3 ("Centering", Int) = 0
                        _TypewriterCenterSmooth3 ("Center Smooth --{condition_showS:(_TypewriterCentering3==1)}", Range(0, 1)) = 1
                        _BlockVisible3 ("Visible Count --{condition_showS:(_TypewriterType3==1)}", Int) = 0
                        _BlockAnimating3 ("Animating Count --{condition_showS:(_TypewriterType3==1)}", Int) = 0
                        _TypewriterProgress3 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth3 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay3 ("Char Delay --{condition_showS:(_TypewriterType3==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection3 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation3 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale3 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter3 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing3 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor3 ("Anchor", Int) = 0
                       _Spacing3 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing3 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator3 ("Animator", Float) = 0

                [HideInInspector] m_start_effect3 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path3 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX3 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX3_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX3_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY3 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY3_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY3_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ3 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ3_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ3_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX3_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX3_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY3_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY3_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ3_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ3_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity3 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset3 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed3 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation3 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter3 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path3 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake3 ("Shake", Float) = 0
                        _ShakeAmplitude3 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency3 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend3 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake3 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline3 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode3 ("Mode", Int) = 0
                        _OutlineWidth3 ("Width", Range(0, 1)) = 0
                        _OutlineRound3 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor3 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline3 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow3 ("Drop Shadow", Float) = 0
                        _ShadowIntensity3 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness3 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType3 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples3 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset3 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor3 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow3 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap3 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures3 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex3 ("Texture--{reference_properties:[_ApplyTextures3]}", 2D) = "white" {}
                        _MatCapIntensity3 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel3 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend3 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap3 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture3 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT3 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex3 ("Texture--{reference_properties:[_ApplyTexturesT3]}", 2D) = "white" {}
                        _TextureIntensity3 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode3 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture3 ("Texture", Float) = 0

                [HideInInspector] m_end_effect3 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting3 ("", Float) = 0
            [DynamicThryLabel] _TextLabel3 ("TextLabel3", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use4 ("", Float) = 0
            //ifex _Use4==0
            [HideInInspector] m_start_text_setting4 (" --{reference_property:_Use4}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace4 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex4 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode4 ("Mode", Int) = 0
                [Content] _TextInput4 ("Text", Int) = 0
                [HideInInspector] _FontIndex4 ("Font", Int) = 0
                [IntRange] _Layer4 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor4 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position4 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation4 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale4 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot4 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator4 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter4 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType4 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode4 ("Direction --{condition_showS:(_TypewriterType4==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering4 ("Centering", Int) = 0
                        _TypewriterCenterSmooth4 ("Center Smooth --{condition_showS:(_TypewriterCentering4==1)}", Range(0, 1)) = 1
                        _BlockVisible4 ("Visible Count --{condition_showS:(_TypewriterType4==1)}", Int) = 0
                        _BlockAnimating4 ("Animating Count --{condition_showS:(_TypewriterType4==1)}", Int) = 0
                        _TypewriterProgress4 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth4 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay4 ("Char Delay --{condition_showS:(_TypewriterType4==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection4 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation4 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale4 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter4 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing4 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor4 ("Anchor", Int) = 0
                       _Spacing4 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing4 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator4 ("Animator", Float) = 0

                [HideInInspector] m_start_effect4 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path4 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX4 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX4_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX4_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY4 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY4_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY4_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ4 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ4_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ4_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX4_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX4_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY4_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY4_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ4_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ4_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity4 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset4 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed4 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation4 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter4 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path4 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake4 ("Shake", Float) = 0
                        _ShakeAmplitude4 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency4 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend4 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake4 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline4 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode4 ("Mode", Int) = 0
                        _OutlineWidth4 ("Width", Range(0, 1)) = 0
                        _OutlineRound4 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor4 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline4 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow4 ("Drop Shadow", Float) = 0
                        _ShadowIntensity4 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness4 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType4 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples4 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset4 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor4 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow4 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap4 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures4 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex4 ("Texture--{reference_properties:[_ApplyTextures4]}", 2D) = "white" {}
                        _MatCapIntensity4 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel4 ("Bevel", Range(0., 1)) = 0
                        _MatCapBlend4 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap4 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture4 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT4 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex4 ("Texture--{reference_properties:[_ApplyTexturesT4]}", 2D) = "white" {}
                        _TextureIntensity4 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode4 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture4 ("Texture", Float) = 0

                [HideInInspector] m_end_effect4 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting4 ("", Float) = 0
            [DynamicThryLabel] _TextLabel4 ("TextLabel4", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use5 ("", Float) = 0
            //ifex _Use5==0
            [HideInInspector] m_start_text_setting5 (" --{reference_property:_Use5}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace5 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex5 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode5 ("Mode", Int) = 0
                [Content] _TextInput5 ("Text", Int) = 0
                [HideInInspector] _FontIndex5 ("Font", Int) = 0
                [IntRange] _Layer5 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor5 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position5 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation5 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale5 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot5 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator5 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter5 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType5 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode5 ("Direction --{condition_showS:(_TypewriterType5==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering5 ("Centering", Int) = 0
                        _TypewriterCenterSmooth5 ("Center Smooth --{condition_showS:(_TypewriterCentering5==1)}", Range(0, 1)) = 1
                        _BlockVisible5 ("Visible Count --{condition_showS:(_TypewriterType5==1)}", Int) = 0
                        _BlockAnimating5 ("Animating Count --{condition_showS:(_TypewriterType5==1)}", Int) = 0
                        _TypewriterProgress5 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth5 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay5 ("Char Delay --{condition_showS:(_TypewriterType5==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection5 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation5 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale5 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter5 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing5 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor5 ("Anchor", Int) = 0
                       _Spacing5 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing5 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator5 ("Animator", Float) = 0

                [HideInInspector] m_start_effect5 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path5 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX5 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX5_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX5_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY5 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY5_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY5_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ5 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ5_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ5_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX5_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX5_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY5_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY5_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ5_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ5_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity5 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset5 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed5 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation5 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter5 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path5 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake5 ("Shake", Float) = 0
                        _ShakeAmplitude5 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency5 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend5 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake5 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline5 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode5 ("Mode", Int) = 0
                        _OutlineWidth5 ("Width", Range(0, 1)) = 0
                        _OutlineRound5 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor5 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline5 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow5 ("Drop Shadow", Float) = 0
                        _ShadowIntensity5 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness5 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType5 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples5 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset5 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor5 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow5 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap5 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures5 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex5 ("Texture--{reference_properties:[_ApplyTextures5]}", 2D) = "white" {}
                        _MatCapIntensity5 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel5 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend5 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap5 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture5 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT5 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex5 ("Texture--{reference_properties:[_ApplyTexturesT5]}", 2D) = "white" {}
                        _TextureIntensity5 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode5 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture5 ("Texture", Float) = 0

                [HideInInspector] m_end_effect5 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting5 ("", Float) = 0
            [DynamicThryLabel] _TextLabel5 ("TextLabel5", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use6 ("", Float) = 0
            //ifex _Use6==0
            [HideInInspector] m_start_text_setting6 (" --{reference_property:_Use6}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace6 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex6 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode6 ("Mode", Int) = 0
                [Content] _TextInput6 ("Text", Int) = 0
                [HideInInspector] _FontIndex6 ("Font", Int) = 0
                [IntRange] _Layer6 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor6 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position6 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation6 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale6 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot6 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator6 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter6 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType6 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode6 ("Direction --{condition_showS:(_TypewriterType6==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering6 ("Centering", Int) = 0
                        _TypewriterCenterSmooth6 ("Center Smooth --{condition_showS:(_TypewriterCentering6==1)}", Range(0, 1)) = 1
                        _BlockVisible6 ("Visible Count --{condition_showS:(_TypewriterType6==1)}", Int) = 0
                        _BlockAnimating6 ("Animating Count --{condition_showS:(_TypewriterType6==1)}", Int) = 0
                        _TypewriterProgress6 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth6 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay6 ("Char Delay --{condition_showS:(_TypewriterType6==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection6 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation6 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale6 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter6 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing6 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor6 ("Anchor", Int) = 0
                       _Spacing6 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing6 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator6 ("Animator", Float) = 0

                [HideInInspector] m_start_effect6 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path6 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX6 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX6_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX6_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY6 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY6_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY6_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ6 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ6_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ6_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX6_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX6_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY6_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY6_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ6_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ6_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity6 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset6 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed6 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation6 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter6 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path6 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake6 ("Shake", Float) = 0
                        _ShakeAmplitude6 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency6 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend6 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake6 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline6 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode6 ("Mode", Int) = 0
                        _OutlineWidth6 ("Width", Range(0, 1)) = 0
                        _OutlineRound6 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor6 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline6 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow6 ("Drop Shadow", Float) = 0
                        _ShadowIntensity6 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness6 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType6 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples6 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset6 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor6 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow6 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap6 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures6 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex6 ("Texture--{reference_properties:[_ApplyTextures6]}", 2D) = "white" {}
                        _MatCapIntensity6 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel6 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend6 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap6 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture6 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT6 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex6 ("Texture--{reference_properties:[_ApplyTexturesT6]}", 2D) = "white" {}
                        _TextureIntensity6 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode6 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture6 ("Texture", Float) = 0

                [HideInInspector] m_end_effect6 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting6 ("", Float) = 0
            [DynamicThryLabel] _TextLabel6 ("TextLabel6", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use7 ("", Float) = 0
            //ifex _Use7==0
            [HideInInspector] m_start_text_setting7 (" --{reference_property:_Use7}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace7 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex7 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode7 ("Mode", Int) = 0
                [Content] _TextInput7 ("Text", Int) = 0
                [HideInInspector] _FontIndex7 ("Font", Int) = 0
                [IntRange] _Layer7 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor7 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position7 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation7 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale7 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot7 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator7 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter7 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType7 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode7 ("Direction --{condition_showS:(_TypewriterType7==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering7 ("Centering", Int) = 0
                        _TypewriterCenterSmooth7 ("Center Smooth --{condition_showS:(_TypewriterCentering7==1)}", Range(0, 1)) = 1
                        _BlockVisible7 ("Visible Count --{condition_showS:(_TypewriterType7==1)}", Int) = 0
                        _BlockAnimating7 ("Animating Count --{condition_showS:(_TypewriterType7==1)}", Int) = 0
                        _TypewriterProgress7 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth7 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay7 ("Char Delay --{condition_showS:(_TypewriterType7==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection7 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation7 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale7 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter7 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing7 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor7 ("Anchor", Int) = 0
                       _Spacing7 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing7 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator7 ("Animator", Float) = 0

                [HideInInspector] m_start_effect7 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path7 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX7 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX7_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX7_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY7 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY7_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY7_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ7 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ7_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ7_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX7_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX7_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY7_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY7_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ7_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ7_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity7 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset7 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed7 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation7 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter7 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path7 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake7 ("Shake", Float) = 0
                        _ShakeAmplitude7 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency7 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend7 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake7 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline7 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode7 ("Mode", Int) = 0
                        _OutlineWidth7 ("Width", Range(0, 1)) = 0
                        _OutlineRound7 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor7 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline7 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow7 ("Drop Shadow", Float) = 0
                        _ShadowIntensity7 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness7 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType7 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples7 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset7 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor7 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow7 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap7 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures7 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex7 ("Texture--{reference_properties:[_ApplyTextures7]}", 2D) = "white" {}
                        _MatCapIntensity7 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel7 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend7 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap7 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture7 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT7 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex7 ("Texture--{reference_properties:[_ApplyTexturesT7]}", 2D) = "white" {}
                        _TextureIntensity7 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode7 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture7 ("Texture", Float) = 0

                [HideInInspector] m_end_effect7 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting7 ("", Float) = 0
            [DynamicThryLabel] _TextLabel7 ("TextLabel7", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use8 ("", Float) = 0
            //ifex _Use8==0
            [HideInInspector] m_start_text_setting8 (" --{reference_property:_Use8}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace8 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex8 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode8 ("Mode", Int) = 0
                [Content] _TextInput8 ("Text", Int) = 0
                [HideInInspector] _FontIndex8 ("Font", Int) = 0
                [IntRange] _Layer8 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor8 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position8 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation8 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale8 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot8 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator8 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter8 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType8 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode8 ("Direction --{condition_showS:(_TypewriterType8==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering8 ("Centering", Int) = 0
                        _TypewriterCenterSmooth8 ("Center Smooth --{condition_showS:(_TypewriterCentering8==1)}", Range(0, 1)) = 1
                        _BlockVisible8 ("Visible Count --{condition_showS:(_TypewriterType8==1)}", Int) = 0
                        _BlockAnimating8 ("Animating Count --{condition_showS:(_TypewriterType8==1)}", Int) = 0
                        _TypewriterProgress8 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth8 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay8 ("Char Delay --{condition_showS:(_TypewriterType8==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection8 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation8 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale8 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter8 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing8 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor8 ("Anchor", Int) = 0
                       _Spacing8 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing8 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator8 ("Animator", Float) = 0

                [HideInInspector] m_start_effect8 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path8 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX8 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX8_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX8_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY8 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY8_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY8_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ8 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ8_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ8_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX8_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX8_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY8_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY8_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ8_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ8_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity8 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset8 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed8 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation8 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter8 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path8 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake8 ("Shake", Float) = 0
                        _ShakeAmplitude8 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency8 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend8 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake8 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline8 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode8 ("Mode", Int) = 0
                        _OutlineWidth8 ("Width", Range(0, 1)) = 0
                        _OutlineRound8 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor8 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline8 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow8 ("Drop Shadow", Float) = 0
                        _ShadowIntensity8 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness8 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType8 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples8 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset8 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor8 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow8 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap8 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures8 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex8 ("Texture--{reference_properties:[_ApplyTextures8]}", 2D) = "white" {}
                        _MatCapIntensity8 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel8 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend8 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap8 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture8 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT8 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex8 ("Texture--{reference_properties:[_ApplyTexturesT8]}", 2D) = "white" {}
                        _TextureIntensity8 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode8 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture8 ("Texture", Float) = 0

                [HideInInspector] m_end_effect8 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting8 ("", Float) = 0
            [DynamicThryLabel] _TextLabel8 ("TextLabel8", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use9 ("", Float) = 0
            //ifex _Use9==0
            [HideInInspector] m_start_text_setting9 (" --{reference_property:_Use9}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace9 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex9 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode9 ("Mode", Int) = 0
                [Content] _TextInput9 ("Text", Int) = 0
                [HideInInspector] _FontIndex9 ("Font", Int) = 0
                [IntRange] _Layer9 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor9 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position9 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation9 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale9 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot9 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator9 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter9 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType9 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode9 ("Direction --{condition_showS:(_TypewriterType9==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering9 ("Centering", Int) = 0
                        _TypewriterCenterSmooth9 ("Center Smooth --{condition_showS:(_TypewriterCentering9==1)}", Range(0, 1)) = 1
                        _BlockVisible9 ("Visible Count --{condition_showS:(_TypewriterType9==1)}", Int) = 0
                        _BlockAnimating9 ("Animating Count --{condition_showS:(_TypewriterType9==1)}", Int) = 0
                        _TypewriterProgress9 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth9 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay9 ("Char Delay --{condition_showS:(_TypewriterType9==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection9 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation9 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale9 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter9 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing9 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor9 ("Anchor", Int) = 0
                       _Spacing9 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing9 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator9 ("Animator", Float) = 0

                [HideInInspector] m_start_effect9 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path9 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX9 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX9_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX9_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY9 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY9_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY9_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ9 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ9_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ9_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX9_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX9_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY9_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY9_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ9_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ9_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity9 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset9 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed9 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation9 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter9 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path9 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake9 ("Shake", Float) = 0
                        _ShakeAmplitude9 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency9 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend9 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake9 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline9 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode9 ("Mode", Int) = 0
                        _OutlineWidth9 ("Width", Range(0, 1)) = 0
                        _OutlineRound9 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor9 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline9 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow9 ("Drop Shadow", Float) = 0
                        _ShadowIntensity9 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness9 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType9 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples9 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset9 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor9 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow9 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap9 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures9 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex9 ("Texture--{reference_properties:[_ApplyTextures9]}", 2D) = "white" {}
                        _MatCapIntensity9 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel9 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend9 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap9 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture9 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT9 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex9 ("Texture--{reference_properties:[_ApplyTexturesT9]}", 2D) = "white" {}
                        _TextureIntensity9 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode9 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture9 ("Texture", Float) = 0

                [HideInInspector] m_end_effect9 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting9 ("", Float) = 0
            [DynamicThryLabel] _TextLabel9 ("TextLabel9", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use10 ("", Float) = 0
            //ifex _Use10==0
            [HideInInspector] m_start_text_setting10 (" --{reference_property:_Use10}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace10 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex10 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode10 ("Mode", Int) = 0
                [Content] _TextInput10 ("Text", Int) = 0
                [HideInInspector] _FontIndex10 ("Font", Int) = 0
                [IntRange] _Layer10 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor10 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position10 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation10 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale10 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot10 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator10 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter10 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType10 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode10 ("Direction --{condition_showS:(_TypewriterType10==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering10 ("Centering", Int) = 0
                        _TypewriterCenterSmooth10 ("Center Smooth --{condition_showS:(_TypewriterCentering10==1)}", Range(0, 1)) = 1
                        _BlockVisible10 ("Visible Count --{condition_showS:(_TypewriterType10==1)}", Int) = 0
                        _BlockAnimating10 ("Animating Count --{condition_showS:(_TypewriterType10==1)}", Int) = 0
                        _TypewriterProgress10 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth10 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay10 ("Char Delay --{condition_showS:(_TypewriterType10==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection10 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation10 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale10 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter10 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing10 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor10 ("Anchor", Int) = 0
                       _Spacing10 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing10 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator10 ("Animator", Float) = 0

                [HideInInspector] m_start_effect10 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path10 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX10 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX10_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX10_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY10 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY10_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY10_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ10 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ10_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ10_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX10_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX10_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY10_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY10_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ10_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ10_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity10 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset10 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed10 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation10 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter10 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path10 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake10 ("Shake", Float) = 0
                        _ShakeAmplitude10 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency10 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend10 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake10 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline10 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode10 ("Mode", Int) = 0
                        _OutlineWidth10 ("Width", Range(0, 1)) = 0
                        _OutlineRound10 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor10 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline10 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow10 ("Drop Shadow", Float) = 0
                        _ShadowIntensity10 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness10 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType10 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples10 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset10 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor10 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow10 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap10 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures10 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex10 ("Texture--{reference_properties:[_ApplyTextures10]}", 2D) = "white" {}
                        _MatCapIntensity10 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel10 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend10 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap10 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture10 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT10 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex10 ("Texture--{reference_properties:[_ApplyTexturesT10]}", 2D) = "white" {}
                        _TextureIntensity10 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode10 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture10 ("Texture", Float) = 0

                [HideInInspector] m_end_effect10 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting10 ("", Float) = 0
            [DynamicThryLabel] _TextLabel10 ("TextLabel10", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use11 ("", Float) = 0
            //ifex _Use11==0
            [HideInInspector] m_start_text_setting11 (" --{reference_property:_Use11}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace11 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex11 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode11 ("Mode", Int) = 0
                [Content] _TextInput11 ("Text", Int) = 0
                [HideInInspector] _FontIndex11 ("Font", Int) = 0
                [IntRange] _Layer11 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor11 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position11 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation11 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale11 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot11 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator11 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter11 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType11 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode11 ("Direction --{condition_showS:(_TypewriterType11==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering11 ("Centering", Int) = 0
                        _TypewriterCenterSmooth11 ("Center Smooth --{condition_showS:(_TypewriterCentering11==1)}", Range(0, 1)) = 1
                        _BlockVisible11 ("Visible Count --{condition_showS:(_TypewriterType11==1)}", Int) = 0
                        _BlockAnimating11 ("Animating Count --{condition_showS:(_TypewriterType11==1)}", Int) = 0
                        _TypewriterProgress11 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth11 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay11 ("Char Delay --{condition_showS:(_TypewriterType11==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection11 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation11 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale11 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter11 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing11 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor11 ("Anchor", Int) = 0
                       _Spacing11 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing11 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator11 ("Animator", Float) = 0

                [HideInInspector] m_start_effect11 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path11 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX11 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX11_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX11_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY11 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY11_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY11_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ11 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ11_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ11_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX11_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX11_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY11_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY11_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ11_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ11_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity11 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset11 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed11 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation11 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter11 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path11 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake11 ("Shake", Float) = 0
                        _ShakeAmplitude11 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency11 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend11 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake11 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline11 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode11 ("Mode", Int) = 0
                        _OutlineWidth11 ("Width", Range(0, 1)) = 0
                        _OutlineRound11 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor11 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline11 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow11 ("Drop Shadow", Float) = 0
                        _ShadowIntensity11 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness11 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType11 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples11 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset11 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor11 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow11 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap11 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures11 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex11 ("Texture--{reference_properties:[_ApplyTextures11]}", 2D) = "white" {}
                        _MatCapIntensity11 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel11 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend11 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap11 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture11 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT11 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex11 ("Texture--{reference_properties:[_ApplyTexturesT11]}", 2D) = "white" {}
                        _TextureIntensity11 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode11 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture11 ("Texture", Float) = 0

                [HideInInspector] m_end_effect11 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting11 ("", Float) = 0
            [DynamicThryLabel] _TextLabel11 ("TextLabel11", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use12 ("", Float) = 0
            //ifex _Use12==0
            [HideInInspector] m_start_text_setting12 (" --{reference_property:_Use12}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace12 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex12 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode12 ("Mode", Int) = 0
                [Content] _TextInput12 ("Text", Int) = 0
                [HideInInspector] _FontIndex12 ("Font", Int) = 0
                [IntRange] _Layer12 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor12 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position12 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation12 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale12 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot12 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator12 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter12 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType12 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode12 ("Direction --{condition_showS:(_TypewriterType12==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering12 ("Centering", Int) = 0
                        _TypewriterCenterSmooth12 ("Center Smooth --{condition_showS:(_TypewriterCentering12==1)}", Range(0, 1)) = 1
                        _BlockVisible12 ("Visible Count --{condition_showS:(_TypewriterType12==1)}", Int) = 0
                        _BlockAnimating12 ("Animating Count --{condition_showS:(_TypewriterType12==1)}", Int) = 0
                        _TypewriterProgress12 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth12 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay12 ("Char Delay --{condition_showS:(_TypewriterType12==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection12 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation12 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale12 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter12 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing12 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor12 ("Anchor", Int) = 0
                       _Spacing12 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing12 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator12 ("Animator", Float) = 0

                [HideInInspector] m_start_effect12 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path12 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX12 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX12_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX12_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY12 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY12_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY12_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ12 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ12_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ12_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX12_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX12_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY12_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY12_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ12_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ12_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity12 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset12 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed12 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation12 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter12 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path12 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake12 ("Shake", Float) = 0
                        _ShakeAmplitude12 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency12 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend12 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake12 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline12 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode12 ("Mode", Int) = 0
                        _OutlineWidth12 ("Width", Range(0, 1)) = 0
                        _OutlineRound12 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor12 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline12 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow12 ("Drop Shadow", Float) = 0
                        _ShadowIntensity12 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness12 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType12 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples12 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset12 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor12 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow12 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap12 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures12 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex12 ("Texture--{reference_properties:[_ApplyTextures12]}", 2D) = "white" {}
                        _MatCapIntensity12 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel12 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend12 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap12 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture12 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT12 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex12 ("Texture--{reference_properties:[_ApplyTexturesT12]}", 2D) = "white" {}
                        _TextureIntensity12 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode12 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture12 ("Texture", Float) = 0

                [HideInInspector] m_end_effect12 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting12 ("", Float) = 0
            [DynamicThryLabel] _TextLabel12 ("TextLabel12", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use13 ("", Float) = 0
            //ifex _Use13==0
            [HideInInspector] m_start_text_setting13 (" --{reference_property:_Use13}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace13 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex13 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode13 ("Mode", Int) = 0
                [Content] _TextInput13 ("Text", Int) = 0
                [HideInInspector] _FontIndex13 ("Font", Int) = 0
                [IntRange] _Layer13 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor13 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position13 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation13 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale13 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot13 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator13 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter13 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType13 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode13 ("Direction --{condition_showS:(_TypewriterType13==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering13 ("Centering", Int) = 0
                        _TypewriterCenterSmooth13 ("Center Smooth --{condition_showS:(_TypewriterCentering13==1)}", Range(0, 1)) = 1
                        _BlockVisible13 ("Visible Count --{condition_showS:(_TypewriterType13==1)}", Int) = 0
                        _BlockAnimating13 ("Animating Count --{condition_showS:(_TypewriterType13==1)}", Int) = 0
                        _TypewriterProgress13 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth13 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay13 ("Char Delay --{condition_showS:(_TypewriterType13==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection13 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation13 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale13 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter13 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing13 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor13 ("Anchor", Int) = 0
                       _Spacing13 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing13 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator13 ("Animator", Float) = 0

                [HideInInspector] m_start_effect13 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path13 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX13 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX13_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX13_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY13 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY13_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY13_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ13 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ13_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ13_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX13_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX13_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY13_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY13_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ13_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ13_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity13 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset13 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed13 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation13 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter13 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path13 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake13 ("Shake", Float) = 0
                        _ShakeAmplitude13 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency13 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend13 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake13 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline13 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode13 ("Mode", Int) = 0
                        _OutlineWidth13 ("Width", Range(0, 1)) = 0
                        _OutlineRound13 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor13 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline13 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow13 ("Drop Shadow", Float) = 0
                        _ShadowIntensity13 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness13 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType13 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples13 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset13 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor13 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow13 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap13 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures13 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex13 ("Texture--{reference_properties:[_ApplyTextures13]}", 2D) = "white" {}
                        _MatCapIntensity13 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel13 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend13 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap13 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture13 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT13 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex13 ("Texture--{reference_properties:[_ApplyTexturesT13]}", 2D) = "white" {}
                        _TextureIntensity13 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode13 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture13 ("Texture", Float) = 0

                [HideInInspector] m_end_effect13 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting13 ("", Float) = 0
            [DynamicThryLabel] _TextLabel13 ("TextLabel13", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use14 ("", Float) = 0
            //ifex _Use14==0
            [HideInInspector] m_start_text_setting14 (" --{reference_property:_Use14}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace14 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex14 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode14 ("Mode", Int) = 0
                [Content] _TextInput14 ("Text", Int) = 0
                [HideInInspector] _FontIndex14 ("Font", Int) = 0
                [IntRange] _Layer14 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor14 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position14 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation14 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale14 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot14 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator14 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter14 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType14 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode14 ("Direction --{condition_showS:(_TypewriterType14==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering14 ("Centering", Int) = 0
                        _TypewriterCenterSmooth14 ("Center Smooth --{condition_showS:(_TypewriterCentering14==1)}", Range(0, 1)) = 1
                        _BlockVisible14 ("Visible Count --{condition_showS:(_TypewriterType14==1)}", Int) = 0
                        _BlockAnimating14 ("Animating Count --{condition_showS:(_TypewriterType14==1)}", Int) = 0
                        _TypewriterProgress14 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth14 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay14 ("Char Delay --{condition_showS:(_TypewriterType14==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection14 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation14 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale14 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter14 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing14 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor14 ("Anchor", Int) = 0
                       _Spacing14 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing14 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator14 ("Animator", Float) = 0

                [HideInInspector] m_start_effect14 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path14 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX14 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX14_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX14_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY14 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY14_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY14_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ14 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ14_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ14_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX14_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX14_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY14_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY14_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ14_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ14_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity14 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset14 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed14 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation14 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter14 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path14 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake14 ("Shake", Float) = 0
                        _ShakeAmplitude14 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency14 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend14 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake14 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline14 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode14 ("Mode", Int) = 0
                        _OutlineWidth14 ("Width", Range(0, 1)) = 0
                        _OutlineRound14 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor14 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline14 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow14 ("Drop Shadow", Float) = 0
                        _ShadowIntensity14 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness14 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType14 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples14 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset14 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor14 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow14 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap14 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures14 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex14 ("Texture--{reference_properties:[_ApplyTextures14]}", 2D) = "white" {}
                        _MatCapIntensity14 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel14 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend14 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap14 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture14 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT14 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex14 ("Texture--{reference_properties:[_ApplyTexturesT14]}", 2D) = "white" {}
                        _TextureIntensity14 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode14 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture14 ("Texture", Float) = 0

                [HideInInspector] m_end_effect14 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting14 ("", Float) = 0
            [DynamicThryLabel] _TextLabel14 ("TextLabel14", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use15 ("", Float) = 0
            //ifex _Use15==0
            [HideInInspector] m_start_text_setting15 (" --{reference_property:_Use15}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace15 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex15 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode15 ("Mode", Int) = 0
                [Content] _TextInput15 ("Text", Int) = 0
                [HideInInspector] _FontIndex15 ("Font", Int) = 0
                [IntRange] _Layer15 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor15 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position15 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation15 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale15 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot15 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator15 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter15 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType15 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode15 ("Direction --{condition_showS:(_TypewriterType15==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering15 ("Centering", Int) = 0
                        _TypewriterCenterSmooth15 ("Center Smooth --{condition_showS:(_TypewriterCentering15==1)}", Range(0, 1)) = 1
                        _BlockVisible15 ("Visible Count --{condition_showS:(_TypewriterType15==1)}", Int) = 0
                        _BlockAnimating15 ("Animating Count --{condition_showS:(_TypewriterType15==1)}", Int) = 0
                        _TypewriterProgress15 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth15 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay15 ("Char Delay --{condition_showS:(_TypewriterType15==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection15 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation15 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale15 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter15 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing15 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor15 ("Anchor", Int) = 0
                       _Spacing15 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing15 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator15 ("Animator", Float) = 0

                [HideInInspector] m_start_effect15 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path15 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX15 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX15_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX15_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY15 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY15_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY15_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ15 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ15_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ15_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX15_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX15_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY15_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY15_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ15_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ15_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity15 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset15 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed15 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation15 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter15 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path15 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake15 ("Shake", Float) = 0
                        _ShakeAmplitude15 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency15 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend15 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake15 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline15 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode15 ("Mode", Int) = 0
                        _OutlineWidth15 ("Width", Range(0, 1)) = 0
                        _OutlineRound15 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor15 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline15 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow15 ("Drop Shadow", Float) = 0
                        _ShadowIntensity15 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness15 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType15 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples15 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset15 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor15 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow15 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap15 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures15 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex15 ("Texture--{reference_properties:[_ApplyTextures15]}", 2D) = "white" {}
                        _MatCapIntensity15 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel15 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend15 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap15 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture15 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT15 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex15 ("Texture--{reference_properties:[_ApplyTexturesT15]}", 2D) = "white" {}
                        _TextureIntensity15 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode15 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture15 ("Texture", Float) = 0

                [HideInInspector] m_end_effect15 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting15 ("", Float) = 0
            [DynamicThryLabel] _TextLabel15 ("TextLabel15", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use16 ("", Float) = 0
            //ifex _Use16==0
            [HideInInspector] m_start_text_setting16 (" --{reference_property:_Use16}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace16 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex16 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode16 ("Mode", Int) = 0
                [Content] _TextInput16 ("Text", Int) = 0
                [HideInInspector] _FontIndex16 ("Font", Int) = 0
                [IntRange] _Layer16 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor16 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position16 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation16 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale16 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot16 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator16 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter16 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType16 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode16 ("Direction --{condition_showS:(_TypewriterType16==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering16 ("Centering", Int) = 0
                        _TypewriterCenterSmooth16 ("Center Smooth --{condition_showS:(_TypewriterCentering16==1)}", Range(0, 1)) = 1
                        _BlockVisible16 ("Visible Count --{condition_showS:(_TypewriterType16==1)}", Int) = 0
                        _BlockAnimating16 ("Animating Count --{condition_showS:(_TypewriterType16==1)}", Int) = 0
                        _TypewriterProgress16 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth16 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay16 ("Char Delay --{condition_showS:(_TypewriterType16==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection16 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation16 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale16 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter16 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing16 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor16 ("Anchor", Int) = 0
                       _Spacing16 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing16 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator16 ("Animator", Float) = 0

                [HideInInspector] m_start_effect16 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path16 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX16 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX16_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX16_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY16 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY16_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY16_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ16 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ16_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ16_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX16_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX16_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY16_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY16_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ16_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ16_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity16 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset16 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed16 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation16 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter16 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path16 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake16 ("Shake", Float) = 0
                        _ShakeAmplitude16 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency16 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend16 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake16 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline16 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode16 ("Mode", Int) = 0
                        _OutlineWidth16 ("Width", Range(0, 1)) = 0
                        _OutlineRound16 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor16 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline16 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow16 ("Drop Shadow", Float) = 0
                        _ShadowIntensity16 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness16 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType16 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples16 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset16 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor16 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow16 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap16 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures16 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex16 ("Texture--{reference_properties:[_ApplyTextures16]}", 2D) = "white" {}
                        _MatCapIntensity16 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel16 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend16 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap16 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture16 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT16 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex16 ("Texture--{reference_properties:[_ApplyTexturesT16]}", 2D) = "white" {}
                        _TextureIntensity16 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode16 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture16 ("Texture", Float) = 0

                [HideInInspector] m_end_effect16 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting16 ("", Float) = 0
            [DynamicThryLabel] _TextLabel16 ("TextLabel16", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use17 ("", Float) = 0
            //ifex _Use17==0
            [HideInInspector] m_start_text_setting17 (" --{reference_property:_Use17}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace17 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex17 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode17 ("Mode", Int) = 0
                [Content] _TextInput17 ("Text", Int) = 0
                [HideInInspector] _FontIndex17 ("Font", Int) = 0
                [IntRange] _Layer17 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor17 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position17 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation17 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale17 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot17 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator17 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter17 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType17 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode17 ("Direction --{condition_showS:(_TypewriterType17==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering17 ("Centering", Int) = 0
                        _TypewriterCenterSmooth17 ("Center Smooth --{condition_showS:(_TypewriterCentering17==1)}", Range(0, 1)) = 1
                        _BlockVisible17 ("Visible Count --{condition_showS:(_TypewriterType17==1)}", Int) = 0
                        _BlockAnimating17 ("Animating Count --{condition_showS:(_TypewriterType17==1)}", Int) = 0
                        _TypewriterProgress17 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth17 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay17 ("Char Delay --{condition_showS:(_TypewriterType17==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection17 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation17 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale17 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter17 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing17 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor17 ("Anchor", Int) = 0
                       _Spacing17 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing17 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator17 ("Animator", Float) = 0

                [HideInInspector] m_start_effect17 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path17 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX17 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX17_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX17_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY17 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY17_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY17_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ17 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ17_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ17_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX17_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX17_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY17_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY17_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ17_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ17_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity17 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset17 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed17 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation17 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter17 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path17 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake17 ("Shake", Float) = 0
                        _ShakeAmplitude17 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency17 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend17 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake17 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline17 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode17 ("Mode", Int) = 0
                        _OutlineWidth17 ("Width", Range(0, 1)) = 0
                        _OutlineRound17 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor17 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline17 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow17 ("Drop Shadow", Float) = 0
                        _ShadowIntensity17 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness17 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType17 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples17 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset17 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor17 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow17 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap17 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures17 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex17 ("Texture--{reference_properties:[_ApplyTextures17]}", 2D) = "white" {}
                        _MatCapIntensity17 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel17 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend17 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap17 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture17 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT17 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex17 ("Texture--{reference_properties:[_ApplyTexturesT17]}", 2D) = "white" {}
                        _TextureIntensity17 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode17 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture17 ("Texture", Float) = 0

                [HideInInspector] m_end_effect17 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting17 ("", Float) = 0
            [DynamicThryLabel] _TextLabel17 ("TextLabel17", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use18 ("", Float) = 0
            //ifex _Use18==0
            [HideInInspector] m_start_text_setting18 (" --{reference_property:_Use18}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace18 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex18 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode18 ("Mode", Int) = 0
                [Content] _TextInput18 ("Text", Int) = 0
                [HideInInspector] _FontIndex18 ("Font", Int) = 0
                [IntRange] _Layer18 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor18 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position18 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation18 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale18 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot18 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator18 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter18 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType18 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode18 ("Direction --{condition_showS:(_TypewriterType18==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering18 ("Centering", Int) = 0
                        _TypewriterCenterSmooth18 ("Center Smooth --{condition_showS:(_TypewriterCentering18==1)}", Range(0, 1)) = 1
                        _BlockVisible18 ("Visible Count --{condition_showS:(_TypewriterType18==1)}", Int) = 0
                        _BlockAnimating18 ("Animating Count --{condition_showS:(_TypewriterType18==1)}", Int) = 0
                        _TypewriterProgress18 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth18 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay18 ("Char Delay --{condition_showS:(_TypewriterType18==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection18 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation18 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale18 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter18 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing18 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor18 ("Anchor", Int) = 0
                       _Spacing18 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing18 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator18 ("Animator", Float) = 0

                [HideInInspector] m_start_effect18 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path18 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX18 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX18_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX18_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY18 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY18_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY18_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ18 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ18_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ18_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX18_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX18_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY18_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY18_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ18_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ18_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity18 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset18 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed18 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation18 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter18 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path18 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake18 ("Shake", Float) = 0
                        _ShakeAmplitude18 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency18 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend18 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake18 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline18 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode18 ("Mode", Int) = 0
                        _OutlineWidth18 ("Width", Range(0, 1)) = 0
                        _OutlineRound18 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor18 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline18 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow18 ("Drop Shadow", Float) = 0
                        _ShadowIntensity18 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness18 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType18 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples18 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset18 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor18 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow18 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap18 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures18 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex18 ("Texture--{reference_properties:[_ApplyTextures18]}", 2D) = "white" {}
                        _MatCapIntensity18 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel18 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend18 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap18 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture18 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT18 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex18 ("Texture--{reference_properties:[_ApplyTexturesT18]}", 2D) = "white" {}
                        _TextureIntensity18 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode18 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture18 ("Texture", Float) = 0

                [HideInInspector] m_end_effect18 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting18 ("", Float) = 0
            [DynamicThryLabel] _TextLabel18 ("TextLabel18", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use19 ("", Float) = 0
            //ifex _Use19==0
            [HideInInspector] m_start_text_setting19 (" --{reference_property:_Use19}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace19 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex19 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode19 ("Mode", Int) = 0
                [Content] _TextInput19 ("Text", Int) = 0
                [HideInInspector] _FontIndex19 ("Font", Int) = 0
                [IntRange] _Layer19 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor19 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position19 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation19 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale19 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot19 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator19 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter19 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType19 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode19 ("Direction --{condition_showS:(_TypewriterType19==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering19 ("Centering", Int) = 0
                        _TypewriterCenterSmooth19 ("Center Smooth --{condition_showS:(_TypewriterCentering19==1)}", Range(0, 1)) = 1
                        _BlockVisible19 ("Visible Count --{condition_showS:(_TypewriterType19==1)}", Int) = 0
                        _BlockAnimating19 ("Animating Count --{condition_showS:(_TypewriterType19==1)}", Int) = 0
                        _TypewriterProgress19 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth19 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay19 ("Char Delay --{condition_showS:(_TypewriterType19==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection19 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation19 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale19 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter19 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing19 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor19 ("Anchor", Int) = 0
                       _Spacing19 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing19 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator19 ("Animator", Float) = 0

                [HideInInspector] m_start_effect19 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path19 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX19 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX19_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX19_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY19 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY19_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY19_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ19 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ19_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ19_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX19_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX19_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY19_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY19_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ19_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ19_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity19 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset19 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed19 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation19 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter19 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path19 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake19 ("Shake", Float) = 0
                        _ShakeAmplitude19 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency19 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend19 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake19 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline19 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode19 ("Mode", Int) = 0
                        _OutlineWidth19 ("Width", Range(0, 1)) = 0
                        _OutlineRound19 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor19 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline19 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow19 ("Drop Shadow", Float) = 0
                        _ShadowIntensity19 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness19 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType19 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples19 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset19 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor19 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow19 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap19 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures19 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex19 ("Texture--{reference_properties:[_ApplyTextures19]}", 2D) = "white" {}
                        _MatCapIntensity19 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel19 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend19 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap19 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture19 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT19 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex19 ("Texture--{reference_properties:[_ApplyTexturesT19]}", 2D) = "white" {}
                        _TextureIntensity19 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode19 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture19 ("Texture", Float) = 0

                [HideInInspector] m_end_effect19 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting19 ("", Float) = 0
            [DynamicThryLabel] _TextLabel19 ("TextLabel19", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use20 ("", Float) = 0
            //ifex _Use20==0
            [HideInInspector] m_start_text_setting20 (" --{reference_property:_Use20}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace20 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex20 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode20 ("Mode", Int) = 0
                [Content] _TextInput20 ("Text", Int) = 0
                [HideInInspector] _FontIndex20 ("Font", Int) = 0
                [IntRange] _Layer20 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor20 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position20 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation20 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale20 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot20 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator20 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter20 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType20 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode20 ("Direction --{condition_showS:(_TypewriterType20==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering20 ("Centering", Int) = 0
                        _TypewriterCenterSmooth20 ("Center Smooth --{condition_showS:(_TypewriterCentering20==1)}", Range(0, 1)) = 1
                        _BlockVisible20 ("Visible Count --{condition_showS:(_TypewriterType20==1)}", Int) = 0
                        _BlockAnimating20 ("Animating Count --{condition_showS:(_TypewriterType20==1)}", Int) = 0
                        _TypewriterProgress20 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth20 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay20 ("Char Delay --{condition_showS:(_TypewriterType20==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection20 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation20 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale20 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter20 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing20 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor20 ("Anchor", Int) = 0
                       _Spacing20 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing20 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator20 ("Animator", Float) = 0

                [HideInInspector] m_start_effect20 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path20 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX20 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX20_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX20_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY20 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY20_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY20_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ20 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ20_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ20_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX20_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX20_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY20_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY20_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ20_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ20_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity20 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset20 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed20 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation20 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter20 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path20 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake20 ("Shake", Float) = 0
                        _ShakeAmplitude20 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency20 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend20 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake20 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline20 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode20 ("Mode", Int) = 0
                        _OutlineWidth20 ("Width", Range(0, 1)) = 0
                        _OutlineRound20 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor20 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline20 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow20 ("Drop Shadow", Float) = 0
                        _ShadowIntensity20 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness20 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType20 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples20 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset20 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor20 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow20 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap20 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures20 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex20 ("Texture--{reference_properties:[_ApplyTextures20]}", 2D) = "white" {}
                        _MatCapIntensity20 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel20 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend20 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap20 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture20 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT20 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex20 ("Texture--{reference_properties:[_ApplyTexturesT20]}", 2D) = "white" {}
                        _TextureIntensity20 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode20 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture20 ("Texture", Float) = 0

                [HideInInspector] m_end_effect20 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting20 ("", Float) = 0
            [DynamicThryLabel] _TextLabel20 ("TextLabel20", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use21 ("", Float) = 0
            //ifex _Use21==0
            [HideInInspector] m_start_text_setting21 (" --{reference_property:_Use21}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace21 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex21 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode21 ("Mode", Int) = 0
                [Content] _TextInput21 ("Text", Int) = 0
                [HideInInspector] _FontIndex21 ("Font", Int) = 0
                [IntRange] _Layer21 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor21 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position21 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation21 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale21 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot21 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator21 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter21 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType21 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode21 ("Direction --{condition_showS:(_TypewriterType21==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering21 ("Centering", Int) = 0
                        _TypewriterCenterSmooth21 ("Center Smooth --{condition_showS:(_TypewriterCentering21==1)}", Range(0, 1)) = 1
                        _BlockVisible21 ("Visible Count --{condition_showS:(_TypewriterType21==1)}", Int) = 0
                        _BlockAnimating21 ("Animating Count --{condition_showS:(_TypewriterType21==1)}", Int) = 0
                        _TypewriterProgress21 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth21 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay21 ("Char Delay --{condition_showS:(_TypewriterType21==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection21 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation21 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale21 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter21 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing21 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor21 ("Anchor", Int) = 0
                       _Spacing21 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing21 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator21 ("Animator", Float) = 0

                [HideInInspector] m_start_effect21 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path21 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX21 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX21_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX21_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY21 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY21_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY21_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ21 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ21_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ21_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX21_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX21_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY21_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY21_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ21_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ21_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity21 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset21 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed21 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation21 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter21 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path21 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake21 ("Shake", Float) = 0
                        _ShakeAmplitude21 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency21 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend21 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake21 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline21 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode21 ("Mode", Int) = 0
                        _OutlineWidth21 ("Width", Range(0, 1)) = 0
                        _OutlineRound21 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor21 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline21 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow21 ("Drop Shadow", Float) = 0
                        _ShadowIntensity21 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness21 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType21 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples21 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset21 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor21 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow21 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap21 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures21 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex21 ("Texture--{reference_properties:[_ApplyTextures21]}", 2D) = "white" {}
                        _MatCapIntensity21 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel21 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend21 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap21 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture21 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT21 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex21 ("Texture--{reference_properties:[_ApplyTexturesT21]}", 2D) = "white" {}
                        _TextureIntensity21 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode21 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture21 ("Texture", Float) = 0

                [HideInInspector] m_end_effect21 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting21 ("", Float) = 0
            [DynamicThryLabel] _TextLabel21 ("TextLabel21", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use22 ("", Float) = 0
            //ifex _Use22==0
            [HideInInspector] m_start_text_setting22 (" --{reference_property:_Use22}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace22 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex22 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode22 ("Mode", Int) = 0
                [Content] _TextInput22 ("Text", Int) = 0
                [HideInInspector] _FontIndex22 ("Font", Int) = 0
                [IntRange] _Layer22 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor22 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position22 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation22 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale22 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot22 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator22 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter22 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType22 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode22 ("Direction --{condition_showS:(_TypewriterType22==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering22 ("Centering", Int) = 0
                        _TypewriterCenterSmooth22 ("Center Smooth --{condition_showS:(_TypewriterCentering22==1)}", Range(0, 1)) = 1
                        _BlockVisible22 ("Visible Count --{condition_showS:(_TypewriterType22==1)}", Int) = 0
                        _BlockAnimating22 ("Animating Count --{condition_showS:(_TypewriterType22==1)}", Int) = 0
                        _TypewriterProgress22 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth22 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay22 ("Char Delay --{condition_showS:(_TypewriterType22==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection22 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation22 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale22 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter22 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing22 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor22 ("Anchor", Int) = 0
                       _Spacing22 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing22 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator22 ("Animator", Float) = 0

                [HideInInspector] m_start_effect22 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path22 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX22 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX22_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX22_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY22 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY22_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY22_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ22 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ22_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ22_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX22_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX22_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY22_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY22_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ22_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ22_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity22 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset22 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed22 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation22 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter22 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path22 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake22 ("Shake", Float) = 0
                        _ShakeAmplitude22 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency22 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend22 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake22 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline22 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode22 ("Mode", Int) = 0
                        _OutlineWidth22 ("Width", Range(0, 1)) = 0
                        _OutlineRound22 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor22 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline22 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow22 ("Drop Shadow", Float) = 0
                        _ShadowIntensity22 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness22 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType22 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples22 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset22 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor22 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow22 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap22 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures22 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex22 ("Texture--{reference_properties:[_ApplyTextures22]}", 2D) = "white" {}
                        _MatCapIntensity22 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel22 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend22 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap22 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture22 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT22 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex22 ("Texture--{reference_properties:[_ApplyTexturesT22]}", 2D) = "white" {}
                        _TextureIntensity22 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode22 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture22 ("Texture", Float) = 0

                [HideInInspector] m_end_effect22 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting22 ("", Float) = 0
            [DynamicThryLabel] _TextLabel22 ("TextLabel22", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use23 ("", Float) = 0
            //ifex _Use23==0
            [HideInInspector] m_start_text_setting23 (" --{reference_property:_Use23}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace23 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex23 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode23 ("Mode", Int) = 0
                [Content] _TextInput23 ("Text", Int) = 0
                [HideInInspector] _FontIndex23 ("Font", Int) = 0
                [IntRange] _Layer23 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor23 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position23 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation23 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale23 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot23 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator23 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter23 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType23 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode23 ("Direction --{condition_showS:(_TypewriterType23==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering23 ("Centering", Int) = 0
                        _TypewriterCenterSmooth23 ("Center Smooth --{condition_showS:(_TypewriterCentering23==1)}", Range(0, 1)) = 1
                        _BlockVisible23 ("Visible Count --{condition_showS:(_TypewriterType23==1)}", Int) = 0
                        _BlockAnimating23 ("Animating Count --{condition_showS:(_TypewriterType23==1)}", Int) = 0
                        _TypewriterProgress23 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth23 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay23 ("Char Delay --{condition_showS:(_TypewriterType23==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection23 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation23 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale23 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter23 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing23 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor23 ("Anchor", Int) = 0
                       _Spacing23 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing23 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator23 ("Animator", Float) = 0

                [HideInInspector] m_start_effect23 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path23 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX23 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX23_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX23_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY23 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY23_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY23_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ23 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ23_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ23_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX23_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX23_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY23_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY23_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ23_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ23_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity23 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset23 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed23 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation23 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter23 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path23 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake23 ("Shake", Float) = 0
                        _ShakeAmplitude23 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency23 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend23 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake23 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline23 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode23 ("Mode", Int) = 0
                        _OutlineWidth23 ("Width", Range(0, 1)) = 0
                        _OutlineRound23 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor23 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline23 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow23 ("Drop Shadow", Float) = 0
                        _ShadowIntensity23 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness23 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType23 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples23 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset23 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor23 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow23 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap23 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures23 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex23 ("Texture--{reference_properties:[_ApplyTextures23]}", 2D) = "white" {}
                        _MatCapIntensity23 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel23 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend23 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap23 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture23 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT23 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex23 ("Texture--{reference_properties:[_ApplyTexturesT23]}", 2D) = "white" {}
                        _TextureIntensity23 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode23 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture23 ("Texture", Float) = 0

                [HideInInspector] m_end_effect23 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting23 ("", Float) = 0
            [DynamicThryLabel] _TextLabel23 ("TextLabel23", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use24 ("", Float) = 0
            //ifex _Use24==0
            [HideInInspector] m_start_text_setting24 (" --{reference_property:_Use24}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace24 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex24 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode24 ("Mode", Int) = 0
                [Content] _TextInput24 ("Text", Int) = 0
                [HideInInspector] _FontIndex24 ("Font", Int) = 0
                [IntRange] _Layer24 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor24 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position24 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation24 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale24 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot24 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator24 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter24 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType24 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode24 ("Direction --{condition_showS:(_TypewriterType24==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering24 ("Centering", Int) = 0
                        _TypewriterCenterSmooth24 ("Center Smooth --{condition_showS:(_TypewriterCentering24==1)}", Range(0, 1)) = 1
                        _BlockVisible24 ("Visible Count --{condition_showS:(_TypewriterType24==1)}", Int) = 0
                        _BlockAnimating24 ("Animating Count --{condition_showS:(_TypewriterType24==1)}", Int) = 0
                        _TypewriterProgress24 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth24 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay24 ("Char Delay --{condition_showS:(_TypewriterType24==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection24 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation24 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale24 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter24 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing24 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor24 ("Anchor", Int) = 0
                       _Spacing24 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing24 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator24 ("Animator", Float) = 0

                [HideInInspector] m_start_effect24 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path24 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX24 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX24_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX24_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY24 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY24_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY24_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ24 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ24_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ24_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX24_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX24_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY24_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY24_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ24_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ24_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity24 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset24 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed24 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation24 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter24 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path24 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake24 ("Shake", Float) = 0
                        _ShakeAmplitude24 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency24 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend24 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake24 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline24 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode24 ("Mode", Int) = 0
                        _OutlineWidth24 ("Width", Range(0, 1)) = 0
                        _OutlineRound24 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor24 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline24 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow24 ("Drop Shadow", Float) = 0
                        _ShadowIntensity24 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness24 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType24 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples24 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset24 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor24 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow24 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap24 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures24 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex24 ("Texture--{reference_properties:[_ApplyTextures24]}", 2D) = "white" {}
                        _MatCapIntensity24 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel24 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend24 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap24 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture24 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT24 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex24 ("Texture--{reference_properties:[_ApplyTexturesT24]}", 2D) = "white" {}
                        _TextureIntensity24 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode24 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture24 ("Texture", Float) = 0

                [HideInInspector] m_end_effect24 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting24 ("", Float) = 0
            [DynamicThryLabel] _TextLabel24 ("TextLabel24", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use25 ("", Float) = 0
            //ifex _Use25==0
            [HideInInspector] m_start_text_setting25 (" --{reference_property:_Use25}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace25 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex25 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode25 ("Mode", Int) = 0
                [Content] _TextInput25 ("Text", Int) = 0
                [HideInInspector] _FontIndex25 ("Font", Int) = 0
                [IntRange] _Layer25 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor25 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position25 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation25 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale25 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot25 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator25 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter25 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType25 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode25 ("Direction --{condition_showS:(_TypewriterType25==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering25 ("Centering", Int) = 0
                        _TypewriterCenterSmooth25 ("Center Smooth --{condition_showS:(_TypewriterCentering25==1)}", Range(0, 1)) = 1
                        _BlockVisible25 ("Visible Count --{condition_showS:(_TypewriterType25==1)}", Int) = 0
                        _BlockAnimating25 ("Animating Count --{condition_showS:(_TypewriterType25==1)}", Int) = 0
                        _TypewriterProgress25 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth25 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay25 ("Char Delay --{condition_showS:(_TypewriterType25==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection25 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation25 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale25 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter25 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing25 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor25 ("Anchor", Int) = 0
                       _Spacing25 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing25 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator25 ("Animator", Float) = 0

                [HideInInspector] m_start_effect25 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path25 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX25 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX25_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX25_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY25 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY25_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY25_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ25 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ25_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ25_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX25_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX25_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY25_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY25_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ25_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ25_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity25 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset25 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed25 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation25 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter25 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path25 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake25 ("Shake", Float) = 0
                        _ShakeAmplitude25 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency25 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend25 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake25 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline25 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode25 ("Mode", Int) = 0
                        _OutlineWidth25 ("Width", Range(0, 1)) = 0
                        _OutlineRound25 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor25 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline25 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow25 ("Drop Shadow", Float) = 0
                        _ShadowIntensity25 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness25 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType25 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples25 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset25 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor25 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow25 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap25 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures25 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex25 ("Texture--{reference_properties:[_ApplyTextures25]}", 2D) = "white" {}
                        _MatCapIntensity25 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel25 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend25 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap25 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture25 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT25 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex25 ("Texture--{reference_properties:[_ApplyTexturesT25]}", 2D) = "white" {}
                        _TextureIntensity25 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode25 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture25 ("Texture", Float) = 0

                [HideInInspector] m_end_effect25 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting25 ("", Float) = 0
            [DynamicThryLabel] _TextLabel25 ("TextLabel25", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use26 ("", Float) = 0
            //ifex _Use26==0
            [HideInInspector] m_start_text_setting26 (" --{reference_property:_Use26}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace26 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex26 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode26 ("Mode", Int) = 0
                [Content] _TextInput26 ("Text", Int) = 0
                [HideInInspector] _FontIndex26 ("Font", Int) = 0
                [IntRange] _Layer26 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor26 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position26 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation26 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale26 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot26 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator26 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter26 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType26 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode26 ("Direction --{condition_showS:(_TypewriterType26==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering26 ("Centering", Int) = 0
                        _TypewriterCenterSmooth26 ("Center Smooth --{condition_showS:(_TypewriterCentering26==1)}", Range(0, 1)) = 1
                        _BlockVisible26 ("Visible Count --{condition_showS:(_TypewriterType26==1)}", Int) = 0
                        _BlockAnimating26 ("Animating Count --{condition_showS:(_TypewriterType26==1)}", Int) = 0
                        _TypewriterProgress26 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth26 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay26 ("Char Delay --{condition_showS:(_TypewriterType26==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection26 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation26 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale26 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter26 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing26 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor26 ("Anchor", Int) = 0
                       _Spacing26 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing26 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator26 ("Animator", Float) = 0

                [HideInInspector] m_start_effect26 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path26 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX26 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX26_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX26_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY26 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY26_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY26_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ26 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ26_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ26_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX26_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX26_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY26_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY26_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ26_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ26_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity26 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset26 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed26 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation26 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter26 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path26 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake26 ("Shake", Float) = 0
                        _ShakeAmplitude26 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency26 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend26 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake26 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline26 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode26 ("Mode", Int) = 0
                        _OutlineWidth26 ("Width", Range(0, 1)) = 0
                        _OutlineRound26 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor26 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline26 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow26 ("Drop Shadow", Float) = 0
                        _ShadowIntensity26 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness26 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType26 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples26 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset26 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor26 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow26 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap26 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures26 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex26 ("Texture--{reference_properties:[_ApplyTextures26]}", 2D) = "white" {}
                        _MatCapIntensity26 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel26 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend26 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap26 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture26 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT26 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex26 ("Texture--{reference_properties:[_ApplyTexturesT26]}", 2D) = "white" {}
                        _TextureIntensity26 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode26 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture26 ("Texture", Float) = 0

                [HideInInspector] m_end_effect26 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting26 ("", Float) = 0
            [DynamicThryLabel] _TextLabel26 ("TextLabel26", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use27 ("", Float) = 0
            //ifex _Use27==0
            [HideInInspector] m_start_text_setting27 (" --{reference_property:_Use27}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace27 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex27 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode27 ("Mode", Int) = 0
                [Content] _TextInput27 ("Text", Int) = 0
                [HideInInspector] _FontIndex27 ("Font", Int) = 0
                [IntRange] _Layer27 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor27 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position27 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation27 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale27 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot27 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator27 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter27 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType27 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode27 ("Direction --{condition_showS:(_TypewriterType27==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering27 ("Centering", Int) = 0
                        _TypewriterCenterSmooth27 ("Center Smooth --{condition_showS:(_TypewriterCentering27==1)}", Range(0, 1)) = 1
                        _BlockVisible27 ("Visible Count --{condition_showS:(_TypewriterType27==1)}", Int) = 0
                        _BlockAnimating27 ("Animating Count --{condition_showS:(_TypewriterType27==1)}", Int) = 0
                        _TypewriterProgress27 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth27 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay27 ("Char Delay --{condition_showS:(_TypewriterType27==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection27 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation27 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale27 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter27 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing27 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor27 ("Anchor", Int) = 0
                       _Spacing27 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing27 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator27 ("Animator", Float) = 0

                [HideInInspector] m_start_effect27 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path27 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX27 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX27_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX27_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY27 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY27_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY27_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ27 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ27_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ27_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX27_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX27_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY27_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY27_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ27_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ27_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity27 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset27 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed27 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation27 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter27 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path27 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake27 ("Shake", Float) = 0
                        _ShakeAmplitude27 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency27 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend27 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake27 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline27 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode27 ("Mode", Int) = 0
                        _OutlineWidth27 ("Width", Range(0, 1)) = 0
                        _OutlineRound27 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor27 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline27 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow27 ("Drop Shadow", Float) = 0
                        _ShadowIntensity27 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness27 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType27 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples27 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset27 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor27 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow27 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap27 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures27 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex27 ("Texture--{reference_properties:[_ApplyTextures27]}", 2D) = "white" {}
                        _MatCapIntensity27 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel27 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend27 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap27 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture27 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT27 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex27 ("Texture--{reference_properties:[_ApplyTexturesT27]}", 2D) = "white" {}
                        _TextureIntensity27 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode27 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture27 ("Texture", Float) = 0

                [HideInInspector] m_end_effect27 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting27 ("", Float) = 0
            [DynamicThryLabel] _TextLabel27 ("TextLabel27", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use28 ("", Float) = 0
            //ifex _Use28==0
            [HideInInspector] m_start_text_setting28 (" --{reference_property:_Use28}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace28 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex28 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode28 ("Mode", Int) = 0
                [Content] _TextInput28 ("Text", Int) = 0
                [HideInInspector] _FontIndex28 ("Font", Int) = 0
                [IntRange] _Layer28 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor28 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position28 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation28 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale28 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot28 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator28 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter28 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType28 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode28 ("Direction --{condition_showS:(_TypewriterType28==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering28 ("Centering", Int) = 0
                        _TypewriterCenterSmooth28 ("Center Smooth --{condition_showS:(_TypewriterCentering28==1)}", Range(0, 1)) = 1
                        _BlockVisible28 ("Visible Count --{condition_showS:(_TypewriterType28==1)}", Int) = 0
                        _BlockAnimating28 ("Animating Count --{condition_showS:(_TypewriterType28==1)}", Int) = 0
                        _TypewriterProgress28 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth28 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay28 ("Char Delay --{condition_showS:(_TypewriterType28==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection28 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation28 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale28 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter28 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing28 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor28 ("Anchor", Int) = 0
                       _Spacing28 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing28 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator28 ("Animator", Float) = 0

                [HideInInspector] m_start_effect28 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path28 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX28 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX28_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX28_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY28 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY28_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY28_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ28 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ28_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ28_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX28_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX28_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY28_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY28_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ28_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ28_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity28 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset28 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed28 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation28 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter28 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path28 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake28 ("Shake", Float) = 0
                        _ShakeAmplitude28 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency28 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend28 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake28 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline28 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode28 ("Mode", Int) = 0
                        _OutlineWidth28 ("Width", Range(0, 1)) = 0
                        _OutlineRound28 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor28 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline28 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow28 ("Drop Shadow", Float) = 0
                        _ShadowIntensity28 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness28 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType28 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples28 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset28 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor28 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow28 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap28 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures28 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex28 ("Texture--{reference_properties:[_ApplyTextures28]}", 2D) = "white" {}
                        _MatCapIntensity28 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel28 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend28 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap28 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture28 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT28 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex28 ("Texture--{reference_properties:[_ApplyTexturesT28]}", 2D) = "white" {}
                        _TextureIntensity28 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode28 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture28 ("Texture", Float) = 0

                [HideInInspector] m_end_effect28 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting28 ("", Float) = 0
            [DynamicThryLabel] _TextLabel28 ("TextLabel28", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use29 ("", Float) = 0
            //ifex _Use29==0
            [HideInInspector] m_start_text_setting29 (" --{reference_property:_Use29}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace29 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex29 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode29 ("Mode", Int) = 0
                [Content] _TextInput29 ("Text", Int) = 0
                [HideInInspector] _FontIndex29 ("Font", Int) = 0
                [IntRange] _Layer29 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor29 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position29 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation29 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale29 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot29 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator29 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter29 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType29 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode29 ("Direction --{condition_showS:(_TypewriterType29==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering29 ("Centering", Int) = 0
                        _TypewriterCenterSmooth29 ("Center Smooth --{condition_showS:(_TypewriterCentering29==1)}", Range(0, 1)) = 1
                        _BlockVisible29 ("Visible Count --{condition_showS:(_TypewriterType29==1)}", Int) = 0
                        _BlockAnimating29 ("Animating Count --{condition_showS:(_TypewriterType29==1)}", Int) = 0
                        _TypewriterProgress29 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth29 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay29 ("Char Delay --{condition_showS:(_TypewriterType29==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection29 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation29 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale29 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter29 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing29 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor29 ("Anchor", Int) = 0
                       _Spacing29 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing29 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator29 ("Animator", Float) = 0

                [HideInInspector] m_start_effect29 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path29 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX29 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX29_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX29_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY29 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY29_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY29_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ29 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ29_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ29_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX29_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX29_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY29_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY29_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ29_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ29_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity29 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset29 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed29 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation29 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter29 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path29 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake29 ("Shake", Float) = 0
                        _ShakeAmplitude29 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency29 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend29 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake29 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline29 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode29 ("Mode", Int) = 0
                        _OutlineWidth29 ("Width", Range(0, 1)) = 0
                        _OutlineRound29 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor29 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline29 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow29 ("Drop Shadow", Float) = 0
                        _ShadowIntensity29 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness29 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType29 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples29 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset29 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor29 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow29 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap29 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures29 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex29 ("Texture--{reference_properties:[_ApplyTextures29]}", 2D) = "white" {}
                        _MatCapIntensity29 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel29 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend29 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap29 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture29 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT29 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex29 ("Texture--{reference_properties:[_ApplyTexturesT29]}", 2D) = "white" {}
                        _TextureIntensity29 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode29 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture29 ("Texture", Float) = 0

                [HideInInspector] m_end_effect29 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting29 ("", Float) = 0
            [DynamicThryLabel] _TextLabel29 ("TextLabel29", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use30 ("", Float) = 0
            //ifex _Use30==0
            [HideInInspector] m_start_text_setting30 (" --{reference_property:_Use30}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace30 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex30 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode30 ("Mode", Int) = 0
                [Content] _TextInput30 ("Text", Int) = 0
                [HideInInspector] _FontIndex30 ("Font", Int) = 0
                [IntRange] _Layer30 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor30 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position30 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation30 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale30 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot30 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator30 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter30 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType30 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode30 ("Direction --{condition_showS:(_TypewriterType30==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering30 ("Centering", Int) = 0
                        _TypewriterCenterSmooth30 ("Center Smooth --{condition_showS:(_TypewriterCentering30==1)}", Range(0, 1)) = 1
                        _BlockVisible30 ("Visible Count --{condition_showS:(_TypewriterType30==1)}", Int) = 0
                        _BlockAnimating30 ("Animating Count --{condition_showS:(_TypewriterType30==1)}", Int) = 0
                        _TypewriterProgress30 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth30 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay30 ("Char Delay --{condition_showS:(_TypewriterType30==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection30 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation30 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale30 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter30 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing30 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor30 ("Anchor", Int) = 0
                       _Spacing30 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing30 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator30 ("Animator", Float) = 0

                [HideInInspector] m_start_effect30 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path30 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX30 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX30_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX30_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY30 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY30_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY30_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ30 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ30_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ30_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX30_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX30_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY30_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY30_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ30_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ30_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity30 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset30 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed30 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation30 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter30 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path30 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake30 ("Shake", Float) = 0
                        _ShakeAmplitude30 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency30 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend30 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake30 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline30 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode30 ("Mode", Int) = 0
                        _OutlineWidth30 ("Width", Range(0, 1)) = 0
                        _OutlineRound30 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor30 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline30 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow30 ("Drop Shadow", Float) = 0
                        _ShadowIntensity30 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness30 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType30 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples30 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset30 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor30 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow30 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap30 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures30 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex30 ("Texture--{reference_properties:[_ApplyTextures30]}", 2D) = "white" {}
                        _MatCapIntensity30 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel30 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend30 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap30 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture30 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT30 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex30 ("Texture--{reference_properties:[_ApplyTexturesT30]}", 2D) = "white" {}
                        _TextureIntensity30 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode30 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture30 ("Texture", Float) = 0

                [HideInInspector] m_end_effect30 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting30 ("", Float) = 0
            [DynamicThryLabel] _TextLabel30 ("TextLabel30", Int) = 0
            //endex

            [HideInInspector][Toggle] _Use31 ("", Float) = 0
            //ifex _Use31==0
            [HideInInspector] m_start_text_setting31 (" --{reference_property:_Use31}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace31 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex31 ("Root", Int) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2)] _Mode31 ("Mode", Int) = 0
                [Content] _TextInput31 ("Text", Int) = 0
                [HideInInspector] _FontIndex31 ("Font", Int) = 0
                [IntRange] _Layer31 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor31 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position31 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation31 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale31 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot31 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator31 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter31 ("Typewriter", Float) = 0
                        [Enum(Sequential, 0, Block, 1)] _TypewriterType31 ("Type", Int) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode31 ("Direction --{condition_showS:(_TypewriterType31==0)}", Int) = 0
                        [Enum(Disable, 0, Enable, 1)] _TypewriterCentering31 ("Centering", Int) = 0
                        _TypewriterCenterSmooth31 ("Center Smooth --{condition_showS:(_TypewriterCentering31==1)}", Range(0, 1)) = 1
                        _BlockVisible31 ("Visible Count --{condition_showS:(_TypewriterType31==1)}", Int) = 0
                        _BlockAnimating31 ("Animating Count --{condition_showS:(_TypewriterType31==1)}", Int) = 0
                        _TypewriterProgress31 ("Progress", Range(0, 1)) = 1
                        _TypewriterSmooth31 ("Smooth", Range(0, 1)) = 1
                        _BlockCharDelay31 ("Char Delay --{condition_showS:(_TypewriterType31==1)}", Range(0, 1)) = 0.3
                        [Vector3] _TypewriterDirection31 ("Offset", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation31 ("Rotation", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterScale31 ("Scale", Vector) = (1, 1, 1, 0)
                    [HideInInspector] m_end_typewriter31 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing31 ("Kerning & Tracking", Float) = 0
                       [Enum(Center, 0, Left, 1, Right, 2)] _SpacingAnchor31 ("Anchor", Int) = 0
                       _Spacing31 ("Spacing", Range(-1, 1)) = 0
                    [HideInInspector] m_end_spacing31 ("Kerning & Tracking", Float) = 0
                [HideInInspector] m_end_animator31 ("Animator", Float) = 0

                [HideInInspector] m_start_effect31 ("Effector", Float) = 0
                    [HideInInspector] m_start_curve_path31 ("Curve Path", Float) = 0
                        [CurveBaked]_CurveX31 ("X Curve", Int) = 0
                        [HideInInspector]_CurveDataX31_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataX31_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveY31 ("Y Curve", Int) = 0
                        [HideInInspector]_CurveDataY31_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataY31_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [CurveBaked]_CurveZ31 ("Z Curve", Int) = 0
                        [HideInInspector]_CurveDataZ31_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataZ31_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX31_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTX31_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY31_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTY31_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ31_0 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        [HideInInspector]_CurveDataTZ31_1 ("", Vector) = (0.5, 0.5, 0.5, 0.5)
                        _CurveIntensity31 ("Intensity", Range(0, 1)) = 0
                        _CurveOffset31 ("Offset", Range(0, 1)) = 0
                        _CurveSpeed31 ("Speed", Range(-1, 1)) = 0
                        _CurveRotation31 ("Rotation", Range(0, 1)) = 0
                        [HideInInspector]_CurveCenter31 ("", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_curve_path31 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake31 ("Shake", Float) = 0
                        _ShakeAmplitude31 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency31 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend31 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake31 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline31 ("Outline", Float) = 0
                        [Enum(Outline, 0, Stroke, 1)] _OutlineMode31 ("Mode", Int) = 0
                        _OutlineWidth31 ("Width", Range(0, 1)) = 0
                        _OutlineRound31 ("Round", Range(0, 1)) = 0
                        [HDR]_OutlineColor31 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline31 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow31 ("Drop Shadow", Float) = 0
                        _ShadowIntensity31 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness31 ("Softness", Range(0, 1)) = 0
                        [Enum(Uniform, 0, Golden, 1, Halton, 2)] _ShadowDitherType31 ("Dither", Int) = 1
                        [IntRange] _ShadowSamples31 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset31 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor31 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow31 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_matcap31 ("MatCap", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTextures31 ("", Int) = 0
                        [StylizedLargeTexture] _MatCapTex31 ("Texture--{reference_properties:[_ApplyTextures31]}", 2D) = "white" {}
                        _MatCapIntensity31 ("Intensity", Range(0, 1)) = 0
                        _MatCapBevel31 ("Bevel", Range(0, 1)) = 0
                        _MatCapBlend31 ("Replace", Range(0, 1)) = 0
                    [HideInInspector] m_end_matcap31 ("MatCap", Float) = 0

                    [HideInInspector] m_start_texture31 ("Texture", Float) = 0
                        [HideInInspector][Apply(1.15)] _ApplyTexturesT31 ("", Int) = 0
                        [StylizedLargeTexture] _TextureTex31 ("Texture--{reference_properties:[_ApplyTexturesT31]}", 2D) = "white" {}
                        _TextureIntensity31 ("Intensity", Range(0, 1)) = 0
                        [Enum(Glyph UV, 0, World UV, 1)] _TextureUVMode31 ("UV Mode", Int) = 0
                    [HideInInspector] m_end_texture31 ("Texture", Float) = 0

                [HideInInspector] m_end_effect31 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting31 ("", Float) = 0
            [DynamicThryLabel] _TextLabel31 ("TextLabel31", Int) = 0
            //endex

        [HideInInspector] m_end_text_setting ("Text Settings", Float) = 0

        [HideInInspector] m_start_particle_setting ("<b><i><color=#400080>P</color><color=#4B0F87>a</color><color=#561E8E>r</color><color=#612D96>t</color><color=#6C3C9D>i</color><color=#784BA5>c</color><color=#835AAC>l</color><color=#8E69B4>e</color> <color=#A587C3>S</color><color=#B096CA>e</color><color=#BBA5D2>t</color><color=#C6B4D9>t</color><color=#D2C3E1>i</color><color=#DDD2E8>n</color><color=#E8E1F0>g</color><color=#F3F0F7>s</color></i></b>", Float) = 0
            [Enum(Screen,0,World,1)] _Particle0Space ("Space", Int) = 0
            [IntRange] _Particle0Multiplier ("Multiplier", Range(0, 25)) = 1
            [Enum(Sphere,0,Cube,1)] _Particle0Distribution ("Distribution", Int) = 0
            [HideInInspector] m_start_particle_0_shape ("Shape", Float) = 1
                [Enum(Circle,0,Square,1,Triangle,2,Cross,3,Random,4)] _Particle0Shape ("Shape", Int) = 0
                [Gradient] _Particle0Gradient ("Gradient", 2D) = "white" {}
                _Particle0Size ("Size", Float) = 1.0
                [Vector3] _Particle0Rotation ("Rotation", Vector) = (0, 0, 0, 0)
                _Particle0Hollow ("Hollow", Range(0.1, 1)) = 1
            [HideInInspector] m_end_particle_0_shape ("", Float) = 0
            [HideInInspector] m_start_particle_0_effect ("Effect", Float) = 0
                _Particle0Speed ("Speed", Float) = 0.2
                _Particle0Lifetime ("Lifetime", Float) = 1.0
                [Vector3] _Particle0Direction ("Direction", Vector) = (0, 0, 0, 0)
                [Vector3] _Particle0Position ("Position", Vector) = (0, 0, 0, 0)
                [Vector3] _Particle0Scale ("Scale", Vector) = (3, 3, 3, 0)
            [HideInInspector] m_end_particle_0_effect ("Effect", Float) = 0
        [HideInInspector] m_end_particle_setting ("Particle Settings", Float) = 0

        [HideInInspector] m_start_rendering_settings ("<b><i><color=#808080>R</color><color=#878787>e</color><color=#8E8E8E>n</color><color=#959595>d</color><color=#9C9C9C>e</color><color=#A3A3A3>r</color><color=#AAAAAA>i</color><color=#B1B1B1>n</color><color=#B8B8B8>g</color> <color=#C6C6C6>S</color><color=#CDCDCD>e</color><color=#D4D4D4>t</color><color=#DBDBDB>t</color><color=#E2E2E2>i</color><color=#E9E9E9>n</color><color=#F0F0F0>g</color><color=#F7F7F7>s</color></i></b>", Float) = 0
            _FadeMin ("Fade Min", Float) = 0
            _FadeMax ("Fade Max", Float) = 99999
            [ThryWideEnum(Opaque, 0, Transparent, 1, Overlay, 2)] _RenderType ("Render Type", Int) = 1
            [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
            [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
            [Enum(UnityEngine.Rendering.BlendMode)] _SourceBlend ("Source Blend", Float) = 1
            [Enum(UnityEngine.Rendering.BlendMode)] _DestinationBlend ("Destination Blend", Float) = 10
            [Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Int) = 1

            [HideInInspector]m_start_stencil ("Stencil", Float) = 0
                [HideInInspector] m_start_image_stencil ("Image Stencil", Float) = 0
                    [IntRange] _ImageStencilRef ("Reference", Range(0, 255)) = 0
                    [IntRange] _ImageStencilReadMask ("Read Mask", Range(0, 255)) = 255
                    [IntRange] _ImageStencilWriteMask ("Write Mask", Range(0, 255)) = 255
                    [Enum(UnityEngine.Rendering.CompareFunction)] _ImageStencilComp ("Compare", Int) = 8
                    [Enum(UnityEngine.Rendering.StencilOp)] _ImageStencilPass ("Pass", Int) = 0
                    [Enum(UnityEngine.Rendering.StencilOp)] _ImageStencilFail ("Fail", Int) = 0
                    [Enum(UnityEngine.Rendering.StencilOp)] _ImageStencilZFail ("ZFail", Int) = 0
                [HideInInspector] m_end_image_stencil ("Image Stencil", Float) = 0

                [HideInInspector] m_start_text_stencil ("Text Stencil", Float) = 0
                    [IntRange] _TextStencilRef ("Reference", Range(0, 255)) = 0
                    [IntRange] _TextStencilReadMask ("Read Mask", Range(0, 255)) = 255
                    [IntRange] _TextStencilWriteMask ("Write Mask", Range(0, 255)) = 255
                    [Enum(UnityEngine.Rendering.CompareFunction)] _TextStencilComp ("Compare", Int) = 8
                    [Enum(UnityEngine.Rendering.StencilOp)] _TextStencilPass ("Pass", Int) = 0
                    [Enum(UnityEngine.Rendering.StencilOp)] _TextStencilFail ("Fail", Int) = 0
                    [Enum(UnityEngine.Rendering.StencilOp)] _TextStencilZFail ("ZFail", Int) = 0
                [HideInInspector] m_end_text_stencil ("Text Stencil", Float) = 0

                [HideInInspector] m_start_particle_stencil ("Particle Stencil", Float) = 0
                    [IntRange] _ParticleStencilRef ("Reference", Range(0, 255)) = 0
                    [IntRange] _ParticleStencilReadMask ("Read Mask", Range(0, 255)) = 255
                    [IntRange] _ParticleStencilWriteMask ("Write Mask", Range(0, 255)) = 255
                    [Enum(UnityEngine.Rendering.CompareFunction)] _ParticleStencilComp ("Compare", Int) = 8
                    [Enum(UnityEngine.Rendering.StencilOp)] _ParticleStencilPass ("Pass", Int) = 0
                    [Enum(UnityEngine.Rendering.StencilOp)] _ParticleStencilFail ("Fail", Int) = 0
                    [Enum(UnityEngine.Rendering.StencilOp)] _ParticleStencilZFail ("ZFail", Int) = 0
                [HideInInspector] m_end_particle_stencil ("Particle Stencil", Float) = 0
            [HideInInspector] m_end_stencil ("Stencil", Float) = 0

            [HideInInspector] m_start_utility_settings ("Utility", Float) = 0
                _AlphaCutoff ("Alpha Cutoff", Range(0, 1)) = 0.0001
                _QuadPadding ("Quad Padding", Range(0, 1)) = 0.5
                _VRScale ("VR Scale", Range(0.1, 1)) = 0.3
            [HideInInspector] m_end_utility_settings ("Utility", Float) = 0

            [HideInInspector] m_start_internal_settings ("Internal", Float) = 0
                    _FontTextureArray ("Font Texture Array", 2DArray) = "" {}
                    _TextureArray ("Texture Array", 2DArray) = "" {}
                    _TextureLayerLUT ("Texture Layer LUT", 2D) = "black" {}
                    _DataTexture ("Data Texture", 2D) = "" {}
                    _AtlasInvSize ("Atlas Inv Size", Float) = 0.03125
                    _AtlasMask ("Atlas Mask", Int) = 31
                    _AtlasShift ("Atlas Shift", Int) = 5
                    _AtlasHalfInvPxRange ("Atlas Half Inv Px Range", Float) = 0.125
                [HideInInspector] m_end_internal_settings ("Internal", Float) = 0
            [HideInInspector] m_end_debug_settings ("Debug", Float) = 0
        [HideInInspector] m_end_rendering_settings ("Rendering Settings", Float) = 0
    }

    CustomEditor "Thry.ShaderEditor"

    SubShader
    {
        ZWrite [_ZWrite]
        Cull [_Cull]
        ZTest [_ZTest]
        Blend [_SourceBlend] [_DestinationBlend]

        Tags
        {
            "RenderType" = "Transparent"
            "Queue" = "Transparent"
            "IsEmissive" = "true"
            "DisableBatching" = "true"
            "ForceNoShadowCasting" = "true"
            "IgnoreProjector" = "true"
            "PreviewType" = "Plane"
            "VRCFallback" = "Hidden"
        }

        // ====================================================================
        // Pass 1: Images
        // ====================================================================
        Pass
        {
            Name "Images"

            Stencil
            {
                Ref [_ImageStencilRef]
                ReadMask [_ImageStencilReadMask]
                WriteMask [_ImageStencilWriteMask]
                Comp [_ImageStencilComp]
                Pass [_ImageStencilPass]
                Fail [_ImageStencilFail]
                ZFail [_ImageStencilZFail]
            }

            CGPROGRAM
            #pragma vertex image_vert
            #pragma fragment image_frag
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"

            // Uniforms must be declared before include (functions reference these)
            float4 _CameraPosition;
            float4 _CameraRotation;
            float _CameraFOV;
            float _VRScale;
            float _FadeMin;
            float _FadeMax;
            float _AlphaCutoff;

            float4 _RootPosition0;
            float4 _RootPosition1;
            float4 _RootPosition2;
            float4 _RootPosition3;
            float4 _RootPosition4;
            float4 _RootMatrix0_Row0;
            float4 _RootMatrix0_Row1;
            float4 _RootMatrix0_Row2;
            float4 _RootMatrix1_Row0;
            float4 _RootMatrix1_Row1;
            float4 _RootMatrix1_Row2;
            float4 _RootMatrix2_Row0;
            float4 _RootMatrix2_Row1;
            float4 _RootMatrix2_Row2;
            float4 _RootMatrix3_Row0;
            float4 _RootMatrix3_Row1;
            float4 _RootMatrix3_Row2;
            float4 _RootMatrix4_Row0;
            float4 _RootMatrix4_Row1;
            float4 _RootMatrix4_Row2;

            // Combined texture array (Image/MatCap/Overlay - 96 layers)
            UNITY_DECLARE_TEX2DARRAY(_TextureArray);

            #include "Include/Images.hlsl"

            image_v2f image_vert(image_appdata v)
            {
                image_v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.vertex = float4(0, 0, -1, 1);
                o.image_uv = v.uv2;
                o.color_packed = uint2(0, 0);
                o.fade_id_packed = 0;
                o.chroma_packed = uint2(0, 0);
                o.chroma_extra = 0;

                uint image_id = (uint)(v.uv.y * 32.0);

                // Compute shared values once (VR scale, camera, distance fade)
                float vr_scale = get_vr_scale(_VRScale);
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                float fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                float3 cam_pos = _CameraPosition.xyz * CM_TO_METER_SCALE;
                float3x3 cam_rot_inv = transpose(rotation_matrix(_CameraRotation.xyz * DEG2_RAD));
                float tan_half_fov = tan(_CameraFOV * DEG2_RAD * 0.5);
                float aspect = get_screen_aspect();

                // Pack fade (image_id set by process_image)
                o.fade_id_packed = f32tof16(fade);

                // Load parameters based on image_id
                ImageParams p;
                switch(image_id)
                {
                    case 0: LOAD_IMAGE_PARAMS(0, p); break;
                    case 1: LOAD_IMAGE_PARAMS(1, p); break;
                    case 2: LOAD_IMAGE_PARAMS(2, p); break;
                    case 3: LOAD_IMAGE_PARAMS(3, p); break;
                    case 4: LOAD_IMAGE_PARAMS(4, p); break;
                    case 5: LOAD_IMAGE_PARAMS(5, p); break;
                    case 6: LOAD_IMAGE_PARAMS(6, p); break;
                    case 7: LOAD_IMAGE_PARAMS(7, p); break;
                    case 8: LOAD_IMAGE_PARAMS(8, p); break;
                    case 9: LOAD_IMAGE_PARAMS(9, p); break;
                    case 10: LOAD_IMAGE_PARAMS(10, p); break;
                    case 11: LOAD_IMAGE_PARAMS(11, p); break;
                    case 12: LOAD_IMAGE_PARAMS(12, p); break;
                    case 13: LOAD_IMAGE_PARAMS(13, p); break;
                    case 14: LOAD_IMAGE_PARAMS(14, p); break;
                    case 15: LOAD_IMAGE_PARAMS(15, p); break;
                    case 16: LOAD_IMAGE_PARAMS(16, p); break;
                    case 17: LOAD_IMAGE_PARAMS(17, p); break;
                    case 18: LOAD_IMAGE_PARAMS(18, p); break;
                    case 19: LOAD_IMAGE_PARAMS(19, p); break;
                    case 20: LOAD_IMAGE_PARAMS(20, p); break;
                    case 21: LOAD_IMAGE_PARAMS(21, p); break;
                    case 22: LOAD_IMAGE_PARAMS(22, p); break;
                    case 23: LOAD_IMAGE_PARAMS(23, p); break;
                    case 24: LOAD_IMAGE_PARAMS(24, p); break;
                    case 25: LOAD_IMAGE_PARAMS(25, p); break;
                    case 26: LOAD_IMAGE_PARAMS(26, p); break;
                    case 27: LOAD_IMAGE_PARAMS(27, p); break;
                    case 28: LOAD_IMAGE_PARAMS(28, p); break;
                    case 29: LOAD_IMAGE_PARAMS(29, p); break;
                    case 30: LOAD_IMAGE_PARAMS(30, p); break;
                    default: LOAD_IMAGE_PARAMS(31, p); break;
                }

                // Process image (returns false if culled/disabled)
                if (!process_image(o, v.uv2, p, image_id, cam_pos, cam_rot_inv, tan_half_fov, aspect, vr_scale))
                {
                    o.vertex = float4(0,0,-1,1);
                    return o;
                }

                return o;
            }

            half4 image_frag(image_v2f i) : SV_Target
            {
                // Unpack packed data
                float4 color = unpack_image_color(i.color_packed);
                float fade;
                uint image_id;
                unpack_image_fade_id(i.fade_id_packed, fade, image_id);

                float4 image_color = sample_image_texture(image_id, i.image_uv);

                // Chroma Key (RGB-based)
                float3 chroma_key; float chroma_cutoff, chroma_feather;
                unpack_chroma_key(i.chroma_packed, i.chroma_extra, chroma_key, chroma_cutoff, chroma_feather);
                apply_chroma_key(image_color, chroma_key, chroma_cutoff, chroma_feather);

                float4 final_color = image_color * color;
                final_color.a *= fade;
                clip(final_color.a - _AlphaCutoff);
                // Pre-multiplied alpha output (prevents Bloom on transparent pixels)
                return half4(final_color.rgb * final_color.a, final_color.a);
            }
            ENDCG
        }

        // ====================================================================
        // Pass 2: Text
        // ====================================================================
        Pass
        {
            Name "Text"

            Stencil
            {
                Ref [_TextStencilRef]
                ReadMask [_TextStencilReadMask]
                WriteMask [_TextStencilWriteMask]
                Comp [_TextStencilComp]
                Pass [_TextStencilPass]
                Fail [_TextStencilFail]
                ZFail [_TextStencilZFail]
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"

            // ============================================================================
            // Textures and Properties (declared before includes - functions reference these)
            // ============================================================================

            // Font texture array (per-font atlas - declared before includes because Effects.hlsl uses it)
            UNITY_DECLARE_TEX2DARRAY(_FontTextureArray);

            // Combined texture array (Image/MatCap/Overlay - 96 layers)
            UNITY_DECLARE_TEX2DARRAY(_TextureArray);

            // Atlas parameters (declared before includes because Effects.hlsl uses them)
            float _AtlasInvSize;
            int _AtlasMask;
            int _AtlasShift;
            float _AtlasHalfInvPxRange;

            Texture2D _DataTexture;
            float4 _DataTexture_TexelSize;

            // Camera
            float4 _CameraPosition;
            float4 _CameraRotation;
            float _CameraFOV;
            float _VRScale;

            // Debug
            float _DFC;

            // Fade, Alpha Cutoff, Quad Padding
            float _AlphaCutoff;
            float _FadeMin;
            float _FadeMax;
            float _QuadPadding;

            // Root Transforms (5 roots) - precomputed matrices
            float4 _RootPosition0;
            float4 _RootPosition1;
            float4 _RootPosition2;
            float4 _RootPosition3;
            float4 _RootPosition4;
            float4 _RootMatrix0_Row0;
            float4 _RootMatrix0_Row1;
            float4 _RootMatrix0_Row2;
            float4 _RootMatrix1_Row0;
            float4 _RootMatrix1_Row1;
            float4 _RootMatrix1_Row2;
            float4 _RootMatrix2_Row0;
            float4 _RootMatrix2_Row1;
            float4 _RootMatrix2_Row2;
            float4 _RootMatrix3_Row0;
            float4 _RootMatrix3_Row1;
            float4 _RootMatrix3_Row2;
            float4 _RootMatrix4_Row0;
            float4 _RootMatrix4_Row1;
            float4 _RootMatrix4_Row2;

            #include "Include/Texts.hlsl"

            // Declare all text variables (using macro from Texts.hlsl)
            //ifex _Use0==0
            DECLARE_TEXT_VARS(0)
            //endex
            //ifex _Use1==0
            DECLARE_TEXT_VARS(1)
            //endex
            //ifex _Use2==0
            DECLARE_TEXT_VARS(2)
            //endex
            //ifex _Use3==0
            DECLARE_TEXT_VARS(3)
            //endex
            //ifex _Use4==0
            DECLARE_TEXT_VARS(4)
            //endex
            //ifex _Use5==0
            DECLARE_TEXT_VARS(5)
            //endex
            //ifex _Use6==0
            DECLARE_TEXT_VARS(6)
            //endex
            //ifex _Use7==0
            DECLARE_TEXT_VARS(7)
            //endex
            //ifex _Use8==0
            DECLARE_TEXT_VARS(8)
            //endex
            //ifex _Use9==0
            DECLARE_TEXT_VARS(9)
            //endex
            //ifex _Use10==0
            DECLARE_TEXT_VARS(10)
            //endex
            //ifex _Use11==0
            DECLARE_TEXT_VARS(11)
            //endex
            //ifex _Use12==0
            DECLARE_TEXT_VARS(12)
            //endex
            //ifex _Use13==0
            DECLARE_TEXT_VARS(13)
            //endex
            //ifex _Use14==0
            DECLARE_TEXT_VARS(14)
            //endex
            //ifex _Use15==0
            DECLARE_TEXT_VARS(15)
            //endex
            //ifex _Use16==0
            DECLARE_TEXT_VARS(16)
            //endex
            //ifex _Use17==0
            DECLARE_TEXT_VARS(17)
            //endex
            //ifex _Use18==0
            DECLARE_TEXT_VARS(18)
            //endex
            //ifex _Use19==0
            DECLARE_TEXT_VARS(19)
            //endex
            //ifex _Use20==0
            DECLARE_TEXT_VARS(20)
            //endex
            //ifex _Use21==0
            DECLARE_TEXT_VARS(21)
            //endex
            //ifex _Use22==0
            DECLARE_TEXT_VARS(22)
            //endex
            //ifex _Use23==0
            DECLARE_TEXT_VARS(23)
            //endex
            //ifex _Use24==0
            DECLARE_TEXT_VARS(24)
            //endex
            //ifex _Use25==0
            DECLARE_TEXT_VARS(25)
            //endex
            //ifex _Use26==0
            DECLARE_TEXT_VARS(26)
            //endex
            //ifex _Use27==0
            DECLARE_TEXT_VARS(27)
            //endex
            //ifex _Use28==0
            DECLARE_TEXT_VARS(28)
            //endex
            //ifex _Use29==0
            DECLARE_TEXT_VARS(29)
            //endex
            //ifex _Use30==0
            DECLARE_TEXT_VARS(30)
            //endex
            //ifex _Use31==0
            DECLARE_TEXT_VARS(31)
            //endex

            // ============================================================================
            // Vertex Shader (uses PROCESS_TEXT from Macros.hlsl)
            // ============================================================================
            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.vertex = float4(0, 0, -1, 1);
                o.glyph_uv = v.uv2;
                o.char_index = 0;
                o.packed_info = (2u << 8) | (8u << 16);  // default: R2 dither, 8 samples
                o.anim_packed = uint2(pack_f16x2(0.0, 0.0), pack_f16x2(0.0, 1.0));  // opacity=0, shake=0, block_fade=1
                o.quad_packed = pack_f16x2(1.0, 1.0);  // quad_padding=1, rcp_sample=1
                o.text_color = pack_f16x4(float4(1, 1, 1, 1));
                o.outline = uint2(0, 0);
                o.shadow = uint2(0, 0);
                o.shadow_color = uint2(0, 0);
                o.texturing = uint2(0, 0);
                o.world_pos = float3(0, 0, 0);
                o.surface_normal = float3(0, 0, 1);

                // Decode from UV
                int char_pos = (int)floor(v.uv.x * 256.0);
                int text_id = (int)floor(v.uv.y * 32.0);

                // Camera setup (shared)
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                float distance_fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                float3 cam_pos = _CameraPosition.xyz * CM_TO_METER_SCALE;
                float3x3 cam_rot_inv = transpose(rotation_matrix(_CameraRotation.xyz * DEG2_RAD));
                float tan_half_fov = tan(_CameraFOV * DEG2_RAD * 0.5);
                float aspect = get_screen_aspect();
                float vr_scale = get_vr_scale(_VRScale);

                // Load parameters based on text_id
                TextParams p;
                switch(text_id)
                {
                    //ifex _Use0==0
                    case 0: LOAD_TEXT_PARAMS(0, p); break;
                    //endex
                    //ifex _Use1==0
                    case 1: LOAD_TEXT_PARAMS(1, p); break;
                    //endex
                    //ifex _Use2==0
                    case 2: LOAD_TEXT_PARAMS(2, p); break;
                    //endex
                    //ifex _Use3==0
                    case 3: LOAD_TEXT_PARAMS(3, p); break;
                    //endex
                    //ifex _Use4==0
                    case 4: LOAD_TEXT_PARAMS(4, p); break;
                    //endex
                    //ifex _Use5==0
                    case 5: LOAD_TEXT_PARAMS(5, p); break;
                    //endex
                    //ifex _Use6==0
                    case 6: LOAD_TEXT_PARAMS(6, p); break;
                    //endex
                    //ifex _Use7==0
                    case 7: LOAD_TEXT_PARAMS(7, p); break;
                    //endex
                    //ifex _Use8==0
                    case 8: LOAD_TEXT_PARAMS(8, p); break;
                    //endex
                    //ifex _Use9==0
                    case 9: LOAD_TEXT_PARAMS(9, p); break;
                    //endex
                    //ifex _Use10==0
                    case 10: LOAD_TEXT_PARAMS(10, p); break;
                    //endex
                    //ifex _Use11==0
                    case 11: LOAD_TEXT_PARAMS(11, p); break;
                    //endex
                    //ifex _Use12==0
                    case 12: LOAD_TEXT_PARAMS(12, p); break;
                    //endex
                    //ifex _Use13==0
                    case 13: LOAD_TEXT_PARAMS(13, p); break;
                    //endex
                    //ifex _Use14==0
                    case 14: LOAD_TEXT_PARAMS(14, p); break;
                    //endex
                    //ifex _Use15==0
                    case 15: LOAD_TEXT_PARAMS(15, p); break;
                    //endex
                    //ifex _Use16==0
                    case 16: LOAD_TEXT_PARAMS(16, p); break;
                    //endex
                    //ifex _Use17==0
                    case 17: LOAD_TEXT_PARAMS(17, p); break;
                    //endex
                    //ifex _Use18==0
                    case 18: LOAD_TEXT_PARAMS(18, p); break;
                    //endex
                    //ifex _Use19==0
                    case 19: LOAD_TEXT_PARAMS(19, p); break;
                    //endex
                    //ifex _Use20==0
                    case 20: LOAD_TEXT_PARAMS(20, p); break;
                    //endex
                    //ifex _Use21==0
                    case 21: LOAD_TEXT_PARAMS(21, p); break;
                    //endex
                    //ifex _Use22==0
                    case 22: LOAD_TEXT_PARAMS(22, p); break;
                    //endex
                    //ifex _Use23==0
                    case 23: LOAD_TEXT_PARAMS(23, p); break;
                    //endex
                    //ifex _Use24==0
                    case 24: LOAD_TEXT_PARAMS(24, p); break;
                    //endex
                    //ifex _Use25==0
                    case 25: LOAD_TEXT_PARAMS(25, p); break;
                    //endex
                    //ifex _Use26==0
                    case 26: LOAD_TEXT_PARAMS(26, p); break;
                    //endex
                    //ifex _Use27==0
                    case 27: LOAD_TEXT_PARAMS(27, p); break;
                    //endex
                    //ifex _Use28==0
                    case 28: LOAD_TEXT_PARAMS(28, p); break;
                    //endex
                    //ifex _Use29==0
                    case 29: LOAD_TEXT_PARAMS(29, p); break;
                    //endex
                    //ifex _Use30==0
                    case 30: LOAD_TEXT_PARAMS(30, p); break;
                    //endex
                    //ifex _Use31==0
                    case 31: LOAD_TEXT_PARAMS(31, p); break;
                    //endex
                    default: break;
                }

                // Process text (returns false if culled/disabled)
                if (!process_text(o, v.uv2, char_pos, p, text_id, cam_pos, cam_rot_inv, tan_half_fov, aspect, vr_scale, _QuadPadding, _DFC, _DataTexture, _DataTexture_TexelSize))
                {
                    o.vertex = float4(0, 0, -1, 1);
                    return o;
                }

                // Apply distance-based fade to packed opacity_mult
                float2 anim_xy = unpack_f16x2(o.anim_packed.x);
                anim_xy.x *= distance_fade;
                o.anim_packed.x = pack_f16x2(anim_xy.x, anim_xy.y);

                return o;
            }

            // ============================================================================
            // Fragment Shader
            // ============================================================================
            float4 frag(v2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                // Unpack from f16-packed structures (GPU native instructions)
                uint font_index = i.packed_info & 0xFFu;
                float2 anim_xy = unpack_f16x2(i.anim_packed.x);  // opacity_mult, shake.x
                float2 anim_zw = unpack_f16x2(i.anim_packed.y);  // shake.y, block_fade
                float opacity_mult = anim_xy.x;  // Pre-computed (1-anim_factor)*fade in VS
                float2 shake_offset = float2(anim_xy.y, anim_zw.x);
                float block_fade = anim_zw.y;
                float2 quad_unpack = unpack_f16x2(i.quad_packed);
                float quad_padding = quad_unpack.x;
                float rcp_sample_count = quad_unpack.y;  // Pre-computed in VS

                float2 glyph_uv = i.glyph_uv + shake_offset;

                // Pre-compute adjusted_uv and AtlasParams once (optimization: avoids 3x redundant computation)
                float2 adjusted_uv = (glyph_uv - 0.5) * quad_padding + 0.5;
                AtlasParams atlas_params = load_atlas_params();

                half3 accum_color = half3(0, 0, 0);
                half accum_alpha = 0.0;

                // Unpack effect params from f16
                EffectParams params;
                params.text_color = unpack_f16x4(i.text_color);
                float2 outline_width_round = unpack_f16x2(i.outline.x);    // x=width*0.5, y=round
                params.outline = float4(outline_width_round.x, outline_width_round.y, 0, 0);
                uint effective_char_index = i.char_index;
                uint text_id = (i.packed_info >> 19) & 0x1Fu;
                params.outline_color = unpack_f16x4(i.outline_color);
                params.shadow = float4(unpack_f16x2(i.shadow.x), unpack_f16x2(i.shadow.y));
                params.shadow_color = float4(unpack_f16x2(i.shadow_color.x), unpack_f16x2(i.shadow_color.y));

                // Unpack texturing params (MatCap + Texture are independent)
                float2 texturing_xy = unpack_f16x2(i.texturing.x);  // matcap_intensity, matcap_bevel
                float2 texturing_zw = unpack_f16x2(i.texturing.y);  // matcap_blend, texture_intensity
                float matcap_intensity = texturing_xy.x;
                float matcap_bevel = texturing_xy.y;
                float matcap_blend = texturing_zw.x;
                float texture_intensity = texturing_zw.y;
                uint texture_uv_mode = (i.packed_info >> 25) & 0x1u;  // 0=Glyph, 1=World

                // Optimization: Single LUT fetch for both MatCap and Overlay layers
                bool needs_overlay = texture_intensity > EPSILON;
                bool needs_matcap = matcap_intensity > EPSILON;
                int2 layer_indices = int2(-1, -1);  // x=matcap, y=overlay
                if (needs_overlay || needs_matcap)
                {
                    layer_indices = GetTextLayerIndices(text_id);
                }

                // Apply Texture to text_color BEFORE compositing (prevents edge bleeding)
                if (needs_overlay && layer_indices.y >= 0)
                {
                    apply_texture_to_color(params.text_color, adjusted_uv, i.world_pos,
                        (uint)layer_indices.y, texture_intensity, texture_uv_mode);
                }

                MSDFSample msdf;
                apply_effects(accum_color, accum_alpha, msdf, adjusted_uv, atlas_params, effective_char_index, font_index, opacity_mult, params, i.vertex.xy, rcp_sample_count, i.packed_info);

                // Apply MatCap AFTER compositing (reuses MSDF sample from apply_effects)
                // view_dir precomputed in vertex shader for performance
                if (needs_matcap && layer_indices.x >= 0)
                {
                    apply_matcap_effect(accum_color, msdf.sd, msdf.opacity, adjusted_uv,
                        i.view_dir, i.surface_normal,
                        (uint)layer_indices.x,
                        matcap_intensity, matcap_bevel, matcap_blend);
                }

                // Clip based on accumulated alpha (before block fade)
                clip(accum_alpha - _AlphaCutoff);

                // Apply block fade after clip (for smooth Block animation)
                accum_alpha *= block_fade;

                return float4(accum_color, accum_alpha);
            }
            ENDCG
        }

        // ============================================================================
        // Pass 3: Particle Effect
        // ============================================================================
        Pass
        {
            Name "Particles"
            Blend SrcAlpha One
            ZWrite Off
            ZTest LEqual
            Cull Off

            Stencil
            {
                Ref [_ParticleStencilRef]
                ReadMask [_ParticleStencilReadMask]
                WriteMask [_ParticleStencilWriteMask]
                Comp [_ParticleStencilComp]
                Pass [_ParticleStencilPass]
                Fail [_ParticleStencilFail]
                ZFail [_ParticleStencilZFail]
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma geometry geom
            #pragma fragment frag
            #pragma target 4.5
            #pragma require geometry
            #pragma multi_compile_instancing
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"
            #include "Include/Particles.hlsl"

            // Particle Properties (using macro for each particle type)
            DECLARE_PARTICLE_VARS(0)

            // Camera (shared with text pass)
            float4 _CameraPosition;
            float4 _CameraRotation;
            float _CameraFOV;
            float _VRScale;
            float _FadeMin;
            float _FadeMax;

            particle_v2g vert(particle_appdata v)
            {
                particle_v2g o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                o.vertex = v.vertex;
                o.uv = v.uv.xy;
                o.uv2 = v.uv2.xy;
                return o;
            }

            [maxvertexcount(100)]  // 10 scalars (VR stereo) * 100 = 1000 < 1024
            void geom(triangle particle_v2g IN[3], inout TriangleStream<particle_g2f> stream)
            {
                UNITY_SETUP_INSTANCE_ID(IN[0]);

                // Triangle filtering: skip second triangle of each quad
                float2 uv2_avg = (IN[0].uv2 + IN[1].uv2 + IN[2].uv2) / 3;
                if (uv2_avg.x + uv2_avg.y > 1.0) return;

                // Camera setup (shared)
                float vr_scale = is_vr() ? _VRScale : 1.0;
                float3 cam_pos = _CameraPosition.xyz * CM_TO_METER_SCALE;  // No vr_scale here
                float3x3 cam_rot_inv = transpose(rotation_matrix(_CameraRotation.xyz * DEG2_RAD));
                float tan_half_fov = tan(_CameraFOV * DEG2_RAD * 0.5);
                float aspect = get_screen_aspect();

                // Distance fade (same as text pass)
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                float distance_fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                // Particle ID from mesh UV
                float2 avg_uv = (IN[0].uv + IN[1].uv + IN[2].uv) / 3;
                int char_pos = (int)floor(avg_uv.x * 256.0);
                int text_id = (int)floor(avg_uv.y * 32.0);
                float2 base_uv = float2(char_pos, text_id);

                particle_g2f o;
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                // Process each particle type using macro
                PROCESS_PARTICLE(0, base_uv, cam_pos, cam_rot_inv, tan_half_fov, aspect, vr_scale, distance_fade, stream, o)
            }

            half4 frag(particle_g2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                // Unpack from uint2: x=shape+hollow+colorMul, y=age+distFade(f16)
                half2 uv = (half2)i.uv;
                int shape = (int)(i.packed.x & 0xFFu);
                half hollow = (half)((i.packed.x >> 8) & 0xFFu) * (half)(1.0 / 255.0);
                half colorMul = (half)((i.packed.x >> 16) & 0xFFFFu) * (half)(1.0 / 65535.0);
                half age = (half)f16tof32(i.packed.y);
                half distFade = (half)f16tof32(i.packed.y >> 16);

                // Sample gradient texture using age (0=birth, 1=death) - Point sampling for performance
                half4 color = tex2Dlod(_Particle0Gradient, float4(age, 0.5, 0, 0));

                // half precision SDF evaluation (ALU 50% reduction on mobile/some desktop)
                half d = (half)eval_shape(uv, shape);

                // Hollow transform: convert solid to ring (1 = disabled, < 1 = hollow)
                [branch]
                if (hollow < (half)1)
                {
                    half half_w = hollow * (half)0.5;
                    d = abs(d - ((half)1.0 - half_w)) / half_w;
                }

                clip((half)1 - d);

                // half precision color calculations (native on mobile, ~50% ALU on desktop RDNA/Ampere)
                // rsqrt optimization: sqrt(x) = x * rsqrt(x), rsqrt is native ~1 cycle
                half brightness = (half)1.5 - d;
                half3 col = color.rgb * colorMul;
                col *= brightness * rsqrt(brightness) * (half)2;  // sqrt(1.5-d)*2 using rsqrt
                col = saturate(col);

                // Fast gamma 2.2 approximation
                col = col * col * (col * (half)0.305 + (half)0.695);

                return half4(col, smoothstep((half)1, (half)0.8, d) * color.a * distFade);
            }
            ENDCG
        }
    }
}
