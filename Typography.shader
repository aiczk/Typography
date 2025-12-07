Shader "GekikaraStore/Typography"
{
    Properties
    {
        [HideInInspector] shader_is_using_thry_editor("", Float) = 0
        [HideInInspector] shader_master_label("<b><i><color=#858585>T</color><color=#9D9D9D>y</color><color=#B5B5B5>p</color><color=#CECECE>o</color><color=#E6E6E6>g</color><color=#FFFFFF>r</color><color=#E6E6E6>a</color><color=#CECECE>p</color><color=#B5B5B5>h</color><color=#9D9D9D>y</color></i></b>", Float) = 0

        [Project] _Project ("Project", Int) = 0
        [HideInInspector] _FontTextureArray ("Font Texture Array", 2DArray) = "" {}
        [HideInInspector] _DataTexture ("Data Texture", 2D) = "" {}
        [HideInInspector] _AtlasSize ("Atlas Size", float) = 32.0

        [HideInInspector] m_start_camera_setting ("Camera Settings", Float) = 0
            [Vector3] _CameraPosition ("Position", Vector) = (0, 0, 0, 0)
            [Vector3] _CameraRotation ("Rotation", Vector) = (0, 0, 0, 0)
            _CameraFOV ("FOV", Range(10, 120)) = 60.0
        [HideInInspector] m_end_camera_setting ("Camera Settings", Float) = 0

        [HideInInspector] m_start_text_setting ("Text Settings", Float) = 0
            [Fonts] _Fonts ("Fonts", Int) = 0

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

            [HideInInspector][Toggle] _Use0 ("", Float) = 1
            [HideInInspector] m_start_text_setting0 (" --{reference_property:_Use0}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex0 ("Root", Int) = 0
                [Toggle] _WorldSpace0 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode0 ("Mode", Int) = 0
                [Content] _TextInput0 ("Text", Int) = 0
                [HideInInspector] _FontIndex0 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture0 ("Image", 2D) = "white" {}
                [IntRange] _Layer0 ("Layer", Range(0, 31)) = 0
                [HDR] _TextColor0 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position0 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation0 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale0 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot0 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator0 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter0 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode0 ("Mode", Int) = 0
                        _TypewriterProgress0 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection0 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation0 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter0 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing0 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path0 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake0 ("Shake", Float) = 0
                        _ShakeAmplitude0 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency0 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend0 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake0 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline0 ("Outline", Float) = 0
                        _OutlineWidth0 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor0 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline0 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow0 ("Drop Shadow", Float) = 0
                        _ShadowIntensity0 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset0 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor0 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow0 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect0 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting0 ("", Float) = 0
            [TextLabel] _TextLabel0 ("TextLabel0", Int) = 0

            [HideInInspector][Toggle] _Use1 ("", Float) = 0
            [HideInInspector] m_start_text_setting1 (" --{reference_property:_Use1}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex1 ("Root", Int) = 0
                [Toggle] _WorldSpace1 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode1 ("Mode", Int) = 0
                [Content] _TextInput1 ("Text", Int) = 0
                [HideInInspector] _FontIndex1 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture1 ("Image", 2D) = "white" {}
                [IntRange] _Layer1 ("Layer", Range(0, 31)) = 1
                [HDR] _TextColor1 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position1 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation1 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale1 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot1 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator1 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter1 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode1 ("Mode", Int) = 0
                        _TypewriterProgress1 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection1 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation1 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter1 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing1 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path1 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake1 ("Shake", Float) = 0
                        _ShakeAmplitude1 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency1 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend1 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake1 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline1 ("Outline", Float) = 0
                        _OutlineWidth1 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor1 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline1 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow1 ("Drop Shadow", Float) = 0
                        _ShadowIntensity1 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset1 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor1 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow1 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect1 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting1 ("", Float) = 0
            [TextLabel] _TextLabel1 ("TextLabel1", Int) = 0

            [HideInInspector][Toggle] _Use2 ("", Float) = 0
            [HideInInspector] m_start_text_setting2 (" --{reference_property:_Use2}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex2 ("Root", Int) = 0
                [Toggle] _WorldSpace2 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode2 ("Mode", Int) = 0
                [Content] _TextInput2 ("Text", Int) = 0
                [HideInInspector] _FontIndex2 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture2 ("Image", 2D) = "white" {}
                [IntRange] _Layer2 ("Layer", Range(0, 31)) = 2
                [HDR] _TextColor2 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position2 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation2 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale2 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot2 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator2 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter2 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode2 ("Mode", Int) = 0
                        _TypewriterProgress2 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection2 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation2 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter2 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing2 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path2 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake2 ("Shake", Float) = 0
                        _ShakeAmplitude2 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency2 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend2 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake2 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline2 ("Outline", Float) = 0
                        _OutlineWidth2 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor2 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline2 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow2 ("Drop Shadow", Float) = 0
                        _ShadowIntensity2 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset2 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor2 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow2 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect2 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting2 ("", Float) = 0
            [TextLabel] _TextLabel2 ("TextLabel2", Int) = 0

            [HideInInspector][Toggle] _Use3 ("", Float) = 0
            [HideInInspector] m_start_text_setting3 (" --{reference_property:_Use3}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex3 ("Root", Int) = 0
                [Toggle] _WorldSpace3 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode3 ("Mode", Int) = 0
                [Content] _TextInput3 ("Text", Int) = 0
                [HideInInspector] _FontIndex3 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture3 ("Image", 2D) = "white" {}
                [IntRange] _Layer3 ("Layer", Range(0, 31)) = 3
                [HDR] _TextColor3 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position3 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation3 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale3 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot3 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator3 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter3 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode3 ("Mode", Int) = 0
                        _TypewriterProgress3 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection3 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation3 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter3 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing3 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path3 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake3 ("Shake", Float) = 0
                        _ShakeAmplitude3 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency3 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend3 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake3 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline3 ("Outline", Float) = 0
                        _OutlineWidth3 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor3 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline3 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow3 ("Drop Shadow", Float) = 0
                        _ShadowIntensity3 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset3 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor3 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow3 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect3 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting3 ("", Float) = 0
            [TextLabel] _TextLabel3 ("TextLabel3", Int) = 0

            [HideInInspector][Toggle] _Use4 ("", Float) = 0
            [HideInInspector] m_start_text_setting4 (" --{reference_property:_Use4}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex4 ("Root", Int) = 0
                [Toggle] _WorldSpace4 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode4 ("Mode", Int) = 0
                [Content] _TextInput4 ("Text", Int) = 0
                [HideInInspector] _FontIndex4 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture4 ("Image", 2D) = "white" {}
                [IntRange] _Layer4 ("Layer", Range(0, 31)) = 4
                [HDR] _TextColor4 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position4 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation4 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale4 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot4 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator4 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter4 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode4 ("Mode", Int) = 0
                        _TypewriterProgress4 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection4 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation4 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter4 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing4 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path4 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake4 ("Shake", Float) = 0
                        _ShakeAmplitude4 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency4 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend4 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake4 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline4 ("Outline", Float) = 0
                        _OutlineWidth4 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor4 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline4 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow4 ("Drop Shadow", Float) = 0
                        _ShadowIntensity4 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset4 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor4 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow4 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect4 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting4 ("", Float) = 0
            [TextLabel] _TextLabel4 ("TextLabel4", Int) = 0

            [HideInInspector][Toggle] _Use5 ("", Float) = 0
            [HideInInspector] m_start_text_setting5 (" --{reference_property:_Use5}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex5 ("Root", Int) = 0
                [Toggle] _WorldSpace5 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode5 ("Mode", Int) = 0
                [Content] _TextInput5 ("Text", Int) = 0
                [HideInInspector] _FontIndex5 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture5 ("Image", 2D) = "white" {}
                [IntRange] _Layer5 ("Layer", Range(0, 31)) = 5
                [HDR] _TextColor5 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position5 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation5 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale5 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot5 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator5 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter5 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode5 ("Mode", Int) = 0
                        _TypewriterProgress5 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection5 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation5 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter5 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing5 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path5 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake5 ("Shake", Float) = 0
                        _ShakeAmplitude5 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency5 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend5 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake5 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline5 ("Outline", Float) = 0
                        _OutlineWidth5 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor5 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline5 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow5 ("Drop Shadow", Float) = 0
                        _ShadowIntensity5 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset5 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor5 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow5 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect5 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting5 ("", Float) = 0
            [TextLabel] _TextLabel5 ("TextLabel5", Int) = 0

            [HideInInspector][Toggle] _Use6 ("", Float) = 0
            [HideInInspector] m_start_text_setting6 (" --{reference_property:_Use6}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex6 ("Root", Int) = 0
                [Toggle] _WorldSpace6 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode6 ("Mode", Int) = 0
                [Content] _TextInput6 ("Text", Int) = 0
                [HideInInspector] _FontIndex6 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture6 ("Image", 2D) = "white" {}
                [IntRange] _Layer6 ("Layer", Range(0, 31)) = 6
                [HDR] _TextColor6 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position6 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation6 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale6 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot6 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator6 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter6 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode6 ("Mode", Int) = 0
                        _TypewriterProgress6 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection6 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation6 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter6 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing6 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path6 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake6 ("Shake", Float) = 0
                        _ShakeAmplitude6 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency6 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend6 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake6 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline6 ("Outline", Float) = 0
                        _OutlineWidth6 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor6 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline6 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow6 ("Drop Shadow", Float) = 0
                        _ShadowIntensity6 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset6 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor6 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow6 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect6 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting6 ("", Float) = 0
            [TextLabel] _TextLabel6 ("TextLabel6", Int) = 0

            [HideInInspector][Toggle] _Use7 ("", Float) = 0
            [HideInInspector] m_start_text_setting7 (" --{reference_property:_Use7}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex7 ("Root", Int) = 0
                [Toggle] _WorldSpace7 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode7 ("Mode", Int) = 0
                [Content] _TextInput7 ("Text", Int) = 0
                [HideInInspector] _FontIndex7 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture7 ("Image", 2D) = "white" {}
                [IntRange] _Layer7 ("Layer", Range(0, 31)) = 7
                [HDR] _TextColor7 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position7 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation7 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale7 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot7 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator7 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter7 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode7 ("Mode", Int) = 0
                        _TypewriterProgress7 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection7 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation7 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter7 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing7 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path7 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake7 ("Shake", Float) = 0
                        _ShakeAmplitude7 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency7 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend7 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake7 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline7 ("Outline", Float) = 0
                        _OutlineWidth7 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor7 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline7 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow7 ("Drop Shadow", Float) = 0
                        _ShadowIntensity7 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset7 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor7 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow7 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect7 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting7 ("", Float) = 0
            [TextLabel] _TextLabel7 ("TextLabel7", Int) = 0

            [HideInInspector][Toggle] _Use8 ("", Float) = 0
            [HideInInspector] m_start_text_setting8 (" --{reference_property:_Use8}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex8 ("Root", Int) = 0
                [Toggle] _WorldSpace8 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode8 ("Mode", Int) = 0
                [Content] _TextInput8 ("Text", Int) = 0
                [HideInInspector] _FontIndex8 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture8 ("Image", 2D) = "white" {}
                [IntRange] _Layer8 ("Layer", Range(0, 31)) = 8
                [HDR] _TextColor8 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position8 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation8 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale8 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot8 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator8 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter8 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode8 ("Mode", Int) = 0
                        _TypewriterProgress8 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection8 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation8 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter8 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing8 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path8 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake8 ("Shake", Float) = 0
                        _ShakeAmplitude8 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency8 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend8 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake8 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline8 ("Outline", Float) = 0
                        _OutlineWidth8 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor8 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline8 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow8 ("Drop Shadow", Float) = 0
                        _ShadowIntensity8 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset8 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor8 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow8 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect8 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting8 ("", Float) = 0
            [TextLabel] _TextLabel8 ("TextLabel8", Int) = 0

            [HideInInspector][Toggle] _Use9 ("", Float) = 0
            [HideInInspector] m_start_text_setting9 (" --{reference_property:_Use9}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex9 ("Root", Int) = 0
                [Toggle] _WorldSpace9 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode9 ("Mode", Int) = 0
                [Content] _TextInput9 ("Text", Int) = 0
                [HideInInspector] _FontIndex9 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture9 ("Image", 2D) = "white" {}
                [IntRange] _Layer9 ("Layer", Range(0, 31)) = 9
                [HDR] _TextColor9 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position9 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation9 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale9 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot9 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator9 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter9 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode9 ("Mode", Int) = 0
                        _TypewriterProgress9 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection9 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation9 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter9 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing9 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path9 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake9 ("Shake", Float) = 0
                        _ShakeAmplitude9 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency9 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend9 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake9 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline9 ("Outline", Float) = 0
                        _OutlineWidth9 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor9 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline9 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow9 ("Drop Shadow", Float) = 0
                        _ShadowIntensity9 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset9 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor9 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow9 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect9 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting9 ("", Float) = 0
            [TextLabel] _TextLabel9 ("TextLabel9", Int) = 0

            [HideInInspector][Toggle] _Use10 ("", Float) = 0
            [HideInInspector] m_start_text_setting10 (" --{reference_property:_Use10}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex10 ("Root", Int) = 0
                [Toggle] _WorldSpace10 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode10 ("Mode", Int) = 0
                [Content] _TextInput10 ("Text", Int) = 0
                [HideInInspector] _FontIndex10 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture10 ("Image", 2D) = "white" {}
                [IntRange] _Layer10 ("Layer", Range(0, 31)) = 10
                [HDR] _TextColor10 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position10 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation10 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale10 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot10 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator10 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter10 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode10 ("Mode", Int) = 0
                        _TypewriterProgress10 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection10 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation10 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter10 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing10 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path10 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake10 ("Shake", Float) = 0
                        _ShakeAmplitude10 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency10 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend10 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake10 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline10 ("Outline", Float) = 0
                        _OutlineWidth10 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor10 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline10 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow10 ("Drop Shadow", Float) = 0
                        _ShadowIntensity10 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset10 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor10 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow10 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect10 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting10 ("", Float) = 0
            [TextLabel] _TextLabel10 ("TextLabel10", Int) = 0

            [HideInInspector][Toggle] _Use11 ("", Float) = 0
            [HideInInspector] m_start_text_setting11 (" --{reference_property:_Use11}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex11 ("Root", Int) = 0
                [Toggle] _WorldSpace11 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode11 ("Mode", Int) = 0
                [Content] _TextInput11 ("Text", Int) = 0
                [HideInInspector] _FontIndex11 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture11 ("Image", 2D) = "white" {}
                [IntRange] _Layer11 ("Layer", Range(0, 31)) = 11
                [HDR] _TextColor11 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position11 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation11 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale11 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot11 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator11 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter11 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode11 ("Mode", Int) = 0
                        _TypewriterProgress11 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection11 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation11 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter11 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing11 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path11 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake11 ("Shake", Float) = 0
                        _ShakeAmplitude11 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency11 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend11 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake11 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline11 ("Outline", Float) = 0
                        _OutlineWidth11 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor11 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline11 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow11 ("Drop Shadow", Float) = 0
                        _ShadowIntensity11 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset11 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor11 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow11 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect11 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting11 ("", Float) = 0
            [TextLabel] _TextLabel11 ("TextLabel11", Int) = 0

            [HideInInspector][Toggle] _Use12 ("", Float) = 0
            [HideInInspector] m_start_text_setting12 (" --{reference_property:_Use12}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex12 ("Root", Int) = 0
                [Toggle] _WorldSpace12 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode12 ("Mode", Int) = 0
                [Content] _TextInput12 ("Text", Int) = 0
                [HideInInspector] _FontIndex12 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture12 ("Image", 2D) = "white" {}
                [IntRange] _Layer12 ("Layer", Range(0, 31)) = 12
                [HDR] _TextColor12 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position12 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation12 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale12 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot12 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator12 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter12 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode12 ("Mode", Int) = 0
                        _TypewriterProgress12 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection12 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation12 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter12 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing12 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path12 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake12 ("Shake", Float) = 0
                        _ShakeAmplitude12 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency12 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend12 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake12 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline12 ("Outline", Float) = 0
                        _OutlineWidth12 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor12 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline12 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow12 ("Drop Shadow", Float) = 0
                        _ShadowIntensity12 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset12 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor12 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow12 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect12 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting12 ("", Float) = 0
            [TextLabel] _TextLabel12 ("TextLabel12", Int) = 0

            [HideInInspector][Toggle] _Use13 ("", Float) = 0
            [HideInInspector] m_start_text_setting13 (" --{reference_property:_Use13}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex13 ("Root", Int) = 0
                [Toggle] _WorldSpace13 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode13 ("Mode", Int) = 0
                [Content] _TextInput13 ("Text", Int) = 0
                [HideInInspector] _FontIndex13 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture13 ("Image", 2D) = "white" {}
                [IntRange] _Layer13 ("Layer", Range(0, 31)) = 13
                [HDR] _TextColor13 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position13 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation13 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale13 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot13 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator13 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter13 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode13 ("Mode", Int) = 0
                        _TypewriterProgress13 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection13 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation13 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter13 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing13 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path13 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake13 ("Shake", Float) = 0
                        _ShakeAmplitude13 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency13 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend13 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake13 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline13 ("Outline", Float) = 0
                        _OutlineWidth13 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor13 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline13 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow13 ("Drop Shadow", Float) = 0
                        _ShadowIntensity13 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset13 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor13 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow13 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect13 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting13 ("", Float) = 0
            [TextLabel] _TextLabel13 ("TextLabel13", Int) = 0

            [HideInInspector][Toggle] _Use14 ("", Float) = 0
            [HideInInspector] m_start_text_setting14 (" --{reference_property:_Use14}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex14 ("Root", Int) = 0
                [Toggle] _WorldSpace14 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode14 ("Mode", Int) = 0
                [Content] _TextInput14 ("Text", Int) = 0
                [HideInInspector] _FontIndex14 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture14 ("Image", 2D) = "white" {}
                [IntRange] _Layer14 ("Layer", Range(0, 31)) = 14
                [HDR] _TextColor14 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position14 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation14 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale14 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot14 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator14 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter14 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode14 ("Mode", Int) = 0
                        _TypewriterProgress14 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection14 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation14 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter14 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing14 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path14 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake14 ("Shake", Float) = 0
                        _ShakeAmplitude14 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency14 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend14 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake14 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline14 ("Outline", Float) = 0
                        _OutlineWidth14 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor14 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline14 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow14 ("Drop Shadow", Float) = 0
                        _ShadowIntensity14 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset14 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor14 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow14 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect14 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting14 ("", Float) = 0
            [TextLabel] _TextLabel14 ("TextLabel14", Int) = 0

            [HideInInspector][Toggle] _Use15 ("", Float) = 0
            [HideInInspector] m_start_text_setting15 (" --{reference_property:_Use15}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex15 ("Root", Int) = 0
                [Toggle] _WorldSpace15 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode15 ("Mode", Int) = 0
                [Content] _TextInput15 ("Text", Int) = 0
                [HideInInspector] _FontIndex15 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture15 ("Image", 2D) = "white" {}
                [IntRange] _Layer15 ("Layer", Range(0, 31)) = 15
                [HDR] _TextColor15 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position15 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation15 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale15 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot15 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator15 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter15 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode15 ("Mode", Int) = 0
                        _TypewriterProgress15 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection15 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation15 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter15 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing15 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path15 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake15 ("Shake", Float) = 0
                        _ShakeAmplitude15 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency15 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend15 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake15 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline15 ("Outline", Float) = 0
                        _OutlineWidth15 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor15 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline15 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow15 ("Drop Shadow", Float) = 0
                        _ShadowIntensity15 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset15 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor15 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow15 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect15 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting15 ("", Float) = 0
            [TextLabel] _TextLabel15 ("TextLabel15", Int) = 0

            [HideInInspector][Toggle] _Use16 ("", Float) = 0
            [HideInInspector] m_start_text_setting16 (" --{reference_property:_Use16}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex16 ("Root", Int) = 0
                [Toggle] _WorldSpace16 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode16 ("Mode", Int) = 0
                [Content] _TextInput16 ("Text", Int) = 0
                [HideInInspector] _FontIndex16 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture16 ("Image", 2D) = "white" {}
                [IntRange] _Layer16 ("Layer", Range(0, 31)) = 16
                [HDR] _TextColor16 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position16 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation16 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale16 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot16 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator16 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter16 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode16 ("Mode", Int) = 0
                        _TypewriterProgress16 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection16 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation16 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter16 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing16 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path16 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake16 ("Shake", Float) = 0
                        _ShakeAmplitude16 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency16 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend16 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake16 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline16 ("Outline", Float) = 0
                        _OutlineWidth16 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor16 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline16 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow16 ("Drop Shadow", Float) = 0
                        _ShadowIntensity16 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset16 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor16 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow16 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect16 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting16 ("", Float) = 0
            [TextLabel] _TextLabel16 ("TextLabel16", Int) = 0

            [HideInInspector][Toggle] _Use17 ("", Float) = 0
            [HideInInspector] m_start_text_setting17 (" --{reference_property:_Use17}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex17 ("Root", Int) = 0
                [Toggle] _WorldSpace17 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode17 ("Mode", Int) = 0
                [Content] _TextInput17 ("Text", Int) = 0
                [HideInInspector] _FontIndex17 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture17 ("Image", 2D) = "white" {}
                [IntRange] _Layer17 ("Layer", Range(0, 31)) = 17
                [HDR] _TextColor17 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position17 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation17 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale17 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot17 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator17 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter17 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode17 ("Mode", Int) = 0
                        _TypewriterProgress17 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection17 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation17 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter17 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing17 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path17 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake17 ("Shake", Float) = 0
                        _ShakeAmplitude17 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency17 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend17 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake17 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline17 ("Outline", Float) = 0
                        _OutlineWidth17 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor17 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline17 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow17 ("Drop Shadow", Float) = 0
                        _ShadowIntensity17 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset17 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor17 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow17 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect17 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting17 ("", Float) = 0
            [TextLabel] _TextLabel17 ("TextLabel17", Int) = 0

            [HideInInspector][Toggle] _Use18 ("", Float) = 0
            [HideInInspector] m_start_text_setting18 (" --{reference_property:_Use18}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex18 ("Root", Int) = 0
                [Toggle] _WorldSpace18 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode18 ("Mode", Int) = 0
                [Content] _TextInput18 ("Text", Int) = 0
                [HideInInspector] _FontIndex18 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture18 ("Image", 2D) = "white" {}
                [IntRange] _Layer18 ("Layer", Range(0, 31)) = 18
                [HDR] _TextColor18 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position18 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation18 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale18 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot18 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator18 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter18 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode18 ("Mode", Int) = 0
                        _TypewriterProgress18 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection18 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation18 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter18 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing18 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path18 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake18 ("Shake", Float) = 0
                        _ShakeAmplitude18 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency18 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend18 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake18 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline18 ("Outline", Float) = 0
                        _OutlineWidth18 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor18 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline18 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow18 ("Drop Shadow", Float) = 0
                        _ShadowIntensity18 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset18 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor18 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow18 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect18 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting18 ("", Float) = 0
            [TextLabel] _TextLabel18 ("TextLabel18", Int) = 0

            [HideInInspector][Toggle] _Use19 ("", Float) = 0
            [HideInInspector] m_start_text_setting19 (" --{reference_property:_Use19}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex19 ("Root", Int) = 0
                [Toggle] _WorldSpace19 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode19 ("Mode", Int) = 0
                [Content] _TextInput19 ("Text", Int) = 0
                [HideInInspector] _FontIndex19 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture19 ("Image", 2D) = "white" {}
                [IntRange] _Layer19 ("Layer", Range(0, 31)) = 19
                [HDR] _TextColor19 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position19 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation19 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale19 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot19 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator19 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter19 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode19 ("Mode", Int) = 0
                        _TypewriterProgress19 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection19 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation19 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter19 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing19 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path19 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake19 ("Shake", Float) = 0
                        _ShakeAmplitude19 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency19 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend19 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake19 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline19 ("Outline", Float) = 0
                        _OutlineWidth19 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor19 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline19 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow19 ("Drop Shadow", Float) = 0
                        _ShadowIntensity19 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset19 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor19 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow19 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect19 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting19 ("", Float) = 0
            [TextLabel] _TextLabel19 ("TextLabel19", Int) = 0

            [HideInInspector][Toggle] _Use20 ("", Float) = 0
            [HideInInspector] m_start_text_setting20 (" --{reference_property:_Use20}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex20 ("Root", Int) = 0
                [Toggle] _WorldSpace20 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode20 ("Mode", Int) = 0
                [Content] _TextInput20 ("Text", Int) = 0
                [HideInInspector] _FontIndex20 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture20 ("Image", 2D) = "white" {}
                [IntRange] _Layer20 ("Layer", Range(0, 31)) = 20
                [HDR] _TextColor20 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position20 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation20 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale20 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot20 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator20 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter20 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode20 ("Mode", Int) = 0
                        _TypewriterProgress20 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection20 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation20 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter20 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing20 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path20 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake20 ("Shake", Float) = 0
                        _ShakeAmplitude20 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency20 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend20 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake20 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline20 ("Outline", Float) = 0
                        _OutlineWidth20 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor20 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline20 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow20 ("Drop Shadow", Float) = 0
                        _ShadowIntensity20 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset20 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor20 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow20 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect20 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting20 ("", Float) = 0
            [TextLabel] _TextLabel20 ("TextLabel20", Int) = 0

            [HideInInspector][Toggle] _Use21 ("", Float) = 0
            [HideInInspector] m_start_text_setting21 (" --{reference_property:_Use21}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex21 ("Root", Int) = 0
                [Toggle] _WorldSpace21 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode21 ("Mode", Int) = 0
                [Content] _TextInput21 ("Text", Int) = 0
                [HideInInspector] _FontIndex21 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture21 ("Image", 2D) = "white" {}
                [IntRange] _Layer21 ("Layer", Range(0, 31)) = 21
                [HDR] _TextColor21 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position21 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation21 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale21 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot21 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator21 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter21 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode21 ("Mode", Int) = 0
                        _TypewriterProgress21 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection21 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation21 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter21 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing21 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path21 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake21 ("Shake", Float) = 0
                        _ShakeAmplitude21 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency21 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend21 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake21 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline21 ("Outline", Float) = 0
                        _OutlineWidth21 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor21 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline21 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow21 ("Drop Shadow", Float) = 0
                        _ShadowIntensity21 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset21 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor21 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow21 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect21 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting21 ("", Float) = 0
            [TextLabel] _TextLabel21 ("TextLabel21", Int) = 0

            [HideInInspector][Toggle] _Use22 ("", Float) = 0
            [HideInInspector] m_start_text_setting22 (" --{reference_property:_Use22}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex22 ("Root", Int) = 0
                [Toggle] _WorldSpace22 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode22 ("Mode", Int) = 0
                [Content] _TextInput22 ("Text", Int) = 0
                [HideInInspector] _FontIndex22 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture22 ("Image", 2D) = "white" {}
                [IntRange] _Layer22 ("Layer", Range(0, 31)) = 22
                [HDR] _TextColor22 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position22 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation22 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale22 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot22 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator22 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter22 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode22 ("Mode", Int) = 0
                        _TypewriterProgress22 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection22 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation22 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter22 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing22 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path22 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake22 ("Shake", Float) = 0
                        _ShakeAmplitude22 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency22 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend22 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake22 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline22 ("Outline", Float) = 0
                        _OutlineWidth22 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor22 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline22 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow22 ("Drop Shadow", Float) = 0
                        _ShadowIntensity22 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset22 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor22 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow22 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect22 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting22 ("", Float) = 0
            [TextLabel] _TextLabel22 ("TextLabel22", Int) = 0

            [HideInInspector][Toggle] _Use23 ("", Float) = 0
            [HideInInspector] m_start_text_setting23 (" --{reference_property:_Use23}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex23 ("Root", Int) = 0
                [Toggle] _WorldSpace23 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode23 ("Mode", Int) = 0
                [Content] _TextInput23 ("Text", Int) = 0
                [HideInInspector] _FontIndex23 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture23 ("Image", 2D) = "white" {}
                [IntRange] _Layer23 ("Layer", Range(0, 31)) = 23
                [HDR] _TextColor23 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position23 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation23 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale23 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot23 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator23 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter23 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode23 ("Mode", Int) = 0
                        _TypewriterProgress23 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection23 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation23 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter23 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing23 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path23 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake23 ("Shake", Float) = 0
                        _ShakeAmplitude23 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency23 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend23 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake23 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline23 ("Outline", Float) = 0
                        _OutlineWidth23 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor23 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline23 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow23 ("Drop Shadow", Float) = 0
                        _ShadowIntensity23 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset23 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor23 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow23 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect23 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting23 ("", Float) = 0
            [TextLabel] _TextLabel23 ("TextLabel23", Int) = 0

            [HideInInspector][Toggle] _Use24 ("", Float) = 0
            [HideInInspector] m_start_text_setting24 (" --{reference_property:_Use24}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex24 ("Root", Int) = 0
                [Toggle] _WorldSpace24 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode24 ("Mode", Int) = 0
                [Content] _TextInput24 ("Text", Int) = 0
                [HideInInspector] _FontIndex24 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture24 ("Image", 2D) = "white" {}
                [IntRange] _Layer24 ("Layer", Range(0, 31)) = 24
                [HDR] _TextColor24 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position24 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation24 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale24 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot24 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator24 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter24 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode24 ("Mode", Int) = 0
                        _TypewriterProgress24 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection24 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation24 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter24 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing24 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path24 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake24 ("Shake", Float) = 0
                        _ShakeAmplitude24 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency24 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend24 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake24 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline24 ("Outline", Float) = 0
                        _OutlineWidth24 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor24 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline24 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow24 ("Drop Shadow", Float) = 0
                        _ShadowIntensity24 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset24 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor24 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow24 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect24 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting24 ("", Float) = 0
            [TextLabel] _TextLabel24 ("TextLabel24", Int) = 0

            [HideInInspector][Toggle] _Use25 ("", Float) = 0
            [HideInInspector] m_start_text_setting25 (" --{reference_property:_Use25}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex25 ("Root", Int) = 0
                [Toggle] _WorldSpace25 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode25 ("Mode", Int) = 0
                [Content] _TextInput25 ("Text", Int) = 0
                [HideInInspector] _FontIndex25 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture25 ("Image", 2D) = "white" {}
                [IntRange] _Layer25 ("Layer", Range(0, 31)) = 25
                [HDR] _TextColor25 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position25 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation25 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale25 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot25 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator25 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter25 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode25 ("Mode", Int) = 0
                        _TypewriterProgress25 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection25 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation25 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter25 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing25 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path25 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake25 ("Shake", Float) = 0
                        _ShakeAmplitude25 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency25 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend25 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake25 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline25 ("Outline", Float) = 0
                        _OutlineWidth25 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor25 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline25 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow25 ("Drop Shadow", Float) = 0
                        _ShadowIntensity25 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset25 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor25 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow25 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect25 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting25 ("", Float) = 0
            [TextLabel] _TextLabel25 ("TextLabel25", Int) = 0

            [HideInInspector][Toggle] _Use26 ("", Float) = 0
            [HideInInspector] m_start_text_setting26 (" --{reference_property:_Use26}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex26 ("Root", Int) = 0
                [Toggle] _WorldSpace26 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode26 ("Mode", Int) = 0
                [Content] _TextInput26 ("Text", Int) = 0
                [HideInInspector] _FontIndex26 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture26 ("Image", 2D) = "white" {}
                [IntRange] _Layer26 ("Layer", Range(0, 31)) = 26
                [HDR] _TextColor26 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position26 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation26 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale26 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot26 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator26 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter26 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode26 ("Mode", Int) = 0
                        _TypewriterProgress26 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection26 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation26 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter26 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing26 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path26 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake26 ("Shake", Float) = 0
                        _ShakeAmplitude26 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency26 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend26 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake26 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline26 ("Outline", Float) = 0
                        _OutlineWidth26 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor26 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline26 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow26 ("Drop Shadow", Float) = 0
                        _ShadowIntensity26 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset26 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor26 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow26 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect26 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting26 ("", Float) = 0
            [TextLabel] _TextLabel26 ("TextLabel26", Int) = 0

            [HideInInspector][Toggle] _Use27 ("", Float) = 0
            [HideInInspector] m_start_text_setting27 (" --{reference_property:_Use27}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex27 ("Root", Int) = 0
                [Toggle] _WorldSpace27 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode27 ("Mode", Int) = 0
                [Content] _TextInput27 ("Text", Int) = 0
                [HideInInspector] _FontIndex27 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture27 ("Image", 2D) = "white" {}
                [IntRange] _Layer27 ("Layer", Range(0, 31)) = 27
                [HDR] _TextColor27 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position27 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation27 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale27 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot27 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator27 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter27 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode27 ("Mode", Int) = 0
                        _TypewriterProgress27 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection27 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation27 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter27 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing27 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path27 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake27 ("Shake", Float) = 0
                        _ShakeAmplitude27 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency27 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend27 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake27 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline27 ("Outline", Float) = 0
                        _OutlineWidth27 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor27 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline27 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow27 ("Drop Shadow", Float) = 0
                        _ShadowIntensity27 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset27 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor27 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow27 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect27 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting27 ("", Float) = 0
            [TextLabel] _TextLabel27 ("TextLabel27", Int) = 0

            [HideInInspector][Toggle] _Use28 ("", Float) = 0
            [HideInInspector] m_start_text_setting28 (" --{reference_property:_Use28}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex28 ("Root", Int) = 0
                [Toggle] _WorldSpace28 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode28 ("Mode", Int) = 0
                [Content] _TextInput28 ("Text", Int) = 0
                [HideInInspector] _FontIndex28 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture28 ("Image", 2D) = "white" {}
                [IntRange] _Layer28 ("Layer", Range(0, 31)) = 28
                [HDR] _TextColor28 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position28 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation28 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale28 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot28 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator28 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter28 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode28 ("Mode", Int) = 0
                        _TypewriterProgress28 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection28 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation28 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter28 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing28 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path28 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake28 ("Shake", Float) = 0
                        _ShakeAmplitude28 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency28 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend28 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake28 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline28 ("Outline", Float) = 0
                        _OutlineWidth28 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor28 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline28 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow28 ("Drop Shadow", Float) = 0
                        _ShadowIntensity28 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset28 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor28 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow28 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect28 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting28 ("", Float) = 0
            [TextLabel] _TextLabel28 ("TextLabel28", Int) = 0

            [HideInInspector][Toggle] _Use29 ("", Float) = 0
            [HideInInspector] m_start_text_setting29 (" --{reference_property:_Use29}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex29 ("Root", Int) = 0
                [Toggle] _WorldSpace29 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode29 ("Mode", Int) = 0
                [Content] _TextInput29 ("Text", Int) = 0
                [HideInInspector] _FontIndex29 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture29 ("Image", 2D) = "white" {}
                [IntRange] _Layer29 ("Layer", Range(0, 31)) = 29
                [HDR] _TextColor29 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position29 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation29 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale29 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot29 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator29 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter29 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode29 ("Mode", Int) = 0
                        _TypewriterProgress29 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection29 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation29 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter29 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing29 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path29 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake29 ("Shake", Float) = 0
                        _ShakeAmplitude29 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency29 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend29 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake29 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline29 ("Outline", Float) = 0
                        _OutlineWidth29 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor29 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline29 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow29 ("Drop Shadow", Float) = 0
                        _ShadowIntensity29 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset29 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor29 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow29 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect29 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting29 ("", Float) = 0
            [TextLabel] _TextLabel29 ("TextLabel29", Int) = 0

            [HideInInspector][Toggle] _Use30 ("", Float) = 0
            [HideInInspector] m_start_text_setting30 (" --{reference_property:_Use30}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex30 ("Root", Int) = 0
                [Toggle] _WorldSpace30 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode30 ("Mode", Int) = 0
                [Content] _TextInput30 ("Text", Int) = 0
                [HideInInspector] _FontIndex30 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture30 ("Image", 2D) = "white" {}
                [IntRange] _Layer30 ("Layer", Range(0, 31)) = 30
                [HDR] _TextColor30 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position30 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation30 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale30 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot30 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator30 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter30 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode30 ("Mode", Int) = 0
                        _TypewriterProgress30 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection30 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation30 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter30 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing30 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path30 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake30 ("Shake", Float) = 0
                        _ShakeAmplitude30 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency30 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend30 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake30 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline30 ("Outline", Float) = 0
                        _OutlineWidth30 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor30 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline30 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow30 ("Drop Shadow", Float) = 0
                        _ShadowIntensity30 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset30 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor30 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow30 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect30 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting30 ("", Float) = 0
            [TextLabel] _TextLabel30 ("TextLabel30", Int) = 0

            [HideInInspector][Toggle] _Use31 ("", Float) = 0
            [HideInInspector] m_start_text_setting31 (" --{reference_property:_Use31}", Float) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex31 ("Root", Int) = 0
                [Toggle] _WorldSpace31 ("World Space", Float) = 0
                [Enum(Text_Horizontal, 0, Text_Vertical, 2, Image, 1)] _Mode31 ("Mode", Int) = 0
                [Content] _TextInput31 ("Text", Int) = 0
                [HideInInspector] _FontIndex31 ("Font", Int) = 0
                [HideInInspector][ImageTexture] _ImageTexture31 ("Image", 2D) = "white" {}
                [IntRange] _Layer31 ("Layer", Range(0, 31)) = 31
                [HDR] _TextColor31 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position31 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation31 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale31 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot31 ("Pivot", Vector) = (0, 0, 0, 0)
                [Space(8)]

                [HideInInspector] m_start_animator31 ("Animator", Float) = 0

                    [HideInInspector] m_start_typewriter31 ("Typewriter", Float) = 0
                        [Enum(Left to Right, 0, Right to Left, 1, Center Out, 2)] _TypewriterMode31 ("Mode", Int) = 0
                        _TypewriterProgress31 ("Progress", Range(0, 1)) = 1
                        [Vector3] _TypewriterDirection31 ("Direction", Vector) = (0, 0, 0, 0)
                        [Vector3] _TypewriterRotation31 ("Rotation", Vector) = (0, 0, 0, 0)
                    [HideInInspector] m_end_typewriter31 ("Typewriter", Float) = 0

                    [HideInInspector] m_start_spacing31 ("Kerning & Tracking", Float) = 0
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
                    [HideInInspector] m_end_curve_path31 ("Curve Path", Float) = 0

                    [HideInInspector] m_start_shake31 ("Shake", Float) = 0
                        _ShakeAmplitude31 ("Amplitude", Range(0, 1)) = 0
                        _ShakeFrequency31 ("Frequency", Range(0, 20)) = 20
                        _ShakeBlend31 ("Blend", Range(0, 1)) = 0
                    [HideInInspector] m_end_shake31 ("Shake", Float) = 0

                    [HideInInspector] m_start_outline31 ("Outline", Float) = 0
                        _OutlineWidth31 ("Width", Range(0, 0.1)) = 0
                        [HDR]_OutlineColor31 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline31 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow31 ("Drop Shadow", Float) = 0
                        _ShadowIntensity31 ("Intensity", Range(0, 1)) = 0
                        [Vector2]_ShadowOffset31 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor31 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow31 ("Drop Shadow", Float) = 0

                [HideInInspector] m_end_effect31 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting31 ("", Float) = 0
            [TextLabel] _TextLabel31 ("TextLabel31", Int) = 0

        [HideInInspector] m_end_text_setting ("Text Settings", Float) = 0

        [HideInInspector] m_start_rendering_settings ("Rendering Settings", Float) = 0
            _FadeMin ("Fade Min", Float) = 0
            _FadeMax ("Fade Max", Float) = 20
            [ThryWideEnum(Opaque, 0, Transparent, 1, Overlay, 2)] _RenderType ("Render Type", Int) = 1
            [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0
            [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 6
            [Enum(UnityEngine.Rendering.BlendMode)] _SourceBlend ("Source Blend", Float) = 1
            [Enum(UnityEngine.Rendering.BlendMode)] _DestinationBlend ("Destination Blend", Float) = 10
            [Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Int) = 0

            [HideInInspector] m_start_debug ("Debug", Float) = 0
                [HDR] _PivotColor ("Pivot Color", Color) = (1, 0, 0, 1)
                _PivotSize ("Pivot Size", Range(0, 1)) = 0
                [HDR] _BoundsColor ("Bounds Color", Color) = (0, 1, 0, 1)
                _BoundsWidth ("Bounds Width", Range(0, 1)) = 0
            [HideInInspector] m_end_debug ("Debug", Float) = 0
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

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma multi_compile __ UNITY_EDITOR

            // Editor-only macro for conditional compilation
            #if defined(UNITY_EDITOR)
                #define UNITY_EDITOR_ONLY(x) x
                #define UNITY_BUILD_ONLY(x)
            #else
                #define UNITY_EDITOR_ONLY(x)
                #define UNITY_BUILD_ONLY(x) x
            #endif

            #include "UnityCG.cginc"

            // ============================================================================
            // Constants
            // ============================================================================
            #define UINT16_MAX 65535.0
            #define TEXTURE_DATA_EPSILON 0.5
            #define ATLAS_UV_INNER_SCALE 0.9375
            #define ATLAS_UV_MARGIN 0.03125
            #define MSDF_FIXED_DYNAMIC_RANGE 2.0
            #define EPSILON 1e-6
            #define DEG2RAD 0.017453292519943295
            #define HALF_PI 1.5707963267948966
            #define CM_TO_METER_SCALE 0.01
            #define TEXT_GLYPH_SCALE 0.1
            #define TEXT_COUNT 32

            #define TYPEWRITER_LTR 0
            #define TYPEWRITER_RTL 1
            #define TYPEWRITER_CENTER_OUT 2

            // ============================================================================
            // Textures and Properties
            // ============================================================================
            Texture2D<float4> _DataTexture;
            float4 _DataTexture_TexelSize;

            UNITY_DECLARE_TEX2DARRAY(_FontTextureArray);

            // Shared sampler for all image textures (avoids 16 sampler limit)
            SamplerState sampler_linear_repeat;

            // Image textures for Image mode (Texture2D doesn't consume sampler slots)
            Texture2D _ImageTexture0, _ImageTexture1, _ImageTexture2, _ImageTexture3;
            Texture2D _ImageTexture4, _ImageTexture5, _ImageTexture6, _ImageTexture7;
            Texture2D _ImageTexture8, _ImageTexture9, _ImageTexture10, _ImageTexture11;
            Texture2D _ImageTexture12, _ImageTexture13, _ImageTexture14, _ImageTexture15;
            Texture2D _ImageTexture16, _ImageTexture17, _ImageTexture18, _ImageTexture19;
            Texture2D _ImageTexture20, _ImageTexture21, _ImageTexture22, _ImageTexture23;
            Texture2D _ImageTexture24, _ImageTexture25, _ImageTexture26, _ImageTexture27;
            Texture2D _ImageTexture28, _ImageTexture29, _ImageTexture30, _ImageTexture31;

            float _AtlasSize;

            // Camera
            float4 _CameraPosition;
            float4 _CameraRotation;
            float _CameraFOV;

            // Fade
            float _FadeMin;
            float _FadeMax;

            // Root Transforms (5 roots) - precomputed matrices
            float4 _RootPosition0, _RootPosition1, _RootPosition2, _RootPosition3, _RootPosition4;
            float4 _RootMatrix0_Row0, _RootMatrix0_Row1, _RootMatrix0_Row2;
            float4 _RootMatrix1_Row0, _RootMatrix1_Row1, _RootMatrix1_Row2;
            float4 _RootMatrix2_Row0, _RootMatrix2_Row1, _RootMatrix2_Row2;
            float4 _RootMatrix3_Row0, _RootMatrix3_Row1, _RootMatrix3_Row2;
            float4 _RootMatrix4_Row0, _RootMatrix4_Row1, _RootMatrix4_Row2;

            // ============================================================================
            // Text Settings Variable Declaration Macro
            // ============================================================================
            #define DECLARE_TEXT_VARS(N) \
                float _Use##N; \
                int _Mode##N; \
                int _Layer##N; \
                float _WorldSpace##N; \
                int _RootIndex##N; \
                float4 _TextColor##N; \
                float4 _Position##N; \
                float4 _Rotation##N; \
                float4 _Scale##N; \
                float4 _Pivot##N; \
                int _FontIndex##N; \
                int _TypewriterMode##N; \
                float _TypewriterProgress##N; \
                float4 _TypewriterDirection##N; \
                float4 _TypewriterRotation##N; \
                float _Spacing##N; \
                float4 _CurveDataX##N##_0; \
                float4 _CurveDataX##N##_1; \
                float4 _CurveDataY##N##_0; \
                float4 _CurveDataY##N##_1; \
                float4 _CurveDataZ##N##_0; \
                float4 _CurveDataZ##N##_1; \
                float4 _CurveDataTX##N##_0; \
                float4 _CurveDataTX##N##_1; \
                float4 _CurveDataTY##N##_0; \
                float4 _CurveDataTY##N##_1; \
                float4 _CurveDataTZ##N##_0; \
                float4 _CurveDataTZ##N##_1; \
                float _CurveIntensity##N; \
                float _CurveOffset##N; \
                float _CurveSpeed##N; \
                float _CurveRotation##N; \
                float _ShakeAmplitude##N; \
                float _ShakeFrequency##N; \
                float _ShakeBlend##N; \
                float _OutlineWidth##N; \
                float4 _OutlineColor##N; \
                float _ShadowIntensity##N; \
                float4 _ShadowOffset##N; \
                float4 _ShadowColor##N;

            // Declare all text variables
            DECLARE_TEXT_VARS(0)
            DECLARE_TEXT_VARS(1)
            DECLARE_TEXT_VARS(2)
            DECLARE_TEXT_VARS(3)
            DECLARE_TEXT_VARS(4)
            DECLARE_TEXT_VARS(5)
            DECLARE_TEXT_VARS(6)
            DECLARE_TEXT_VARS(7)
            DECLARE_TEXT_VARS(8)
            DECLARE_TEXT_VARS(9)
            DECLARE_TEXT_VARS(10)
            DECLARE_TEXT_VARS(11)
            DECLARE_TEXT_VARS(12)
            DECLARE_TEXT_VARS(13)
            DECLARE_TEXT_VARS(14)
            DECLARE_TEXT_VARS(15)
            DECLARE_TEXT_VARS(16)
            DECLARE_TEXT_VARS(17)
            DECLARE_TEXT_VARS(18)
            DECLARE_TEXT_VARS(19)
            DECLARE_TEXT_VARS(20)
            DECLARE_TEXT_VARS(21)
            DECLARE_TEXT_VARS(22)
            DECLARE_TEXT_VARS(23)
            DECLARE_TEXT_VARS(24)
            DECLARE_TEXT_VARS(25)
            DECLARE_TEXT_VARS(26)
            DECLARE_TEXT_VARS(27)
            DECLARE_TEXT_VARS(28)
            DECLARE_TEXT_VARS(29)
            DECLARE_TEXT_VARS(30)
            DECLARE_TEXT_VARS(31)

            // Global debug variables
            float4 _PivotColor;
            float _PivotSize;
            float4 _BoundsColor;
            float _BoundsWidth;

            // ============================================================================
            // Structures
            // ============================================================================
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;      // char_index (x), text_id (y)
                float2 uv2 : TEXCOORD1;     // glyph_uv (corner)
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 glyph_uv : TEXCOORD0;
                nointerpolation uint char_index : TEXCOORD1;
                nointerpolation uint font_index : TEXCOORD2;
                nointerpolation float anim_factor : TEXCOORD3;
                nointerpolation float2 shake_offset : TEXCOORD4;
                nointerpolation float fade : TEXCOORD5;
                nointerpolation float4 text_color : TEXCOORD6;
                nointerpolation float4 outline : TEXCOORD7;     // width, color.rgb (alpha in outline_alpha)
                nointerpolation float4 shadow : TEXCOORD8;      // intensity, offset.xy, outline_alpha
                nointerpolation float3 shadow_color : TEXCOORD9;
                nointerpolation uint mode : TEXCOORD10;         // 0=Text, 1=Image, 2=Pivot
                nointerpolation uint text_id : TEXCOORD11;      // for Image mode texture selection
                #if defined(UNITY_EDITOR)
                nointerpolation float4 debug_pivot : TEXCOORD12;  // pivot_size, pivot_color.rgb
                nointerpolation float4 debug_bounds : TEXCOORD13; // bounds_width, bounds_color.rgb
                #endif
                UNITY_VERTEX_OUTPUT_STEREO
            };

            // ============================================================================
            // Helper Functions
            // ============================================================================

            inline half median(half3 rgb)
            {
                return max(min(rgb.r, rgb.g), min(max(rgb.r, rgb.g), rgb.b));
            }

            float2 calculate_atlas_uv(uint char_index, float2 glyph_uv, float atlas_size)
            {
                uint adjusted_index = char_index - 1u;
                uint atlas_mask = (uint)atlas_size - 1u;
                uint atlas_shift = firstbithigh((uint)atlas_size);

                float2 atlas_pos;
                atlas_pos.x = (float)(adjusted_index & atlas_mask);
                atlas_pos.y = (float)(atlas_mask - (adjusted_index >> atlas_shift));

                float2 clamped_uv = saturate(glyph_uv * ATLAS_UV_INNER_SCALE + ATLAS_UV_MARGIN);
                float inv_atlas_size = rcp(atlas_size);

                return (atlas_pos + clamped_uv) * inv_atlas_size;
            }

            float2 hash22(float2 p)
            {
                return frac(sin(float2(
                    dot(p, float2(127.1, 311.7)),
                    dot(p, float2(269.5, 183.3))
                )) * 43758.5453);
            }

            float2 calculate_shake_offset(int char_pos, float time, float blend, float frequency, float amplitude)
            {
                float time_step = floor(time * frequency);
                float2 char_random = hash22(float2(char_pos, time_step));
                float2 char_offset = char_random * 2.0 - 1.0;
                float2 line_random = hash22(float2(0.0, time_step));
                float2 line_offset = line_random * 2.0 - 1.0;
                float2 blended_offset = lerp(char_offset, line_offset, blend);
                return blended_offset * amplitude * 0.02;
            }

            // Catmull-Rom spline interpolation for smooth curves
            float catmull_rom(float p0, float p1, float p2, float p3, float t)
            {
                float t2 = t * t;
                float t3 = t2 * t;
                return 0.5 * ((2.0 * p1) +
                              (-p0 + p2) * t +
                              (2.0 * p0 - 5.0 * p1 + 4.0 * p2 - p3) * t2 +
                              (-p0 + 3.0 * p1 - 3.0 * p2 + p3) * t3);
            }

            float sample_baked_curve(float4 data0, float4 data1, float t)
            {
                t = saturate(t) * 7.0;
                int idx = (int)t;
                float frac_t = frac(t);
                float samples[8] = { data0.x, data0.y, data0.z, data0.w,
                                     data1.x, data1.y, data1.z, data1.w };
                // Catmull-Rom: need 4 points (p0, p1, p2, p3), interpolate between p1 and p2
                int i0 = max(idx - 1, 0);
                int i1 = idx;
                int i2 = min(idx + 1, 7);
                int i3 = min(idx + 2, 7);
                return catmull_rom(samples[i0], samples[i1], samples[i2], samples[i3], frac_t);
            }

            // Catmull-Rom derivative for smooth tangent
            float catmull_rom_derivative(float p0, float p1, float p2, float p3, float t)
            {
                float t2 = t * t;
                return 0.5 * ((-p0 + p2) +
                              2.0 * (2.0 * p0 - 5.0 * p1 + 4.0 * p2 - p3) * t +
                              3.0 * (-p0 + 3.0 * p1 - 3.0 * p2 + p3) * t2);
            }

            float sample_baked_curve_derivative(float4 data0, float4 data1, float t)
            {
                t = saturate(t) * 7.0;
                int idx = (int)t;
                float frac_t = frac(t);
                float samples[8] = { data0.x, data0.y, data0.z, data0.w,
                                     data1.x, data1.y, data1.z, data1.w };
                int i0 = max(idx - 1, 0);
                int i1 = idx;
                int i2 = min(idx + 1, 7);
                int i3 = min(idx + 2, 7);
                // Scale by 7.0 to account for t being in [0, 7] range
                return catmull_rom_derivative(samples[i0], samples[i1], samples[i2], samples[i3], frac_t) * 7.0;
            }

            float3 sample_baked_curve_3d(float normalized_pos, float phase,
                float4 dataX0, float4 dataX1, float4 dataY0, float4 dataY1, float4 dataZ0, float4 dataZ1)
            {
                float t = frac(normalized_pos + phase);
                float3 offset;
                offset.x = sample_baked_curve(dataX0, dataX1, t) * 2.0 - 1.0;
                offset.y = sample_baked_curve(dataY0, dataY1, t) * 2.0 - 1.0;
                offset.z = sample_baked_curve(dataZ0, dataZ1, t) * 2.0 - 1.0;
                return offset;
            }

            float3 sample_baked_tangent_3d(float normalized_pos, float phase,
                float4 dataX0, float4 dataX1, float4 dataY0, float4 dataY1, float4 dataZ0, float4 dataZ1)
            {
                float t = frac(normalized_pos + phase);
                float3 tangent;
                // Use analytical derivative of Catmull-Rom spline for smooth tangent
                tangent.x = sample_baked_curve_derivative(dataX0, dataX1, t) * 2.0;
                tangent.y = sample_baked_curve_derivative(dataY0, dataY1, t) * 2.0;
                tangent.z = sample_baked_curve_derivative(dataZ0, dataZ1, t) * 2.0;
                return tangent;
            }

            float calculate_typewriter_visibility(int char_pos, int char_count, int mode, float progress)
            {
                float display_count = char_count * saturate(progress);
                float distance_to_edge = 0.0;
                float center_offset = (char_count - 1) * 0.5;

                if (mode == TYPEWRITER_LTR)
                    distance_to_edge = display_count - char_pos;
                else if (mode == TYPEWRITER_RTL)
                    distance_to_edge = char_pos - (char_count - display_count) + 1;
                else
                {
                    float half_display = display_count * 0.5;
                    float dist_from_center = abs(char_pos - center_offset);
                    distance_to_edge = half_display - dist_from_center + 0.5;
                }
                return 1.0 - saturate(distance_to_edge);
            }

            // Unity-compatible rotation matrix (ZXY intrinsic order)
            float3x3 rotation_matrix(float3 rotation)
            {
                float sx, cx, sy, cy, sz, cz;
                sincos(rotation.x, sx, cx);
                sincos(rotation.y, sy, cy);
                sincos(rotation.z, sz, cz);
                // R = Ry * Rx * Rz (applies as Z -> X -> Y)
                return float3x3(
                    cy * cz + sy * sx * sz,  -cy * sz + sy * sx * cz, sy * cx,
                    cx * sz,                  cx * cz,                -sx,
                    -sy * cz + cy * sx * sz,  sy * sz + cy * sx * cz, cy * cx
                );
            }

            inline float3 get_camera_position()
            {
                #if defined(USING_STEREO_MATRICES)
                    return (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
                #else
                    return _WorldSpaceCameraPos;
                #endif
            }

            float4 project_custom_camera(float3 world_pos, float3 cam_pos, float3x3 cam_rot, float tan_half_fov, float aspect, int layer)
            {
                float3 relative = world_pos - cam_pos;
                float3 view_pos = mul(transpose(cam_rot), relative);
                if (view_pos.z <= EPSILON)
                    return float4(0, 0, -1, 1);
                // Perspective-correct projection: keep w = view_pos.z for proper UV interpolation
                float2 clip;
                clip.x = view_pos.x / (tan_half_fov * aspect);
                clip.y = view_pos.y / tan_half_fov;
                // Layer-based pseudo depth (reversed-Z): layer 0 = back (depth 0.0), layer 31 = front (depth 1.0)
                float pseudo_depth = (layer + 0.5) / 32.0;
                return float4(clip.x, clip.y, pseudo_depth * view_pos.z, view_pos.z);
            }

            // ============================================================================
            // Process Text Macro (Vertex Shader)
            // ============================================================================
            #define PROCESS_TEXT(N) \
            { \
                if (_Use##N < 0.5) { o.vertex = float4(0,0,-1,1); return o; } \
                o.mode = (uint)_Mode##N; \
                o.text_id = N; \
                float anim_factor = 0.0; \
                float3 local_pos = float3(0, 0, 0); \
                uint char_count = 1; \
                float spacing = 1.0; \
                bool is_pivot = (char_pos == 32); \
                if (is_pivot) { \
                    /* Pivot mode: render at text center (Editor only) */ \
                    UNITY_BUILD_ONLY(o.vertex = float4(0,0,-1,1); return o;) \
                    UNITY_EDITOR_ONLY( \
                        if (_PivotSize < EPSILON) { o.vertex = float4(0,0,-1,1); return o; } \
                        o.char_index = 0; \
                        o.font_index = 0; \
                        o.anim_factor = 0.0; \
                    ) \
                } else if (_Mode##N == 1) { \
                    /* Image mode: only render char_pos == 0 (single quad) */ \
                    if (char_pos != 0) { o.vertex = float4(0,0,-1,1); return o; } \
                    o.char_index = 0; \
                    o.font_index = 0; \
                    o.anim_factor = 0.0; \
                } else { \
                    /* Text mode: original logic */ \
                    int2 texture_size = int2(_DataTexture_TexelSize.zw); \
                    int texel_y = texture_size.y - 1 - N; \
                    float4 meta_pixel = _DataTexture.Load(int3(0, texel_y, 0)); \
                    char_count = (uint)(meta_pixel.r * UINT16_MAX + TEXTURE_DATA_EPSILON); \
                    uint data_font_index = (uint)(meta_pixel.g * UINT16_MAX + TEXTURE_DATA_EPSILON); \
                    if ((uint)char_pos >= char_count) { o.vertex = float4(0,0,-1,1); return o; } \
                    anim_factor = calculate_typewriter_visibility(char_pos, char_count, _TypewriterMode##N, _TypewriterProgress##N); \
                    if (anim_factor >= 1.0 - EPSILON) { o.vertex = float4(0,0,-1,1); return o; } \
                    uint char_index = 0; \
                    float char_value = 0; \
                    if (char_pos == 0) char_value = meta_pixel.b; \
                    else if (char_pos == 1) char_value = meta_pixel.a; \
                    else { \
                        int adjusted_pos = char_pos - 2; \
                        int pixel_x = 1 + (adjusted_pos >> 2); \
                        int channel = adjusted_pos & 3; \
                        float4 char_pixel = _DataTexture.Load(int3(pixel_x, texel_y, 0)); \
                        char_value = (channel == 0) ? char_pixel.r : (channel == 1) ? char_pixel.g : (channel == 2) ? char_pixel.b : char_pixel.a; \
                    } \
                    char_index = (uint)(char_value * UINT16_MAX + TEXTURE_DATA_EPSILON); \
                    if (char_index == 0) { o.vertex = float4(0,0,-1,1); return o; } \
                    o.char_index = char_index; \
                    o.font_index = (_FontIndex##N >= 0) ? (uint)_FontIndex##N : data_font_index; \
                    o.anim_factor = anim_factor; \
                    if (_ShakeAmplitude##N > EPSILON) \
                        o.shake_offset = calculate_shake_offset(char_pos, _Time.y, _ShakeBlend##N, _ShakeFrequency##N, _ShakeAmplitude##N); \
                    spacing = 1.0 + _Spacing##N; \
                    float total_length = (char_count - 1) * spacing * TEXT_GLYPH_SCALE; \
                    float start_pos = -total_length * 0.5; \
                    float char_offset = start_pos + char_pos * spacing * TEXT_GLYPH_SCALE; \
                    local_pos = (_Mode##N == 2) ? float3(0, -char_offset, 0) : float3(char_offset, 0, 0); \
                } \
                float3 typewriter_rot = float3(0, 0, 0); \
                if (anim_factor > EPSILON) { \
                    if (dot(_TypewriterRotation##N.xyz, _TypewriterRotation##N.xyz) > EPSILON) { \
                        typewriter_rot = _TypewriterRotation##N.xyz * DEG2RAD * anim_factor; \
                    } \
                    local_pos += _TypewriterDirection##N.xyz * anim_factor * TEXT_GLYPH_SCALE; \
                } \
                float curve_rot_z = 0.0; \
                float normalized_pos = (float)char_pos / max(char_count - 1, 1); \
                if (_CurveIntensity##N > EPSILON) { \
                    float curve_time = _Time.y * _CurveSpeed##N + _CurveOffset##N; \
                    float3 curve_offset = sample_baked_curve_3d(normalized_pos, curve_time, \
                        _CurveDataX##N##_0, _CurveDataX##N##_1, _CurveDataY##N##_0, _CurveDataY##N##_1, _CurveDataZ##N##_0, _CurveDataZ##N##_1); \
                    local_pos += curve_offset * _CurveIntensity##N * TEXT_GLYPH_SCALE * spacing; \
                    if (_CurveRotation##N > EPSILON) { \
                        float3 curve_tangent_raw = sample_baked_tangent_3d(normalized_pos, curve_time, \
                            _CurveDataX##N##_0, _CurveDataX##N##_1, _CurveDataY##N##_0, _CurveDataY##N##_1, _CurveDataZ##N##_0, _CurveDataZ##N##_1); \
                        float3 base_tangent = (_Mode##N == 2) ? float3(0, -1.0, 0) : float3(1.0, 0, 0); \
                        float3 curve_tangent = normalize(curve_tangent_raw * _CurveIntensity##N + base_tangent); \
                        curve_rot_z = atan2(curve_tangent.y, curve_tangent.x) * _CurveRotation##N; \
                        if (_Mode##N == 2) curve_rot_z += HALF_PI; \
                    } \
                } \
                float3 text_translation = _Position##N.xyz * CM_TO_METER_SCALE; \
                float screen_flip = (1.0 - _WorldSpace##N) * 180.0; \
                float3 rot_with_flip = float3(_Rotation##N.x + screen_flip, _Rotation##N.y, _Rotation##N.z) * DEG2RAD; \
                float3x3 text_rot = rotation_matrix(rot_with_flip); \
                float3 text_scale = _Scale##N.xyz; \
                float3 pivot = _Pivot##N.xyz * TEXT_GLYPH_SCALE; \
                float3x3 rotation_scale = float3x3( \
                    text_rot._m00 * text_scale.x, text_rot._m01 * text_scale.y, text_rot._m02 * text_scale.z, \
                    text_rot._m10 * text_scale.x, text_rot._m11 * text_scale.y, text_rot._m12 * text_scale.z, \
                    text_rot._m20 * text_scale.x, text_rot._m21 * text_scale.y, text_rot._m22 * text_scale.z); \
                float3 pivot_offset = is_pivot ? float3(0,0,0) : (pivot - mul(rotation_scale, pivot)); \
                float3 pivot_local = is_pivot ? pivot : local_pos; \
                float3 world_pos = mul(rotation_scale, pivot_local) + text_translation + pivot_offset; \
                float3x3 root_matrix_cached = (float3x3)0; \
                float3 root_pos_cached = float3(0, 0, 0); \
                if (_RootIndex##N > 0) { \
                    switch(_RootIndex##N) { \
                        case 1: root_matrix_cached = float3x3(_RootMatrix0_Row0.xyz, _RootMatrix0_Row1.xyz, _RootMatrix0_Row2.xyz); root_pos_cached = _RootPosition0.xyz; break; \
                        case 2: root_matrix_cached = float3x3(_RootMatrix1_Row0.xyz, _RootMatrix1_Row1.xyz, _RootMatrix1_Row2.xyz); root_pos_cached = _RootPosition1.xyz; break; \
                        case 3: root_matrix_cached = float3x3(_RootMatrix2_Row0.xyz, _RootMatrix2_Row1.xyz, _RootMatrix2_Row2.xyz); root_pos_cached = _RootPosition2.xyz; break; \
                        case 4: root_matrix_cached = float3x3(_RootMatrix3_Row0.xyz, _RootMatrix3_Row1.xyz, _RootMatrix3_Row2.xyz); root_pos_cached = _RootPosition3.xyz; break; \
                        default: root_matrix_cached = float3x3(_RootMatrix4_Row0.xyz, _RootMatrix4_Row1.xyz, _RootMatrix4_Row2.xyz); root_pos_cached = _RootPosition4.xyz; break; \
                    } \
                    world_pos = mul(root_matrix_cached, world_pos) + root_pos_cached * CM_TO_METER_SCALE; \
                } \
                float3 relative_to_cam = world_pos - cam_pos; \
                float3 view_pos = mul(transpose(cam_rot), relative_to_cam); \
                if (view_pos.z <= 0) { o.vertex = float4(0,0,-1,1); return o; } \
                float char_half_size = is_pivot ? (_PivotSize * 0.02) : (TEXT_GLYPH_SCALE * 0.5); \
                float3 char_rotation = typewriter_rot + float3(0, 0, curve_rot_z); \
                bool has_char_rotation = dot(char_rotation, char_rotation) > EPSILON; \
                float3x3 char_rot_matrix = has_char_rotation ? rotation_matrix(char_rotation) : float3x3(1,0,0, 0,1,0, 0,0,1); \
                float3x3 char_rotation_scale = has_char_rotation ? mul(rotation_scale, char_rot_matrix) : rotation_scale; \
                if (_RootIndex##N > 0) { \
                    char_rotation_scale = mul(root_matrix_cached, char_rotation_scale); \
                } \
                float3 world_right = mul(char_rotation_scale, float3(char_half_size, 0, 0)); \
                float3 world_up = mul(char_rotation_scale, float3(0, char_half_size, 0)); \
                float3 corner_offset = (v.uv2.x - 0.5) * 2.0 * world_right + (v.uv2.y - 0.5) * 2.0 * world_up; \
                float3 corner_world = world_pos + corner_offset; \
                if (_WorldSpace##N > 0.5) { \
                    o.vertex = UnityObjectToClipPos(float4(corner_world, 1.0)); \
                } else { \
                    o.vertex = project_custom_camera(corner_world, cam_pos, cam_rot, tan_half_fov, aspect, _Layer##N); \
                } \
                o.text_color = _TextColor##N; \
                o.outline = float4(_OutlineWidth##N, _OutlineColor##N.rgb); \
                o.shadow = float4(_ShadowIntensity##N, _ShadowOffset##N.xy, _OutlineColor##N.a); \
                o.shadow_color = _ShadowColor##N.rgb; \
                o.mode = is_pivot ? 3 : (uint)_Mode##N; \
                o.text_id = N; \
                UNITY_EDITOR_ONLY(o.debug_pivot = float4(_PivotSize, _PivotColor.rgb);) \
                UNITY_EDITOR_ONLY(o.debug_bounds = float4(_BoundsWidth * 0.1, _BoundsColor.rgb);) \
            }


            // ============================================================================
            // Vertex Shader
            // ============================================================================
            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.vertex = float4(0, 0, -1, 1);
                o.glyph_uv = v.uv2;
                o.char_index = 0;
                o.font_index = 0;
                o.anim_factor = 1.0;
                o.shake_offset = float2(0, 0);
                o.fade = 1.0;
                o.text_color = float4(1, 1, 1, 1);
                o.outline = float4(0, 0, 0, 0);
                o.shadow = float4(0, 0, 0, 0);
                o.shadow_color = float3(0, 0, 0);
                o.mode = 0;
                o.text_id = 0;
                #if defined(UNITY_EDITOR)
                o.debug_pivot = float4(0, 0, 0, 0);
                o.debug_bounds = float4(0, 0, 0, 0);
                #endif

                // Decode from UV
                int char_pos = (int)floor(v.uv.x * 256.0);
                int text_id = (int)floor(v.uv.y * 32.0);

                // Camera setup (shared)
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                o.fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                float3 cam_pos = _CameraPosition.xyz * CM_TO_METER_SCALE;
                float3x3 cam_rot = rotation_matrix(_CameraRotation.xyz * DEG2RAD);
                float tan_half_fov = tan(_CameraFOV * DEG2RAD * 0.5);
                float aspect = _ScreenParams.x / _ScreenParams.y;

                // Process text based on text_id
                switch(text_id)
                {
                case 0: PROCESS_TEXT(0); break;
                case 1: PROCESS_TEXT(1); break;
                case 2: PROCESS_TEXT(2); break;
                case 3: PROCESS_TEXT(3); break;
                case 4: PROCESS_TEXT(4); break;
                case 5: PROCESS_TEXT(5); break;
                case 6: PROCESS_TEXT(6); break;
                case 7: PROCESS_TEXT(7); break;
                case 8: PROCESS_TEXT(8); break;
                case 9: PROCESS_TEXT(9); break;
                case 10: PROCESS_TEXT(10); break;
                case 11: PROCESS_TEXT(11); break;
                case 12: PROCESS_TEXT(12); break;
                case 13: PROCESS_TEXT(13); break;
                case 14: PROCESS_TEXT(14); break;
                case 15: PROCESS_TEXT(15); break;
                case 16: PROCESS_TEXT(16); break;
                case 17: PROCESS_TEXT(17); break;
                case 18: PROCESS_TEXT(18); break;
                case 19: PROCESS_TEXT(19); break;
                case 20: PROCESS_TEXT(20); break;
                case 21: PROCESS_TEXT(21); break;
                case 22: PROCESS_TEXT(22); break;
                case 23: PROCESS_TEXT(23); break;
                case 24: PROCESS_TEXT(24); break;
                case 25: PROCESS_TEXT(25); break;
                case 26: PROCESS_TEXT(26); break;
                case 27: PROCESS_TEXT(27); break;
                case 28: PROCESS_TEXT(28); break;
                case 29: PROCESS_TEXT(29); break;
                case 30: PROCESS_TEXT(30); break;
                case 31: PROCESS_TEXT(31); break;
                }

                return o;
            }

            // ============================================================================
            // Image Sampling Macro (uses shared sampler to avoid 16 sampler limit)
            // ============================================================================
            #define SAMPLE_IMG(tex, uv) tex.Sample(sampler_linear_repeat, uv)
            #define SAMPLE_IMAGE(id, uv) \
                ((id) == 0 ? SAMPLE_IMG(_ImageTexture0, uv) : \
                 (id) == 1 ? SAMPLE_IMG(_ImageTexture1, uv) : \
                 (id) == 2 ? SAMPLE_IMG(_ImageTexture2, uv) : \
                 (id) == 3 ? SAMPLE_IMG(_ImageTexture3, uv) : \
                 (id) == 4 ? SAMPLE_IMG(_ImageTexture4, uv) : \
                 (id) == 5 ? SAMPLE_IMG(_ImageTexture5, uv) : \
                 (id) == 6 ? SAMPLE_IMG(_ImageTexture6, uv) : \
                 (id) == 7 ? SAMPLE_IMG(_ImageTexture7, uv) : \
                 (id) == 8 ? SAMPLE_IMG(_ImageTexture8, uv) : \
                 (id) == 9 ? SAMPLE_IMG(_ImageTexture9, uv) : \
                 (id) == 10 ? SAMPLE_IMG(_ImageTexture10, uv) : \
                 (id) == 11 ? SAMPLE_IMG(_ImageTexture11, uv) : \
                 (id) == 12 ? SAMPLE_IMG(_ImageTexture12, uv) : \
                 (id) == 13 ? SAMPLE_IMG(_ImageTexture13, uv) : \
                 (id) == 14 ? SAMPLE_IMG(_ImageTexture14, uv) : \
                 (id) == 15 ? SAMPLE_IMG(_ImageTexture15, uv) : \
                 (id) == 16 ? SAMPLE_IMG(_ImageTexture16, uv) : \
                 (id) == 17 ? SAMPLE_IMG(_ImageTexture17, uv) : \
                 (id) == 18 ? SAMPLE_IMG(_ImageTexture18, uv) : \
                 (id) == 19 ? SAMPLE_IMG(_ImageTexture19, uv) : \
                 (id) == 20 ? SAMPLE_IMG(_ImageTexture20, uv) : \
                 (id) == 21 ? SAMPLE_IMG(_ImageTexture21, uv) : \
                 (id) == 22 ? SAMPLE_IMG(_ImageTexture22, uv) : \
                 (id) == 23 ? SAMPLE_IMG(_ImageTexture23, uv) : \
                 (id) == 24 ? SAMPLE_IMG(_ImageTexture24, uv) : \
                 (id) == 25 ? SAMPLE_IMG(_ImageTexture25, uv) : \
                 (id) == 26 ? SAMPLE_IMG(_ImageTexture26, uv) : \
                 (id) == 27 ? SAMPLE_IMG(_ImageTexture27, uv) : \
                 (id) == 28 ? SAMPLE_IMG(_ImageTexture28, uv) : \
                 (id) == 29 ? SAMPLE_IMG(_ImageTexture29, uv) : \
                 (id) == 30 ? SAMPLE_IMG(_ImageTexture30, uv) : \
                 SAMPLE_IMG(_ImageTexture31, uv))

            // ============================================================================
            // Fragment Shader
            // ============================================================================
            float4 frag(v2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                float2 glyph_uv = i.glyph_uv + i.shake_offset;
                float opacity_mult = (1.0 - i.anim_factor) * i.fade;

                half3 accum_color = half3(0, 0, 0);
                half accum_alpha = 0.0;

                // Image mode: direct texture sampling
                if (i.mode == 1)
                {
                    float4 img = SAMPLE_IMAGE(i.text_id, glyph_uv);
                    accum_color = img.rgb * i.text_color.rgb;
                    accum_alpha = img.a * i.text_color.a * opacity_mult;
                    clip(accum_alpha - 0.01);
                    return float4(accum_color, accum_alpha);
                }

                // Pivot mode: crosshair at text center (Editor only)
                #if defined(UNITY_EDITOR)
                if (i.mode == 3)
                {
                    float pivot_size = i.debug_pivot.x;
                    float3 pivot_color = i.debug_pivot.yzw;
                    float2 center_dist = abs(glyph_uv - 0.5);
                    // Crosshair
                    float cross_h = step(center_dist.y, 0.05) * step(center_dist.x, 0.5);
                    float cross_v = step(center_dist.x, 0.05) * step(center_dist.y, 0.5);
                    float cross = max(cross_h, cross_v);
                    clip(cross - 0.5);
                    return float4(pivot_color, 1.0);
                }
                #endif

                // Text mode: MSDF rendering
                uint char_index = i.char_index;
                uint font_index = i.font_index;

                float2 atlas_uv = calculate_atlas_uv(char_index, glyph_uv, _AtlasSize);
                half3 msdf = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(atlas_uv, font_index)).rgb;
                half med = median(msdf);
                float sdf = (med - 0.5) * MSDF_FIXED_DYNAMIC_RANGE;
                float main_opacity = saturate(sdf + 0.5);

                // Shadow (from interpolants)
                float shadow_intensity = i.shadow.x;
                if (shadow_intensity > EPSILON)
                {
                    float2 shadow_uv = glyph_uv - i.shadow.yz;
                    float2 shadow_bounds = step(0.0, shadow_uv) * step(shadow_uv, 1.0);
                    if (shadow_bounds.x * shadow_bounds.y > 0.5)
                    {
                        float2 shadow_atlas_uv = calculate_atlas_uv(char_index, shadow_uv, _AtlasSize);
                        half3 shadow_msdf = UNITY_SAMPLE_TEX2DARRAY(_FontTextureArray, float3(shadow_atlas_uv, font_index)).rgb;
                        half shadow_med = median(shadow_msdf);
                        float shadow_sdf = (shadow_med - 0.5) * MSDF_FIXED_DYNAMIC_RANGE;
                        float shadow_opacity = saturate(shadow_sdf + 0.5);
                        half shadow_alpha = shadow_opacity * shadow_intensity * opacity_mult;
                        accum_color = i.shadow_color * shadow_alpha;
                        accum_alpha = shadow_alpha;
                    }
                }

                // Outline (from interpolants)
                float outline_width = i.outline.x;
                if (outline_width > EPSILON)
                {
                    float outline_sdf = (med - 0.5 + outline_width) * MSDF_FIXED_DYNAMIC_RANGE;
                    float outline_opacity = saturate(outline_sdf + 0.5);
                    half outline_alpha = outline_opacity * i.shadow.w * opacity_mult;  // shadow.w = outline color alpha
                    accum_color = i.outline.yzw * outline_alpha + accum_color * (1.0 - outline_alpha);
                    accum_alpha = outline_alpha + accum_alpha * (1.0 - outline_alpha);
                }

                // Main text (from interpolants)
                half main_alpha = main_opacity * i.text_color.a * opacity_mult;
                accum_color = i.text_color.rgb * main_alpha + accum_color * (1.0 - main_alpha);
                accum_alpha = main_alpha + accum_alpha * (1.0 - main_alpha);

                // Debug: Glyph bounds rendering (Editor only)
                #if defined(UNITY_EDITOR)
                float bounds_width = i.debug_bounds.x;
                if (bounds_width > EPSILON)
                {
                    float2 border_dist = min(glyph_uv, 1.0 - glyph_uv);
                    float min_border_dist = min(border_dist.x, border_dist.y);
                    if (min_border_dist < bounds_width)
                    {
                        float3 bounds_color = i.debug_bounds.yzw;
                        float border_alpha = 1.0 - smoothstep(0.0, bounds_width, min_border_dist);
                        accum_color = lerp(accum_color, bounds_color, border_alpha);
                        accum_alpha = max(accum_alpha, border_alpha);
                    }
                }

                #endif

                clip(accum_alpha - 0.01);
                return float4(accum_color, accum_alpha);
            }
            ENDCG
        }
    }
}
