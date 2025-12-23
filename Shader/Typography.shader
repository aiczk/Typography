Shader "GekikaraStore/Typography"
{
    Properties
    {
        [HideInInspector] shader_is_using_thry_editor("", Float) = 0
        [HideInInspector] shader_master_label("<b><i><color=#858585>T</color><color=#9D9D9D>y</color><color=#B5B5B5>p</color><color=#CECECE>o</color><color=#E6E6E6>g</color><color=#FFFFFF>r</color><color=#E6E6E6>a</color><color=#CECECE>p</color><color=#B5B5B5>h</color><color=#9D9D9D>y</color></i></b>", Float) = 0

        [Project] _Project ("Project", Int) = 0

        [HideInInspector] m_start_camera_setting ("Camera Settings", Float) = 0
            [Vector3] _CameraPosition ("Position", Vector) = (0, 0, -100, 0)
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
                        [HDR]_OutlineColor0 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline0 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow0 ("Drop Shadow", Float) = 0
                        _ShadowIntensity0 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness0 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType0 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples0 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset0 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor0 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow0 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient0 ("Gradient", Float) = 0
                        _GradientIntensity0 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode0 ("Direction", Int) = 0
                        [HDR] _GradientColorA0 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB0 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient0 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect0 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting0 ("", Float) = 0
            [DynamicThryLabel] _TextLabel0 ("TextLabel0", Int) = 0

            [HideInInspector][Toggle] _Use1 ("", Float) = 0
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
                        [HDR]_OutlineColor1 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline1 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow1 ("Drop Shadow", Float) = 0
                        _ShadowIntensity1 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness1 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType1 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples1 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset1 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor1 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow1 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient1 ("Gradient", Float) = 0
                        _GradientIntensity1 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode1 ("Direction", Int) = 0
                        [HDR] _GradientColorA1 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB1 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient1 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect1 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting1 ("", Float) = 0
            [DynamicThryLabel] _TextLabel1 ("TextLabel1", Int) = 0

            [HideInInspector][Toggle] _Use2 ("", Float) = 0
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
                        [HDR]_OutlineColor2 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline2 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow2 ("Drop Shadow", Float) = 0
                        _ShadowIntensity2 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness2 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType2 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples2 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset2 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor2 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow2 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient2 ("Gradient", Float) = 0
                        _GradientIntensity2 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode2 ("Direction", Int) = 0
                        [HDR] _GradientColorA2 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB2 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient2 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect2 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting2 ("", Float) = 0
            [DynamicThryLabel] _TextLabel2 ("TextLabel2", Int) = 0

            [HideInInspector][Toggle] _Use3 ("", Float) = 0
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
                        [HDR]_OutlineColor3 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline3 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow3 ("Drop Shadow", Float) = 0
                        _ShadowIntensity3 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness3 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType3 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples3 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset3 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor3 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow3 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient3 ("Gradient", Float) = 0
                        _GradientIntensity3 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode3 ("Direction", Int) = 0
                        [HDR] _GradientColorA3 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB3 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient3 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect3 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting3 ("", Float) = 0
            [DynamicThryLabel] _TextLabel3 ("TextLabel3", Int) = 0

            [HideInInspector][Toggle] _Use4 ("", Float) = 0
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
                        [HDR]_OutlineColor4 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline4 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow4 ("Drop Shadow", Float) = 0
                        _ShadowIntensity4 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness4 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType4 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples4 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset4 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor4 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow4 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient4 ("Gradient", Float) = 0
                        _GradientIntensity4 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode4 ("Direction", Int) = 0
                        [HDR] _GradientColorA4 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB4 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient4 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect4 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting4 ("", Float) = 0
            [DynamicThryLabel] _TextLabel4 ("TextLabel4", Int) = 0

            [HideInInspector][Toggle] _Use5 ("", Float) = 0
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
                        [HDR]_OutlineColor5 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline5 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow5 ("Drop Shadow", Float) = 0
                        _ShadowIntensity5 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness5 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType5 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples5 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset5 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor5 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow5 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient5 ("Gradient", Float) = 0
                        _GradientIntensity5 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode5 ("Direction", Int) = 0
                        [HDR] _GradientColorA5 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB5 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient5 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect5 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting5 ("", Float) = 0
            [DynamicThryLabel] _TextLabel5 ("TextLabel5", Int) = 0

            [HideInInspector][Toggle] _Use6 ("", Float) = 0
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
                        [HDR]_OutlineColor6 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline6 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow6 ("Drop Shadow", Float) = 0
                        _ShadowIntensity6 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness6 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType6 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples6 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset6 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor6 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow6 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient6 ("Gradient", Float) = 0
                        _GradientIntensity6 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode6 ("Direction", Int) = 0
                        [HDR] _GradientColorA6 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB6 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient6 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect6 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting6 ("", Float) = 0
            [DynamicThryLabel] _TextLabel6 ("TextLabel6", Int) = 0

            [HideInInspector][Toggle] _Use7 ("", Float) = 0
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
                        [HDR]_OutlineColor7 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline7 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow7 ("Drop Shadow", Float) = 0
                        _ShadowIntensity7 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness7 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType7 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples7 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset7 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor7 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow7 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient7 ("Gradient", Float) = 0
                        _GradientIntensity7 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode7 ("Direction", Int) = 0
                        [HDR] _GradientColorA7 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB7 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient7 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect7 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting7 ("", Float) = 0
            [DynamicThryLabel] _TextLabel7 ("TextLabel7", Int) = 0

            [HideInInspector][Toggle] _Use8 ("", Float) = 0
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
                        [HDR]_OutlineColor8 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline8 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow8 ("Drop Shadow", Float) = 0
                        _ShadowIntensity8 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness8 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType8 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples8 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset8 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor8 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow8 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient8 ("Gradient", Float) = 0
                        _GradientIntensity8 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode8 ("Direction", Int) = 0
                        [HDR] _GradientColorA8 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB8 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient8 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect8 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting8 ("", Float) = 0
            [DynamicThryLabel] _TextLabel8 ("TextLabel8", Int) = 0

            [HideInInspector][Toggle] _Use9 ("", Float) = 0
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
                        [HDR]_OutlineColor9 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline9 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow9 ("Drop Shadow", Float) = 0
                        _ShadowIntensity9 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness9 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType9 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples9 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset9 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor9 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow9 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient9 ("Gradient", Float) = 0
                        _GradientIntensity9 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode9 ("Direction", Int) = 0
                        [HDR] _GradientColorA9 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB9 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient9 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect9 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting9 ("", Float) = 0
            [DynamicThryLabel] _TextLabel9 ("TextLabel9", Int) = 0

            [HideInInspector][Toggle] _Use10 ("", Float) = 0
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
                        [HDR]_OutlineColor10 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline10 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow10 ("Drop Shadow", Float) = 0
                        _ShadowIntensity10 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness10 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType10 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples10 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset10 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor10 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow10 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient10 ("Gradient", Float) = 0
                        _GradientIntensity10 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode10 ("Direction", Int) = 0
                        [HDR] _GradientColorA10 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB10 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient10 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect10 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting10 ("", Float) = 0
            [DynamicThryLabel] _TextLabel10 ("TextLabel10", Int) = 0

            [HideInInspector][Toggle] _Use11 ("", Float) = 0
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
                        [HDR]_OutlineColor11 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline11 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow11 ("Drop Shadow", Float) = 0
                        _ShadowIntensity11 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness11 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType11 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples11 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset11 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor11 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow11 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient11 ("Gradient", Float) = 0
                        _GradientIntensity11 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode11 ("Direction", Int) = 0
                        [HDR] _GradientColorA11 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB11 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient11 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect11 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting11 ("", Float) = 0
            [DynamicThryLabel] _TextLabel11 ("TextLabel11", Int) = 0

            [HideInInspector][Toggle] _Use12 ("", Float) = 0
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
                        [HDR]_OutlineColor12 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline12 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow12 ("Drop Shadow", Float) = 0
                        _ShadowIntensity12 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness12 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType12 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples12 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset12 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor12 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow12 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient12 ("Gradient", Float) = 0
                        _GradientIntensity12 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode12 ("Direction", Int) = 0
                        [HDR] _GradientColorA12 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB12 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient12 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect12 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting12 ("", Float) = 0
            [DynamicThryLabel] _TextLabel12 ("TextLabel12", Int) = 0

            [HideInInspector][Toggle] _Use13 ("", Float) = 0
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
                        [HDR]_OutlineColor13 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline13 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow13 ("Drop Shadow", Float) = 0
                        _ShadowIntensity13 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness13 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType13 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples13 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset13 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor13 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow13 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient13 ("Gradient", Float) = 0
                        _GradientIntensity13 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode13 ("Direction", Int) = 0
                        [HDR] _GradientColorA13 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB13 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient13 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect13 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting13 ("", Float) = 0
            [DynamicThryLabel] _TextLabel13 ("TextLabel13", Int) = 0

            [HideInInspector][Toggle] _Use14 ("", Float) = 0
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
                        [HDR]_OutlineColor14 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline14 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow14 ("Drop Shadow", Float) = 0
                        _ShadowIntensity14 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness14 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType14 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples14 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset14 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor14 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow14 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient14 ("Gradient", Float) = 0
                        _GradientIntensity14 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode14 ("Direction", Int) = 0
                        [HDR] _GradientColorA14 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB14 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient14 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect14 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting14 ("", Float) = 0
            [DynamicThryLabel] _TextLabel14 ("TextLabel14", Int) = 0

            [HideInInspector][Toggle] _Use15 ("", Float) = 0
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
                        [HDR]_OutlineColor15 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline15 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow15 ("Drop Shadow", Float) = 0
                        _ShadowIntensity15 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness15 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType15 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples15 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset15 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor15 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow15 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient15 ("Gradient", Float) = 0
                        _GradientIntensity15 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode15 ("Direction", Int) = 0
                        [HDR] _GradientColorA15 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB15 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient15 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect15 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting15 ("", Float) = 0
            [DynamicThryLabel] _TextLabel15 ("TextLabel15", Int) = 0

            [HideInInspector][Toggle] _Use16 ("", Float) = 0
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
                        [HDR]_OutlineColor16 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline16 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow16 ("Drop Shadow", Float) = 0
                        _ShadowIntensity16 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness16 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType16 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples16 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset16 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor16 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow16 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient16 ("Gradient", Float) = 0
                        _GradientIntensity16 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode16 ("Direction", Int) = 0
                        [HDR] _GradientColorA16 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB16 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient16 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect16 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting16 ("", Float) = 0
            [DynamicThryLabel] _TextLabel16 ("TextLabel16", Int) = 0

            [HideInInspector][Toggle] _Use17 ("", Float) = 0
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
                        [HDR]_OutlineColor17 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline17 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow17 ("Drop Shadow", Float) = 0
                        _ShadowIntensity17 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness17 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType17 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples17 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset17 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor17 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow17 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient17 ("Gradient", Float) = 0
                        _GradientIntensity17 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode17 ("Direction", Int) = 0
                        [HDR] _GradientColorA17 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB17 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient17 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect17 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting17 ("", Float) = 0
            [DynamicThryLabel] _TextLabel17 ("TextLabel17", Int) = 0

            [HideInInspector][Toggle] _Use18 ("", Float) = 0
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
                        [HDR]_OutlineColor18 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline18 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow18 ("Drop Shadow", Float) = 0
                        _ShadowIntensity18 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness18 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType18 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples18 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset18 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor18 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow18 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient18 ("Gradient", Float) = 0
                        _GradientIntensity18 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode18 ("Direction", Int) = 0
                        [HDR] _GradientColorA18 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB18 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient18 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect18 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting18 ("", Float) = 0
            [DynamicThryLabel] _TextLabel18 ("TextLabel18", Int) = 0

            [HideInInspector][Toggle] _Use19 ("", Float) = 0
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
                        [HDR]_OutlineColor19 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline19 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow19 ("Drop Shadow", Float) = 0
                        _ShadowIntensity19 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness19 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType19 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples19 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset19 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor19 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow19 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient19 ("Gradient", Float) = 0
                        _GradientIntensity19 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode19 ("Direction", Int) = 0
                        [HDR] _GradientColorA19 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB19 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient19 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect19 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting19 ("", Float) = 0
            [DynamicThryLabel] _TextLabel19 ("TextLabel19", Int) = 0

            [HideInInspector][Toggle] _Use20 ("", Float) = 0
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
                        [HDR]_OutlineColor20 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline20 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow20 ("Drop Shadow", Float) = 0
                        _ShadowIntensity20 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness20 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType20 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples20 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset20 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor20 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow20 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient20 ("Gradient", Float) = 0
                        _GradientIntensity20 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode20 ("Direction", Int) = 0
                        [HDR] _GradientColorA20 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB20 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient20 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect20 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting20 ("", Float) = 0
            [DynamicThryLabel] _TextLabel20 ("TextLabel20", Int) = 0

            [HideInInspector][Toggle] _Use21 ("", Float) = 0
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
                        [HDR]_OutlineColor21 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline21 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow21 ("Drop Shadow", Float) = 0
                        _ShadowIntensity21 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness21 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType21 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples21 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset21 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor21 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow21 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient21 ("Gradient", Float) = 0
                        _GradientIntensity21 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode21 ("Direction", Int) = 0
                        [HDR] _GradientColorA21 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB21 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient21 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect21 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting21 ("", Float) = 0
            [DynamicThryLabel] _TextLabel21 ("TextLabel21", Int) = 0

            [HideInInspector][Toggle] _Use22 ("", Float) = 0
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
                        [HDR]_OutlineColor22 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline22 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow22 ("Drop Shadow", Float) = 0
                        _ShadowIntensity22 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness22 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType22 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples22 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset22 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor22 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow22 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient22 ("Gradient", Float) = 0
                        _GradientIntensity22 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode22 ("Direction", Int) = 0
                        [HDR] _GradientColorA22 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB22 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient22 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect22 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting22 ("", Float) = 0
            [DynamicThryLabel] _TextLabel22 ("TextLabel22", Int) = 0

            [HideInInspector][Toggle] _Use23 ("", Float) = 0
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
                        [HDR]_OutlineColor23 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline23 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow23 ("Drop Shadow", Float) = 0
                        _ShadowIntensity23 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness23 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType23 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples23 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset23 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor23 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow23 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient23 ("Gradient", Float) = 0
                        _GradientIntensity23 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode23 ("Direction", Int) = 0
                        [HDR] _GradientColorA23 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB23 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient23 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect23 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting23 ("", Float) = 0
            [DynamicThryLabel] _TextLabel23 ("TextLabel23", Int) = 0

            [HideInInspector][Toggle] _Use24 ("", Float) = 0
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
                        [HDR]_OutlineColor24 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline24 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow24 ("Drop Shadow", Float) = 0
                        _ShadowIntensity24 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness24 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType24 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples24 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset24 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor24 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow24 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient24 ("Gradient", Float) = 0
                        _GradientIntensity24 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode24 ("Direction", Int) = 0
                        [HDR] _GradientColorA24 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB24 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient24 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect24 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting24 ("", Float) = 0
            [DynamicThryLabel] _TextLabel24 ("TextLabel24", Int) = 0

            [HideInInspector][Toggle] _Use25 ("", Float) = 0
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
                        [HDR]_OutlineColor25 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline25 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow25 ("Drop Shadow", Float) = 0
                        _ShadowIntensity25 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness25 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType25 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples25 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset25 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor25 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow25 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient25 ("Gradient", Float) = 0
                        _GradientIntensity25 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode25 ("Direction", Int) = 0
                        [HDR] _GradientColorA25 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB25 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient25 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect25 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting25 ("", Float) = 0
            [DynamicThryLabel] _TextLabel25 ("TextLabel25", Int) = 0

            [HideInInspector][Toggle] _Use26 ("", Float) = 0
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
                        [HDR]_OutlineColor26 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline26 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow26 ("Drop Shadow", Float) = 0
                        _ShadowIntensity26 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness26 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType26 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples26 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset26 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor26 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow26 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient26 ("Gradient", Float) = 0
                        _GradientIntensity26 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode26 ("Direction", Int) = 0
                        [HDR] _GradientColorA26 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB26 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient26 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect26 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting26 ("", Float) = 0
            [DynamicThryLabel] _TextLabel26 ("TextLabel26", Int) = 0

            [HideInInspector][Toggle] _Use27 ("", Float) = 0
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
                        [HDR]_OutlineColor27 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline27 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow27 ("Drop Shadow", Float) = 0
                        _ShadowIntensity27 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness27 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType27 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples27 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset27 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor27 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow27 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient27 ("Gradient", Float) = 0
                        _GradientIntensity27 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode27 ("Direction", Int) = 0
                        [HDR] _GradientColorA27 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB27 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient27 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect27 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting27 ("", Float) = 0
            [DynamicThryLabel] _TextLabel27 ("TextLabel27", Int) = 0

            [HideInInspector][Toggle] _Use28 ("", Float) = 0
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
                        [HDR]_OutlineColor28 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline28 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow28 ("Drop Shadow", Float) = 0
                        _ShadowIntensity28 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness28 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType28 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples28 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset28 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor28 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow28 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient28 ("Gradient", Float) = 0
                        _GradientIntensity28 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode28 ("Direction", Int) = 0
                        [HDR] _GradientColorA28 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB28 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient28 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect28 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting28 ("", Float) = 0
            [DynamicThryLabel] _TextLabel28 ("TextLabel28", Int) = 0

            [HideInInspector][Toggle] _Use29 ("", Float) = 0
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
                        [HDR]_OutlineColor29 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline29 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow29 ("Drop Shadow", Float) = 0
                        _ShadowIntensity29 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness29 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType29 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples29 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset29 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor29 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow29 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient29 ("Gradient", Float) = 0
                        _GradientIntensity29 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode29 ("Direction", Int) = 0
                        [HDR] _GradientColorA29 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB29 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient29 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect29 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting29 ("", Float) = 0
            [DynamicThryLabel] _TextLabel29 ("TextLabel29", Int) = 0

            [HideInInspector][Toggle] _Use30 ("", Float) = 0
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
                        [HDR]_OutlineColor30 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline30 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow30 ("Drop Shadow", Float) = 0
                        _ShadowIntensity30 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness30 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType30 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples30 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset30 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor30 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow30 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient30 ("Gradient", Float) = 0
                        _GradientIntensity30 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode30 ("Direction", Int) = 0
                        [HDR] _GradientColorA30 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB30 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient30 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect30 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting30 ("", Float) = 0
            [DynamicThryLabel] _TextLabel30 ("TextLabel30", Int) = 0

            [HideInInspector][Toggle] _Use31 ("", Float) = 0
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
                        [HDR]_OutlineColor31 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_outline31 ("Outline", Float) = 0

                    [HideInInspector] m_start_shadow31 ("Drop Shadow", Float) = 0
                        _ShadowIntensity31 ("Intensity", Range(0, 1)) = 0
                        _ShadowSoftness31 ("Softness", Range(0, 1)) = 0
                        [Enum(Hash, 0, IGN, 1, R2, 2)] _ShadowDitherType31 ("Dither", Int) = 2
                        [IntRange] _ShadowSamples31 ("Samples", Range(4, 32)) = 8
                        [Vector2]_ShadowOffset31 ("Offset", Vector) = (0.05, -0.05, 0, 0)
                        [HDR]_ShadowColor31 ("Color", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_shadow31 ("Drop Shadow", Float) = 0

                    [HideInInspector] m_start_gradient31 ("Gradient", Float) = 0
                        _GradientIntensity31 ("Intensity", Range(0, 1)) = 0
                        [Enum(Horizontal, 0, Vertical, 1)] _GradientMode31 ("Direction", Int) = 0
                        [HDR] _GradientColorA31 ("Color A", Color) = (1, 1, 1, 1)
                        [HDR] _GradientColorB31 ("Color B", Color) = (0, 0, 0, 1)
                    [HideInInspector] m_end_gradient31 ("Gradient", Float) = 0

                [HideInInspector] m_end_effect31 ("Effector", Float) = 0
            [HideInInspector] m_end_text_setting31 ("", Float) = 0
            [DynamicThryLabel] _TextLabel31 ("TextLabel31", Int) = 0


        [HideInInspector] m_end_text_setting ("Text Settings", Float) = 0

        [HideInInspector] m_start_rendering_settings ("Rendering Settings", Float) = 0
            _FadeMin ("Fade Min", Float) = 0
            _FadeMax ("Fade Max", Float) = 20
            [ThryWideEnum(Opaque, 0, Transparent, 1, Overlay, 2)] _RenderType ("Render Type", Int) = 1
            [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0
            [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
            [Enum(UnityEngine.Rendering.BlendMode)] _SourceBlend ("Source Blend", Float) = 1
            [Enum(UnityEngine.Rendering.BlendMode)] _DestinationBlend ("Destination Blend", Float) = 10
            [Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Int) = 0

            [HideInInspector] m_start_stencil ("Stencil", Float) = 0
                [IntRange] _StencilRef ("Reference", Range(0, 255)) = 0
                [IntRange] _StencilReadMask ("Read Mask", Range(0, 255)) = 255
                [IntRange] _StencilWriteMask ("Write Mask", Range(0, 255)) = 255
                [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Compare", Int) = 8
                [Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("Pass", Int) = 0
                [Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("Fail", Int) = 0
                [Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("ZFail", Int) = 0
            [HideInInspector] m_end_stencil ("Stencil", Float) = 0

            [HideInInspector] m_start_utility_settings ("Utility", Float) = 0
                _AlphaCutoff ("Alpha Cutoff", Range(0, 1)) = 0.0001
                _QuadPadding ("Quad Padding", Range(0, 1)) = 0.5
                _VRScale ("VR Scale", Range(0.1, 1)) = 0.5
            [HideInInspector] m_end_utility_settings ("Utility", Float) = 0

            [HideInInspector] m_start_internal_settings ("Internal", Float) = 0
                    _FontTextureArray ("Font Texture Array", 2DArray) = "" {}
                    _DataTexture ("Data Texture", 2D) = "" {}
                    _AtlasSize ("Atlas Size", float) = 32.0
                    _AtlasInvSize ("Atlas Inv Size", Float) = 0.03125
                    _AtlasMask ("Atlas Mask", Int) = 31
                    _AtlasShift ("Atlas Shift", Int) = 5
                    _AtlasCellSize ("Atlas Cell Size", Float) = 128.0
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

        Stencil
        {
            Ref [_StencilRef]
            ReadMask [_StencilReadMask]
            WriteMask [_StencilWriteMask]
            Comp [_StencilComp]
            Pass [_StencilPass]
            Fail [_StencilFail]
            ZFail [_StencilZFail]
        }

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
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"

            // Font texture array (declared before includes because Effects.hlsl uses it)
            UNITY_DECLARE_TEX2DARRAY(_FontTextureArray);

            // Atlas parameters (declared before includes because Effects.hlsl uses them)
            float _AtlasInvSize;
            int _AtlasMask;
            int _AtlasShift;
            float _AtlasCellSize;
            float _AtlasHalfInvPxRange;

            #include "Include/Core.hlsl"
            #include "Include/Effects.hlsl"
            #include "Include/Macros.hlsl"

            // ============================================================================
            // Textures and Properties
            // ============================================================================
            Texture2D _DataTexture;
            float4 _DataTexture_TexelSize;
            float _AtlasSize;

            // Camera
            float4 _CameraPosition;
            float4 _CameraRotation;
            float _CameraFOV;
            float _VRScale;

            // Fade, Alpha Cutoff, Quad Padding
            float _AlphaCutoff;
            float _FadeMin;
            float _FadeMax;
            float _QuadPadding;

            // Root Transforms (5 roots) - precomputed matrices
            float4 _RootPosition0, _RootPosition1, _RootPosition2, _RootPosition3, _RootPosition4;
            float4 _RootMatrix0_Row0, _RootMatrix0_Row1, _RootMatrix0_Row2;
            float4 _RootMatrix1_Row0, _RootMatrix1_Row1, _RootMatrix1_Row2;
            float4 _RootMatrix2_Row0, _RootMatrix2_Row1, _RootMatrix2_Row2;
            float4 _RootMatrix3_Row0, _RootMatrix3_Row1, _RootMatrix3_Row2;
            float4 _RootMatrix4_Row0, _RootMatrix4_Row1, _RootMatrix4_Row2;

            // Declare all text variables (using macro from Macros.hlsl)
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
                o.packed_info = (2u << 8) | (8u << 16);  // default: R2 dither (bits 8-15), 8 samples (bits 16-23)
                o.anim_params = float4(1.0, 0.0, 0.0, 1.0);  // anim_factor=1, shake=(0,0), fade=1
                o.quad_block = float2(1.0, 1.0);  // x=quad_padding, y=block_fade
                o.text_color = float4(1, 1, 1, 1);
                o.outline = float4(0, 0, 0, 0);
                o.shadow = float4(0, 0, 0, 0);
                o.shadow_color = float4(0, 0, 0, 0);
                o.gradient = float4(0, 0, 0, 0);

                // Decode from UV
                int char_pos = (int)floor(v.uv.x * 256.0);
                int text_id = (int)floor(v.uv.y * 32.0);

                // Camera setup (shared)
                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                float distance_fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

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

                // Apply distance-based fade
                o.anim_params.w *= distance_fade;

                return o;
            }

            // ============================================================================
            // Fragment Shader
            // ============================================================================
            float4 frag(v2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                // Unpack from packed structures
                uint font_index = i.packed_info & 0xFFu;
                float anim_factor = i.anim_params.x;
                float2 shake_offset = i.anim_params.yz;
                float fade = i.anim_params.w;

                float2 glyph_uv = i.glyph_uv + shake_offset;
                float opacity_mult = (1.0 - anim_factor) * fade;

                half3 accum_color = half3(0, 0, 0);
                half accum_alpha = 0.0;

                // MSDF rendering with effects
                EffectParams params;
                params.text_color = i.text_color;
                params.outline = i.outline;
                params.shadow = i.shadow;
                params.shadow_color = i.shadow_color;
                params.gradient = i.gradient;

                apply_effects(accum_color, accum_alpha, glyph_uv, i.char_index, font_index, opacity_mult, params, i.vertex.xy, i.quad_block.x, i.packed_info);

                // Clip based on accumulated alpha (before block fade)
                clip(accum_alpha - _AlphaCutoff);

                // Apply block fade after clip (for smooth Block animation)
                accum_alpha *= i.quad_block.y;

                return float4(accum_color, accum_alpha);
            }
            ENDCG
        }
    }
}
