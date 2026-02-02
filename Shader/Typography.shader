Shader "GekikaraStore/x.x.x/Typography"
{
    Properties
    {
        [HideInInspector] shader_is_using_thry_editor("", Float) = 0
        [HideInInspector] GeometryShader_Enabled ("", Float) = 1
        [HideInInspector] shader_master_label("<b><i><color=#858585>T</color><color=#9D9D9D>y</color><color=#B5B5B5>p</color><color=#CECECE>o</color><color=#E6E6E6>g</color><color=#FFFFFF>r</color><color=#E6E6E6>a</color><color=#CECECE>p</color><color=#B5B5B5>h</color><color=#9D9D9D>y</color></i></b>", Float) = 0
        [ThryShaderOptimizerLockButton] _ShaderOptimizerEnabled ("", Int) = 0
        [HideInInspector] _DFC ("Debug Frustum Culling", Float) = 0

        [Project] _Project ("Project", Int) = 0

        [HideInInspector] m_start_camera_setting ("Camera Settings", Float) = 0
            [Vector3] _CameraPosition ("Position", Vector) = (0, 0, 0, 0)
            [Vector3] _CameraRotation ("Rotation", Vector) = (0, 0, 0, 0)
            _CameraFOV ("FOV", Range(10, 120)) = 60.0
            _VRFOV ("VR FOV", Range(10, 120)) = 110.0
        [HideInInspector] m_end_camera_setting ("Camera Settings", Float) = 0
        
        [HideInInspector] m_start_root_setting ("Root Transforms", Float) = 0
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

        [HideInInspector][Toggle] _ImagePassUse ("", Float) = 0
        [HideInInspector] m_start_image_pass ("Image Pass--{reference_property:_ImagePassUse}", Float) = 0

            [HideInInspector][Toggle] _ImageUse0 ("", Float) = 0
            [HideInInspector] m_start_image_pass0 (" --{reference_property:_ImageUse0}", Float) = 0
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
            [HideInInspector] m_end_image_pass0 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel0 ("Image 0", Int) = 0

            [HideInInspector][Toggle] _ImageUse1 ("", Float) = 0
            [HideInInspector] m_start_image_pass1 (" --{reference_property:_ImageUse1}", Float) = 0
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
            [HideInInspector] m_end_image_pass1 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel1 ("Image 1", Int) = 0

            [HideInInspector][Toggle] _ImageUse2 ("", Float) = 0
            [HideInInspector] m_start_image_pass2 (" --{reference_property:_ImageUse2}", Float) = 0
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
            [HideInInspector] m_end_image_pass2 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel2 ("Image 2", Int) = 0

            [HideInInspector][Toggle] _ImageUse3 ("", Float) = 0
            [HideInInspector] m_start_image_pass3 (" --{reference_property:_ImageUse3}", Float) = 0
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
            [HideInInspector] m_end_image_pass3 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel3 ("Image 3", Int) = 0

            [HideInInspector][Toggle] _ImageUse4 ("", Float) = 0
            [HideInInspector] m_start_image_pass4 (" --{reference_property:_ImageUse4}", Float) = 0
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
            [HideInInspector] m_end_image_pass4 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel4 ("Image 4", Int) = 0

            [HideInInspector][Toggle] _ImageUse5 ("", Float) = 0
            [HideInInspector] m_start_image_pass5 (" --{reference_property:_ImageUse5}", Float) = 0
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
            [HideInInspector] m_end_image_pass5 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel5 ("Image 5", Int) = 0

            [HideInInspector][Toggle] _ImageUse6 ("", Float) = 0
            [HideInInspector] m_start_image_pass6 (" --{reference_property:_ImageUse6}", Float) = 0
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
            [HideInInspector] m_end_image_pass6 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel6 ("Image 6", Int) = 0

            [HideInInspector][Toggle] _ImageUse7 ("", Float) = 0
            [HideInInspector] m_start_image_pass7 (" --{reference_property:_ImageUse7}", Float) = 0
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
            [HideInInspector] m_end_image_pass7 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel7 ("Image 7", Int) = 0

            [HideInInspector][Toggle] _ImageUse8 ("", Float) = 0
            [HideInInspector] m_start_image_pass8 (" --{reference_property:_ImageUse8}", Float) = 0
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
            [HideInInspector] m_end_image_pass8 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel8 ("Image 8", Int) = 0

            [HideInInspector][Toggle] _ImageUse9 ("", Float) = 0
            [HideInInspector] m_start_image_pass9 (" --{reference_property:_ImageUse9}", Float) = 0
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
            [HideInInspector] m_end_image_pass9 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel9 ("Image 9", Int) = 0
        [HideInInspector] m_end_image_pass ("Image Pass", Float) = 0
        
        [HideInInspector][Toggle] _TextPassUse ("", Float) = 0
        [HideInInspector] m_start_text_pass ("Text Pass--{reference_property:_TextPassUse}", Float) = 0
            [Fonts] _Fonts ("Fonts", Int) = 0
            [HideInInspector][Toggle] _Use0 ("", Float) = 0
            [HideInInspector] m_start_text_pass0 (" --{reference_property:_Use0}", Float) = 0
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
                        _TypewriterSmooth0 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow0 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity0 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness0 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset0 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor0 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow0 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise0 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode0 ("Mode", Int) = 0
                        _SurfaceIntensity0 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale0 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed0 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor0 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend0 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise0 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect0 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass0 ("", Float) = 0
            [DynamicThryLabel] _TextLabel0 ("TextLabel0", Int) = 0

            [HideInInspector][Toggle] _Use1 ("", Float) = 0
            [HideInInspector] m_start_text_pass1 (" --{reference_property:_Use1}", Float) = 0
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
                        _TypewriterSmooth1 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow1 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity1 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness1 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset1 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor1 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow1 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise1 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode1 ("Mode", Int) = 0
                        _SurfaceIntensity1 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale1 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed1 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor1 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend1 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise1 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect1 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass1 ("", Float) = 0
            [DynamicThryLabel] _TextLabel1 ("TextLabel1", Int) = 0

            [HideInInspector][Toggle] _Use2 ("", Float) = 0
            [HideInInspector] m_start_text_pass2 (" --{reference_property:_Use2}", Float) = 0
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
                        _TypewriterSmooth2 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow2 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity2 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness2 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset2 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor2 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow2 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise2 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode2 ("Mode", Int) = 0
                        _SurfaceIntensity2 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale2 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed2 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor2 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend2 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise2 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect2 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass2 ("", Float) = 0
            [DynamicThryLabel] _TextLabel2 ("TextLabel2", Int) = 0

            [HideInInspector][Toggle] _Use3 ("", Float) = 0
            [HideInInspector] m_start_text_pass3 (" --{reference_property:_Use3}", Float) = 0
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
                        _TypewriterSmooth3 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow3 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity3 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness3 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset3 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor3 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow3 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise3 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode3 ("Mode", Int) = 0
                        _SurfaceIntensity3 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale3 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed3 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor3 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend3 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise3 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect3 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass3 ("", Float) = 0
            [DynamicThryLabel] _TextLabel3 ("TextLabel3", Int) = 0

            [HideInInspector][Toggle] _Use4 ("", Float) = 0
            [HideInInspector] m_start_text_pass4 (" --{reference_property:_Use4}", Float) = 0
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
                        _TypewriterSmooth4 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow4 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity4 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness4 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset4 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor4 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow4 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise4 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode4 ("Mode", Int) = 0
                        _SurfaceIntensity4 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale4 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed4 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor4 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend4 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise4 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect4 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass4 ("", Float) = 0
            [DynamicThryLabel] _TextLabel4 ("TextLabel4", Int) = 0

            [HideInInspector][Toggle] _Use5 ("", Float) = 0
            [HideInInspector] m_start_text_pass5 (" --{reference_property:_Use5}", Float) = 0
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
                        _TypewriterSmooth5 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow5 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity5 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness5 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset5 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor5 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow5 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise5 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode5 ("Mode", Int) = 0
                        _SurfaceIntensity5 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale5 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed5 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor5 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend5 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise5 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect5 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass5 ("", Float) = 0
            [DynamicThryLabel] _TextLabel5 ("TextLabel5", Int) = 0

            [HideInInspector][Toggle] _Use6 ("", Float) = 0
            [HideInInspector] m_start_text_pass6 (" --{reference_property:_Use6}", Float) = 0
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
                        _TypewriterSmooth6 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow6 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity6 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness6 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset6 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor6 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow6 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise6 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode6 ("Mode", Int) = 0
                        _SurfaceIntensity6 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale6 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed6 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor6 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend6 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise6 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect6 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass6 ("", Float) = 0
            [DynamicThryLabel] _TextLabel6 ("TextLabel6", Int) = 0

            [HideInInspector][Toggle] _Use7 ("", Float) = 0
            [HideInInspector] m_start_text_pass7 (" --{reference_property:_Use7}", Float) = 0
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
                        _TypewriterSmooth7 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow7 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity7 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness7 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset7 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor7 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow7 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise7 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode7 ("Mode", Int) = 0
                        _SurfaceIntensity7 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale7 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed7 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor7 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend7 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise7 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect7 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass7 ("", Float) = 0
            [DynamicThryLabel] _TextLabel7 ("TextLabel7", Int) = 0

            [HideInInspector][Toggle] _Use8 ("", Float) = 0
            [HideInInspector] m_start_text_pass8 (" --{reference_property:_Use8}", Float) = 0
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
                        _TypewriterSmooth8 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow8 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity8 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness8 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset8 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor8 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow8 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise8 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode8 ("Mode", Int) = 0
                        _SurfaceIntensity8 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale8 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed8 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor8 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend8 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise8 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect8 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass8 ("", Float) = 0
            [DynamicThryLabel] _TextLabel8 ("TextLabel8", Int) = 0

            [HideInInspector][Toggle] _Use9 ("", Float) = 0
            [HideInInspector] m_start_text_pass9 (" --{reference_property:_Use9}", Float) = 0
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
                        _TypewriterSmooth9 ("Fade Width", Range(0, 32)) = 4
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

                    [HideInInspector] m_start_shadow_glow9 ("Shadow & Glow", Float) = 0
                        _ShadowIntensity9 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness9 ("Softness", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset9 ("Offset", Vector) = (0, 0, 0, 0)
                        [HDR]_ShadowColor9 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow_glow9 ("Shadow & Glow", Float) = 0

                    [HideInInspector] m_start_fractal_noise9 ("Fractal Noise", Float) = 0
                        [Enum(Simplex, 0, Curl, 1, FBM, 2, Turbulence, 3, Ridged, 4, Marble, 5)] _SurfaceMode9 ("Mode", Int) = 0
                        _SurfaceIntensity9 ("Intensity", Range(0, 1)) = 0
                        _SurfaceScale9 ("Scale", Range(0.5, 3)) = 1
                        _SurfaceSpeed9 ("Speed", Range(0, 1)) = 0.1
                        [HDR]_SurfaceColor9 ("Color", Color) = (1, 1, 1, 1)
                        [Enum(Multiply, 0, Replace, 1, Add, 2)] _SurfaceBlend9 ("Blend", Int) = 0
                    [HideInInspector] m_end_fractal_noise9 ("Fractal Noise", Float) = 0

                [HideInInspector] m_end_effect9 ("Effector", Float) = 0
            [HideInInspector] m_end_text_pass9 ("", Float) = 0
            [DynamicThryLabel] _TextLabel9 ("TextLabel9", Int) = 0
        [HideInInspector] m_end_text_pass ("Text Pass", Float) = 0

        [HideInInspector][Toggle] _ParticlePassUse ("", Float) = 0
        [HideInInspector] m_start_particle_pass ("Particle Pass--{reference_property:_ParticlePassUse}", Float) = 0
            [Toggle] _Particle0Use ("Use", Float) = 0
            [Enum(Screen,0,World,1)] _Particle0Space ("Space", Int) = 0
            [Enum(Sphere,0,Cube,1)] _Particle0Distribution ("Distribution", Int) = 0
            [HideInInspector] m_start_particle_0_shape ("Shape", Float) = 1
                [Enum(Circle,0,Square,1,Triangle,2,Cross,3,Random,4)] _Particle0Shape ("Shape", Int) = 0
                [Gradient] _Particle0Gradient ("Gradient", 2D) = "white" {}
                [MultiSlider]_Particle0Size ("Size (Start, End)", Vector) = (0, 1, 0, 1)
                [Vector3] _Particle0Rotation ("Rotation", Vector) = (0, 0, 0, 0)
                _Particle0Hollow ("Hollow", Range(0.1, 1)) = 1
            [HideInInspector] m_end_particle_0_shape ("", Float) = 0
            [HideInInspector] m_start_particle_0_motion ("Motion", Float) = 0
                _Particle0Seed ("Seed", Float) = 0
                _Particle0Speed ("Speed", Float) = 0.2
                _Particle0Lifetime ("Lifetime", Float) = 1.0
                [Vector3] _Particle0Direction ("Direction", Vector) = (0, 0, 0, 0)
                [Vector3] _Particle0Gravity ("Gravity", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_particle_0_motion ("", Float) = 0
            [HideInInspector] m_start_particle_0_transform ("Transform", Float) = 0
                [Vector3] _Particle0Position ("Position", Vector) = (0, 0, 0, 0)
                [Vector3] _Particle0Scale ("Scale", Vector) = (3, 3, 3, 0)
            [HideInInspector] m_end_particle_0_transform ("", Float) = 0
        [HideInInspector] m_end_particle_pass ("Particle Pass", Float) = 0

        [HideInInspector][Toggle] _FXPassUse ("", Float) = 0
        [HideInInspector] m_start_fx_pass ("FX Pass--{reference_property:_FXPassUse}", Float) = 0
        [HideInInspector] m_end_fx_pass ("FX Pass", Float) = 0

        [HideInInspector] m_start_rendering_settings ("Rendering Settings", Float) = 0
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
            [HideInInspector] m_end_utility_settings ("Utility", Float) = 0

            [HideInInspector] m_start_internal_settings ("Internal", Float) = 0
                    _FontTextureArray ("Font Texture Array", 2DArray) = "" {}
                    _TextureArray ("Texture Array (Image)", 2DArray) = "" {}
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

        //ifex _ImagePassUse==0
        // ====================================================================
        // Pass 0: Images
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
            float _VRFOV;
            float _FadeMin;
            float _FadeMax;
            float _AlphaCutoff;
            float _ImagePassUse;

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

            // Combined texture array for Image pass
            UNITY_DECLARE_TEX2DARRAY(_TextureArray);

            // Image Pipeline Dependencies
            #include "Core.hlsl"
            #include "Systems.hlsl"
            #include "Pipelines/ImagePipeline.hlsl"

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

                //ifex _ImagePassUse==1
                if (!_ImagePassUse) return o;
                //endex

                // Pass detection: Image = uv.y < 0.001 && vertex.xyz == 0 && uv2.x >= 0
                if (v.uv.y > 0.001 || any(v.vertex.xyz != 0) || v.uv2.x < 0) return o;

                uint image_id = (uint)(v.uv.x * 32.0);

                // Compute shared values once (camera, distance fade)
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                float fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                float3 cam_pos = apply_vr_eye_offset(_CameraPosition.xyz * CM_TO_METER_SCALE);
                float3x3 cam_rot_inv = transpose(rotation_matrix(_CameraRotation.xyz * DEG2_RAD));
                float fov = is_vr() ? _VRFOV : _CameraFOV;
                float tan_half_fov = tan(fov * DEG2_RAD * 0.5);
                float aspect = get_screen_aspect();

                // Pack fade (image_id set by process_image)
                o.fade_id_packed = f32tof16(fade);

                // Load layer based on image_id
                ImageLayer layer = (ImageLayer)0;
                switch(image_id)
                {
                    case 0: LOAD_IMAGE_LAYER(0, layer); break;
                    case 1: LOAD_IMAGE_LAYER(1, layer); break;
                    case 2: LOAD_IMAGE_LAYER(2, layer); break;
                    case 3: LOAD_IMAGE_LAYER(3, layer); break;
                    case 4: LOAD_IMAGE_LAYER(4, layer); break;
                    case 5: LOAD_IMAGE_LAYER(5, layer); break;
                    case 6: LOAD_IMAGE_LAYER(6, layer); break;
                    case 7: LOAD_IMAGE_LAYER(7, layer); break;
                    case 8: LOAD_IMAGE_LAYER(8, layer); break;
                    default: LOAD_IMAGE_LAYER(9, layer); break;
                }

                // Process image (returns false if culled/disabled)
                if (!process_image(o, v.uv2, layer, image_id, cam_pos, cam_rot_inv, tan_half_fov, aspect))
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
        //endex

        //ifex _TextPassUse==0
        // ====================================================================
        // Pass 1: Text
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

            // Combined texture array (Image/Overlay - 96 layers)
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
            float _VRFOV;

            // Debug
            float _DFC;

            // Fade, Alpha Cutoff, Quad Padding
            float _AlphaCutoff;
            float _FadeMin;
            float _FadeMax;
            float _QuadPadding;
            float _TextPassUse;

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

            // Text Pipeline Dependencies
            #include "Core.hlsl"
            #include "Effects.hlsl"
            #include "Components.hlsl"
            #include "Systems.hlsl"
            #include "Pipelines/TextPipeline.hlsl"
            
            DECLARE_TEXT_LAYER_VARS(0)
            DECLARE_TEXT_LAYER_VARS(1)
            DECLARE_TEXT_LAYER_VARS(2)
            DECLARE_TEXT_LAYER_VARS(3)
            DECLARE_TEXT_LAYER_VARS(4)
            DECLARE_TEXT_LAYER_VARS(5)
            DECLARE_TEXT_LAYER_VARS(6)
            DECLARE_TEXT_LAYER_VARS(7)
            DECLARE_TEXT_LAYER_VARS(8)
            DECLARE_TEXT_LAYER_VARS(9)
            
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
                o.char_packed = uint4(0, 0, pack_f16x2(1, 1), pack_f16x2(1, 1));  // white
                o.outline_packed = uint4(0, 0, 0, 0);
                o.shadow_packed = uint4(0, 0, 0, 0);
                o.noise_packed = uint4(0, 0, 0, 0);
                o.anim_packed = uint2(pack_f16x2(0.0, 0.0), pack_f16x2(0.0, 1.0));  // opacity=0, shake=0, block_fade=1

                //ifex _TextPassUse==1
                if (!_TextPassUse) return o;
                //endex

                // Pass detection: Text = uv.y > 0.001 && vertex.xyz == 0 && uv2.x >= 0
                if (v.uv.y < 0.001 || any(v.vertex.xyz != 0) || v.uv2.x < 0) return o;

                // Decode from UV
                int char_pos = (int)floor(v.uv.x * 256.0);
                int text_id = (int)floor(v.uv.y * 32.0);

                // Camera setup (shared)
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                float distance_fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                float3 cam_pos = apply_vr_eye_offset(_CameraPosition.xyz * CM_TO_METER_SCALE);
                float3x3 cam_rot_inv = transpose(rotation_matrix(_CameraRotation.xyz * DEG2_RAD));
                float fov = is_vr() ? _VRFOV : _CameraFOV;
                float tan_half_fov = tan(fov * DEG2_RAD * 0.5);
                float aspect = get_screen_aspect();

                // Load layer based on text_id
                TextLayer layer = (TextLayer)0;
                switch(text_id)
                {
                    case 0: LOAD_TEXT_LAYER(0, layer); break;
                    case 1: LOAD_TEXT_LAYER(1, layer); break;
                    case 2: LOAD_TEXT_LAYER(2, layer); break;
                    case 3: LOAD_TEXT_LAYER(3, layer); break;
                    case 4: LOAD_TEXT_LAYER(4, layer); break;
                    case 5: LOAD_TEXT_LAYER(5, layer); break;
                    case 6: LOAD_TEXT_LAYER(6, layer); break;
                    case 7: LOAD_TEXT_LAYER(7, layer); break;
                    case 8: LOAD_TEXT_LAYER(8, layer); break;
                    case 9: LOAD_TEXT_LAYER(9, layer); break;
                    default: break;
                }

                // Process text (returns false if culled/disabled)
                if (!process_text(o, v.uv2, char_pos, layer, text_id, cam_pos, cam_rot_inv, tan_half_fov, aspect, _QuadPadding, _DFC, _DataTexture, _DataTexture_TexelSize))
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

                // Unpack char_packed: char_index, packed_info, color.rg, color.ba
                uint char_index = i.char_packed.x;
                uint packed_info = i.char_packed.y;
                uint font_index = UNPACK_FONT_INDEX(packed_info);

                // Unpack anim_packed
                float2 anim_xy = unpack_f16x2(i.anim_packed.x);
                float2 anim_zw = unpack_f16x2(i.anim_packed.y);
                float opacity_mult = anim_xy.x;
                float2 shake_offset = float2(anim_xy.y, anim_zw.x);
                float block_fade = anim_zw.y;

                // quad_padding from uniform (no v2f overhead)
                float quad_padding = 1.0 + _QuadPadding;

                float2 glyph_uv = i.glyph_uv + shake_offset;
                float2 adjusted_uv = (glyph_uv - 0.5) * quad_padding + 0.5;
                AtlasParams atlas_params = load_atlas_params();

                half3 accum_color = half3(0, 0, 0);
                half accum_alpha = 0.0;

                // Unpack text_color from char_packed.zw
                float2 text_rg = unpack_f16x2(i.char_packed.z);
                float2 text_ba = unpack_f16x2(i.char_packed.w);

                // Unpack outline_packed: width|round, _, color.rg, color.ba
                float2 outline_params = unpack_f16x2(i.outline_packed.x);
                float2 outline_rg = unpack_f16x2(i.outline_packed.z);
                float2 outline_ba = unpack_f16x2(i.outline_packed.w);

                // Build effect params
                EffectParams params;
                params.text_color = float4(text_rg.x, text_rg.y, text_ba.x, text_ba.y);
                params.outline = float4(outline_params.x, outline_params.y, 0, 0);
                params.outline_color = float4(outline_rg.x, outline_rg.y, outline_ba.x, outline_ba.y);

                // Unpack shadow_packed: intensity|soft, offset.xy, color.rg, color.ba
                float2 shadow_params = unpack_f16x2(i.shadow_packed.x);
                float2 shadow_offset = unpack_f16x2(i.shadow_packed.y);
                float2 shadow_rg = unpack_f16x2(i.shadow_packed.z);
                float2 shadow_ba = unpack_f16x2(i.shadow_packed.w);
                params.shadow = float4(shadow_params.x, shadow_offset.x, shadow_offset.y, shadow_params.y);
                params.shadow_color = float4(shadow_rg.x, shadow_rg.y, shadow_ba.x, 1);

                // Unpack noise_packed: intensity|scale, speed|char_offset, color.rg, color.ba
                float2 noise_params = unpack_f16x2(i.noise_packed.x);
                float2 noise_speed_offset = unpack_f16x2(i.noise_packed.y);
                float2 noise_rg = unpack_f16x2(i.noise_packed.z);
                float2 noise_ba = unpack_f16x2(i.noise_packed.w);
                float noise_intensity = noise_params.x;
                float noise_scale = noise_params.y;
                float noise_speed = noise_speed_offset.x;
                float char_offset = noise_speed_offset.y;
                float3 noise_color = float3(noise_rg.x, noise_rg.y, noise_ba.x);
                uint noise_mode = UNPACK_NOISE_MODE(packed_info);
                uint noise_blend_mode = UNPACK_BLEND_MODE(packed_info);

                MSDFSample msdf;
                apply_effects(accum_color, accum_alpha, msdf, adjusted_uv, atlas_params, char_index, font_index, opacity_mult, params, packed_info);

                // Apply procedural noise effect AFTER main compositing
                apply_noise_effect(accum_color, msdf.opacity * opacity_mult, adjusted_uv, char_offset,
                    _Time.y, noise_mode, noise_intensity, noise_scale, noise_speed,
                    noise_color, noise_blend_mode);

                clip(accum_alpha - _AlphaCutoff);
                accum_alpha *= block_fade;

                return float4(accum_color, accum_alpha);
            }
            ENDCG
        }
        //endex

        //ifex _ParticlePassUse==0
        // ============================================================================
        // Pass 2: Particle Effect (VS Expansion - No Geometry Shader)
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
            #pragma vertex particle_vert
            #pragma fragment particle_frag
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"

            // Particle Pipeline Dependencies
            #include "Core.hlsl"
            #include "Components.hlsl"
            #include "Systems.hlsl"
            #include "Pipelines/ParticlePipeline.hlsl"

            // Particle Properties (using macro for each particle type)
            DECLARE_PARTICLE_LAYER_VARS(0)

            // Camera (shared with text pass)
            float4 _CameraPosition;
            float4 _CameraRotation;
            float _CameraFOV;
            float _VRFOV;
            float _FadeMin;
            float _FadeMax;
            float _ParticlePassUse;

            particle_v2f particle_vert(particle_appdata v)
            {
                UNITY_SETUP_INSTANCE_ID(v);

                // Pass detection: Particle = vertex.xyz != 0
                particle_v2f cull_out;
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(cull_out);
                cull_out.vertex = float4(0, 0, -1, 1);
                cull_out.uv = float2(0, 0);
                cull_out.packed = uint2(0, 0);
                if (!any(v.vertex.xyz != 0)) return cull_out;

                //ifex _ParticlePassUse==1
                if (!_ParticlePassUse) return cull_out;
                //endex

                // Camera setup
                float3 cam_pos = apply_vr_eye_offset(_CameraPosition.xyz * CM_TO_METER_SCALE);
                float3x3 cam_rot_inv = transpose(rotation_matrix(_CameraRotation.xyz * DEG2_RAD));
                float fov = is_vr() ? _VRFOV : _CameraFOV;
                float tan_half_fov = tan(fov * DEG2_RAD * 0.5);
                float aspect = get_screen_aspect();

                // Distance fade
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                float distance_fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                // Load particle layer
                ParticleLayer layer = (ParticleLayer)0;
                LOAD_PARTICLE_LAYER(0, layer)

                return process_particle_vs(v, layer, cam_pos, cam_rot_inv, tan_half_fov, aspect, distance_fade);
            }

            half4 particle_frag(particle_v2f i) : SV_Target
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
        //endex

        //ifex _FXPassUse==0
        // ============================================================================
        // GrabPass: Capture screen for FX Pass
        // ============================================================================
        GrabPass { "_TypographyFXPassGrabTexture" }

        // ============================================================================
        // Pass 3: FX (Post-Processing) - Fullscreen Quad from SubMesh 3
        // ============================================================================
        Pass
        {
            Name "FX"
		    ZWrite Off
		    ZTest Off
		    Cull Front
		    Blend One Zero

            CGPROGRAM
            #pragma vertex fx_vert
            #pragma fragment fx_frag
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"

            sampler2D _TypographyFXPassGrabTexture;
            float _FXPassUse;

            struct fx_appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;   // uv.x < 0 as FX marker
                float2 uv2 : TEXCOORD1;  // Clip space coords (-1,-1) to (1,1)
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct fx_v2f
            {
                float4 vertex : SV_POSITION;
                float4 grabPos : TEXCOORD0;
                UNITY_VERTEX_OUTPUT_STEREO
            };

            fx_v2f fx_vert(fx_appdata v)
            {
                fx_v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                // Pass detection: FX = uv.x < 0
                o.vertex = float4(0, 0, -1, 1);
                o.grabPos = float4(0, 0, 0, 1);
                if (v.uv.x >= 0) return o;

                //ifex _FXPassUse==1
                if (!_FXPassUse) return o;
                //endex

                // Use uv2 as clip space position for fullscreen quad
                o.vertex = float4(v.uv2.xy, 0, 1);
                o.grabPos = ComputeGrabScreenPos(o.vertex);
                return o;
            }

            half4 fx_frag(fx_v2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                float2 uv = i.grabPos.xy / i.grabPos.w;
                return tex2D(_TypographyFXPassGrabTexture, uv);
            }
            ENDCG
        }
        //endex
    }
}
