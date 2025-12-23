Shader "GekikaraStore/Imagery"
{
    Properties
    {
        [HideInInspector] shader_is_using_thry_editor("", Float) = 0
        [HideInInspector] shader_master_label("<b><i><color=#808080>I</color><color=#AAAAAA>m</color><color=#D4D4D4>a</color><color=#FFFFFF>g</color><color=#D4D4D4>e</color><color=#AAAAAA>r</color><color=#808080>y</color></i></b>", Float) = 0

        [HideInInspector] m_start_camera_setting ("Camera Settings", Float) = 0
            [Vector3] _CameraPosition ("Position", Vector) = (0, 0, -100, 0)
            [Vector3] _CameraRotation ("Rotation", Vector) = (0, 0, 0, 0)
            _CameraFOV ("FOV", Range(10, 120)) = 60.0
        [HideInInspector] m_end_camera_setting ("Camera Settings", Float) = 0

        [HideInInspector] m_start_image_setting ("Image Settings", Float) = 0

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
            [HideInInspector] m_start_image_setting0 (" --{reference_property:_Use0}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace0 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex0 ("Root", Int) = 0
                _ImageTexture0 ("Image", 2D) = "white" {}
                [IntRange] _Layer0 ("Layer", Range(0, 31)) = 0
                [HDR] _Color0 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position0 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation0 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale0 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot0 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting0 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel0 ("Image 0", Int) = 0

            [HideInInspector][Toggle] _Use1 ("", Float) = 0
            [HideInInspector] m_start_image_setting1 (" --{reference_property:_Use1}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace1 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex1 ("Root", Int) = 0
                _ImageTexture1 ("Image", 2D) = "white" {}
                [IntRange] _Layer1 ("Layer", Range(0, 31)) = 1
                [HDR] _Color1 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position1 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation1 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale1 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot1 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting1 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel1 ("Image 1", Int) = 0

            [HideInInspector][Toggle] _Use2 ("", Float) = 0
            [HideInInspector] m_start_image_setting2 (" --{reference_property:_Use2}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace2 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex2 ("Root", Int) = 0
                _ImageTexture2 ("Image", 2D) = "white" {}
                [IntRange] _Layer2 ("Layer", Range(0, 31)) = 2
                [HDR] _Color2 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position2 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation2 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale2 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot2 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting2 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel2 ("Image 2", Int) = 0

            [HideInInspector][Toggle] _Use3 ("", Float) = 0
            [HideInInspector] m_start_image_setting3 (" --{reference_property:_Use3}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace3 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex3 ("Root", Int) = 0
                _ImageTexture3 ("Image", 2D) = "white" {}
                [IntRange] _Layer3 ("Layer", Range(0, 31)) = 3
                [HDR] _Color3 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position3 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation3 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale3 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot3 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting3 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel3 ("Image 3", Int) = 0

            [HideInInspector][Toggle] _Use4 ("", Float) = 0
            [HideInInspector] m_start_image_setting4 (" --{reference_property:_Use4}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace4 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex4 ("Root", Int) = 0
                _ImageTexture4 ("Image", 2D) = "white" {}
                [IntRange] _Layer4 ("Layer", Range(0, 31)) = 4
                [HDR] _Color4 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position4 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation4 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale4 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot4 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting4 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel4 ("Image 4", Int) = 0

            [HideInInspector][Toggle] _Use5 ("", Float) = 0
            [HideInInspector] m_start_image_setting5 (" --{reference_property:_Use5}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace5 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex5 ("Root", Int) = 0
                _ImageTexture5 ("Image", 2D) = "white" {}
                [IntRange] _Layer5 ("Layer", Range(0, 31)) = 5
                [HDR] _Color5 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position5 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation5 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale5 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot5 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting5 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel5 ("Image 5", Int) = 0

            [HideInInspector][Toggle] _Use6 ("", Float) = 0
            [HideInInspector] m_start_image_setting6 (" --{reference_property:_Use6}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace6 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex6 ("Root", Int) = 0
                _ImageTexture6 ("Image", 2D) = "white" {}
                [IntRange] _Layer6 ("Layer", Range(0, 31)) = 6
                [HDR] _Color6 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position6 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation6 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale6 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot6 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting6 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel6 ("Image 6", Int) = 0

            [HideInInspector][Toggle] _Use7 ("", Float) = 0
            [HideInInspector] m_start_image_setting7 (" --{reference_property:_Use7}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace7 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex7 ("Root", Int) = 0
                _ImageTexture7 ("Image", 2D) = "white" {}
                [IntRange] _Layer7 ("Layer", Range(0, 31)) = 7
                [HDR] _Color7 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position7 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation7 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale7 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot7 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting7 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel7 ("Image 7", Int) = 0

            [HideInInspector][Toggle] _Use8 ("", Float) = 0
            [HideInInspector] m_start_image_setting8 (" --{reference_property:_Use8}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace8 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex8 ("Root", Int) = 0
                _ImageTexture8 ("Image", 2D) = "white" {}
                [IntRange] _Layer8 ("Layer", Range(0, 31)) = 8
                [HDR] _Color8 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position8 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation8 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale8 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot8 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting8 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel8 ("Image 8", Int) = 0

            [HideInInspector][Toggle] _Use9 ("", Float) = 0
            [HideInInspector] m_start_image_setting9 (" --{reference_property:_Use9}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace9 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex9 ("Root", Int) = 0
                _ImageTexture9 ("Image", 2D) = "white" {}
                [IntRange] _Layer9 ("Layer", Range(0, 31)) = 9
                [HDR] _Color9 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position9 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation9 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale9 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot9 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting9 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel9 ("Image 9", Int) = 0

            [HideInInspector][Toggle] _Use10 ("", Float) = 0
            [HideInInspector] m_start_image_setting10 (" --{reference_property:_Use10}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace10 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex10 ("Root", Int) = 0
                _ImageTexture10 ("Image", 2D) = "white" {}
                [IntRange] _Layer10 ("Layer", Range(0, 31)) = 10
                [HDR] _Color10 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position10 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation10 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale10 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot10 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting10 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel10 ("Image 10", Int) = 0

            [HideInInspector][Toggle] _Use11 ("", Float) = 0
            [HideInInspector] m_start_image_setting11 (" --{reference_property:_Use11}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace11 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex11 ("Root", Int) = 0
                _ImageTexture11 ("Image", 2D) = "white" {}
                [IntRange] _Layer11 ("Layer", Range(0, 31)) = 11
                [HDR] _Color11 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position11 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation11 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale11 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot11 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting11 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel11 ("Image 11", Int) = 0

            [HideInInspector][Toggle] _Use12 ("", Float) = 0
            [HideInInspector] m_start_image_setting12 (" --{reference_property:_Use12}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace12 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex12 ("Root", Int) = 0
                _ImageTexture12 ("Image", 2D) = "white" {}
                [IntRange] _Layer12 ("Layer", Range(0, 31)) = 12
                [HDR] _Color12 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position12 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation12 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale12 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot12 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting12 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel12 ("Image 12", Int) = 0

            [HideInInspector][Toggle] _Use13 ("", Float) = 0
            [HideInInspector] m_start_image_setting13 (" --{reference_property:_Use13}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace13 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex13 ("Root", Int) = 0
                _ImageTexture13 ("Image", 2D) = "white" {}
                [IntRange] _Layer13 ("Layer", Range(0, 31)) = 13
                [HDR] _Color13 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position13 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation13 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale13 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot13 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting13 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel13 ("Image 13", Int) = 0

            [HideInInspector][Toggle] _Use14 ("", Float) = 0
            [HideInInspector] m_start_image_setting14 (" --{reference_property:_Use14}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace14 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex14 ("Root", Int) = 0
                _ImageTexture14 ("Image", 2D) = "white" {}
                [IntRange] _Layer14 ("Layer", Range(0, 31)) = 14
                [HDR] _Color14 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position14 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation14 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale14 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot14 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting14 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel14 ("Image 14", Int) = 0

            [HideInInspector][Toggle] _Use15 ("", Float) = 0
            [HideInInspector] m_start_image_setting15 (" --{reference_property:_Use15}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace15 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex15 ("Root", Int) = 0
                _ImageTexture15 ("Image", 2D) = "white" {}
                [IntRange] _Layer15 ("Layer", Range(0, 31)) = 15
                [HDR] _Color15 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position15 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation15 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale15 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot15 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting15 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel15 ("Image 15", Int) = 0

            [HideInInspector][Toggle] _Use16 ("", Float) = 0
            [HideInInspector] m_start_image_setting16 (" --{reference_property:_Use16}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace16 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex16 ("Root", Int) = 0
                _ImageTexture16 ("Image", 2D) = "white" {}
                [IntRange] _Layer16 ("Layer", Range(0, 31)) = 16
                [HDR] _Color16 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position16 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation16 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale16 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot16 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting16 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel16 ("Image 16", Int) = 0

            [HideInInspector][Toggle] _Use17 ("", Float) = 0
            [HideInInspector] m_start_image_setting17 (" --{reference_property:_Use17}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace17 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex17 ("Root", Int) = 0
                _ImageTexture17 ("Image", 2D) = "white" {}
                [IntRange] _Layer17 ("Layer", Range(0, 31)) = 17
                [HDR] _Color17 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position17 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation17 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale17 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot17 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting17 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel17 ("Image 17", Int) = 0

            [HideInInspector][Toggle] _Use18 ("", Float) = 0
            [HideInInspector] m_start_image_setting18 (" --{reference_property:_Use18}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace18 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex18 ("Root", Int) = 0
                _ImageTexture18 ("Image", 2D) = "white" {}
                [IntRange] _Layer18 ("Layer", Range(0, 31)) = 18
                [HDR] _Color18 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position18 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation18 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale18 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot18 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting18 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel18 ("Image 18", Int) = 0

            [HideInInspector][Toggle] _Use19 ("", Float) = 0
            [HideInInspector] m_start_image_setting19 (" --{reference_property:_Use19}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace19 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex19 ("Root", Int) = 0
                _ImageTexture19 ("Image", 2D) = "white" {}
                [IntRange] _Layer19 ("Layer", Range(0, 31)) = 19
                [HDR] _Color19 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position19 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation19 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale19 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot19 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting19 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel19 ("Image 19", Int) = 0

            [HideInInspector][Toggle] _Use20 ("", Float) = 0
            [HideInInspector] m_start_image_setting20 (" --{reference_property:_Use20}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace20 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex20 ("Root", Int) = 0
                _ImageTexture20 ("Image", 2D) = "white" {}
                [IntRange] _Layer20 ("Layer", Range(0, 31)) = 20
                [HDR] _Color20 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position20 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation20 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale20 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot20 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting20 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel20 ("Image 20", Int) = 0

            [HideInInspector][Toggle] _Use21 ("", Float) = 0
            [HideInInspector] m_start_image_setting21 (" --{reference_property:_Use21}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace21 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex21 ("Root", Int) = 0
                _ImageTexture21 ("Image", 2D) = "white" {}
                [IntRange] _Layer21 ("Layer", Range(0, 31)) = 21
                [HDR] _Color21 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position21 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation21 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale21 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot21 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting21 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel21 ("Image 21", Int) = 0

            [HideInInspector][Toggle] _Use22 ("", Float) = 0
            [HideInInspector] m_start_image_setting22 (" --{reference_property:_Use22}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace22 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex22 ("Root", Int) = 0
                _ImageTexture22 ("Image", 2D) = "white" {}
                [IntRange] _Layer22 ("Layer", Range(0, 31)) = 22
                [HDR] _Color22 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position22 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation22 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale22 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot22 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting22 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel22 ("Image 22", Int) = 0

            [HideInInspector][Toggle] _Use23 ("", Float) = 0
            [HideInInspector] m_start_image_setting23 (" --{reference_property:_Use23}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace23 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex23 ("Root", Int) = 0
                _ImageTexture23 ("Image", 2D) = "white" {}
                [IntRange] _Layer23 ("Layer", Range(0, 31)) = 23
                [HDR] _Color23 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position23 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation23 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale23 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot23 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting23 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel23 ("Image 23", Int) = 0

            [HideInInspector][Toggle] _Use24 ("", Float) = 0
            [HideInInspector] m_start_image_setting24 (" --{reference_property:_Use24}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace24 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex24 ("Root", Int) = 0
                _ImageTexture24 ("Image", 2D) = "white" {}
                [IntRange] _Layer24 ("Layer", Range(0, 31)) = 24
                [HDR] _Color24 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position24 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation24 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale24 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot24 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting24 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel24 ("Image 24", Int) = 0

            [HideInInspector][Toggle] _Use25 ("", Float) = 0
            [HideInInspector] m_start_image_setting25 (" --{reference_property:_Use25}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace25 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex25 ("Root", Int) = 0
                _ImageTexture25 ("Image", 2D) = "white" {}
                [IntRange] _Layer25 ("Layer", Range(0, 31)) = 25
                [HDR] _Color25 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position25 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation25 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale25 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot25 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting25 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel25 ("Image 25", Int) = 0

            [HideInInspector][Toggle] _Use26 ("", Float) = 0
            [HideInInspector] m_start_image_setting26 (" --{reference_property:_Use26}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace26 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex26 ("Root", Int) = 0
                _ImageTexture26 ("Image", 2D) = "white" {}
                [IntRange] _Layer26 ("Layer", Range(0, 31)) = 26
                [HDR] _Color26 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position26 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation26 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale26 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot26 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting26 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel26 ("Image 26", Int) = 0

            [HideInInspector][Toggle] _Use27 ("", Float) = 0
            [HideInInspector] m_start_image_setting27 (" --{reference_property:_Use27}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace27 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex27 ("Root", Int) = 0
                _ImageTexture27 ("Image", 2D) = "white" {}
                [IntRange] _Layer27 ("Layer", Range(0, 31)) = 27
                [HDR] _Color27 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position27 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation27 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale27 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot27 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting27 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel27 ("Image 27", Int) = 0

            [HideInInspector][Toggle] _Use28 ("", Float) = 0
            [HideInInspector] m_start_image_setting28 (" --{reference_property:_Use28}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace28 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex28 ("Root", Int) = 0
                _ImageTexture28 ("Image", 2D) = "white" {}
                [IntRange] _Layer28 ("Layer", Range(0, 31)) = 28
                [HDR] _Color28 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position28 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation28 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale28 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot28 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting28 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel28 ("Image 28", Int) = 0

            [HideInInspector][Toggle] _Use29 ("", Float) = 0
            [HideInInspector] m_start_image_setting29 (" --{reference_property:_Use29}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace29 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex29 ("Root", Int) = 0
                _ImageTexture29 ("Image", 2D) = "white" {}
                [IntRange] _Layer29 ("Layer", Range(0, 31)) = 29
                [HDR] _Color29 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position29 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation29 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale29 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot29 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting29 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel29 ("Image 29", Int) = 0

            [HideInInspector][Toggle] _Use30 ("", Float) = 0
            [HideInInspector] m_start_image_setting30 (" --{reference_property:_Use30}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace30 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex30 ("Root", Int) = 0
                _ImageTexture30 ("Image", 2D) = "white" {}
                [IntRange] _Layer30 ("Layer", Range(0, 31)) = 30
                [HDR] _Color30 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position30 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation30 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale30 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot30 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting30 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel30 ("Image 30", Int) = 0

            [HideInInspector][Toggle] _Use31 ("", Float) = 0
            [HideInInspector] m_start_image_setting31 (" --{reference_property:_Use31}", Float) = 0
                [Enum(Screen, 0, World, 1)] _WorldSpace31 ("Space", Int) = 0
                [Enum(None, 0, Root 1, 1, Root 2, 2, Root 3, 3, Root 4, 4, Root 5, 5)] _RootIndex31 ("Root", Int) = 0
                _ImageTexture31 ("Image", 2D) = "white" {}
                [IntRange] _Layer31 ("Layer", Range(0, 31)) = 31
                [HDR] _Color31 ("Color", Color) = (1, 1, 1, 1)
                [Vector3] _Position31 ("Position", Vector) = (0, 0, 50, 0)
                [Vector3] _Rotation31 ("Rotation", Vector) = (0, 0, 0, 0)
                [Vector3] _Scale31 ("Scale", Vector) = (1, 1, 1, 0)
                [Vector2] _Pivot31 ("Pivot", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_image_setting31 ("", Float) = 0
            [DynamicThryLabel] _ImageLabel31 ("Image 31", Int) = 0

        [HideInInspector] m_end_image_setting ("Image Settings", Float) = 0

        [HideInInspector] m_start_rendering_settings ("Rendering Settings", Float) = 0
            _FadeMin ("Fade Min", Float) = 0
            _FadeMax ("Fade Max", Float) = 20
            [ThryWideEnum(Opaque, 0, Transparent, 1, Overlay, 2)] _RenderType ("Render Type", Int) = 1
            [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0
            [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 6
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
                _VRScale ("VR Scale", Range(0.1, 1)) = 0.5
            [HideInInspector] m_end_utility_settings ("Utility", Float) = 0
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
            #pragma multi_compile_instancing
            #pragma target 4.5

            #include "UnityCG.cginc"

            #define EPSILON 1e-6
            #define DEG2RAD 0.017453292519943295
            #define CM_TO_METER_SCALE 0.01
            #define IMAGE_COUNT 32
            #define SCREEN_SPACE_DEPTH_MAX 0.05
            #define WORLD_SPACE_DEPTH_MIN 0.05

            uniform float _VRChatMirrorMode;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 image_uv : TEXCOORD0;
                nointerpolation uint image_id : TEXCOORD1;
                nointerpolation float4 color : TEXCOORD2;
                nointerpolation float fade : TEXCOORD3;
                UNITY_VERTEX_OUTPUT_STEREO
            };

            Texture2D _ImageTexture0, _ImageTexture1, _ImageTexture2, _ImageTexture3;
            Texture2D _ImageTexture4, _ImageTexture5, _ImageTexture6, _ImageTexture7;
            Texture2D _ImageTexture8, _ImageTexture9, _ImageTexture10, _ImageTexture11;
            Texture2D _ImageTexture12, _ImageTexture13, _ImageTexture14, _ImageTexture15;
            Texture2D _ImageTexture16, _ImageTexture17, _ImageTexture18, _ImageTexture19;
            Texture2D _ImageTexture20, _ImageTexture21, _ImageTexture22, _ImageTexture23;
            Texture2D _ImageTexture24, _ImageTexture25, _ImageTexture26, _ImageTexture27;
            Texture2D _ImageTexture28, _ImageTexture29, _ImageTexture30, _ImageTexture31;
            SamplerState sampler_linear_repeat;

            float4 _CameraPosition, _CameraRotation;
            float _CameraFOV, _VRScale, _FadeMin, _FadeMax, _AlphaCutoff;

            float4 _RootPosition0, _RootPosition1, _RootPosition2, _RootPosition3, _RootPosition4;
            float4 _RootMatrix0_Row0, _RootMatrix0_Row1, _RootMatrix0_Row2;
            float4 _RootMatrix1_Row0, _RootMatrix1_Row1, _RootMatrix1_Row2;
            float4 _RootMatrix2_Row0, _RootMatrix2_Row1, _RootMatrix2_Row2;
            float4 _RootMatrix3_Row0, _RootMatrix3_Row1, _RootMatrix3_Row2;
            float4 _RootMatrix4_Row0, _RootMatrix4_Row1, _RootMatrix4_Row2;

            #define DECLARE_IMAGE_VARS(N) \
                float _Use##N; \
                int _WorldSpace##N; \
                int _RootIndex##N; \
                int _Layer##N; \
                float4 _Color##N; \
                float4 _Position##N; \
                float4 _Rotation##N; \
                float4 _Scale##N; \
                float4 _Pivot##N;

            DECLARE_IMAGE_VARS(0)  DECLARE_IMAGE_VARS(1)  DECLARE_IMAGE_VARS(2)  DECLARE_IMAGE_VARS(3)
            DECLARE_IMAGE_VARS(4)  DECLARE_IMAGE_VARS(5)  DECLARE_IMAGE_VARS(6)  DECLARE_IMAGE_VARS(7)
            DECLARE_IMAGE_VARS(8)  DECLARE_IMAGE_VARS(9)  DECLARE_IMAGE_VARS(10) DECLARE_IMAGE_VARS(11)
            DECLARE_IMAGE_VARS(12) DECLARE_IMAGE_VARS(13) DECLARE_IMAGE_VARS(14) DECLARE_IMAGE_VARS(15)
            DECLARE_IMAGE_VARS(16) DECLARE_IMAGE_VARS(17) DECLARE_IMAGE_VARS(18) DECLARE_IMAGE_VARS(19)
            DECLARE_IMAGE_VARS(20) DECLARE_IMAGE_VARS(21) DECLARE_IMAGE_VARS(22) DECLARE_IMAGE_VARS(23)
            DECLARE_IMAGE_VARS(24) DECLARE_IMAGE_VARS(25) DECLARE_IMAGE_VARS(26) DECLARE_IMAGE_VARS(27)
            DECLARE_IMAGE_VARS(28) DECLARE_IMAGE_VARS(29) DECLARE_IMAGE_VARS(30) DECLARE_IMAGE_VARS(31)

            float3x3 rotation_matrix(float3 rotation)
            {
                float sx, cx, sy, cy, sz, cz;
                sincos(rotation.x, sx, cx);
                sincos(rotation.y, sy, cy);
                sincos(rotation.z, sz, cz);
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

            inline bool is_vr()
            {
                #if defined(USING_STEREO_MATRICES)
                    return true;
                #else
                    return _VRChatMirrorMode == 1.0;
                #endif
            }

            float4 project_world_space(float3 world_pos)
            {
                float4 clip = mul(UNITY_MATRIX_VP, float4(world_pos, 1.0));
                float ndc_z = clip.z / clip.w;
                #if defined(UNITY_REVERSED_Z)
                    float remapped_z = ndc_z * (1.0 - WORLD_SPACE_DEPTH_MIN);
                #else
                    float remapped_z = lerp(WORLD_SPACE_DEPTH_MIN, 1.0, ndc_z);
                #endif
                return float4(clip.xy, remapped_z * clip.w, clip.w);
            }

            float4 project_custom_camera(float3 world_pos, float3 cam_pos, float3x3 cam_rot, float tan_half_fov, float aspect, int layer)
            {
                float3 relative = world_pos - cam_pos;
                float3 view_pos = mul(transpose(cam_rot), relative);
                view_pos.yz = -view_pos.yz;  // Convert to standard camera coords
                if (view_pos.z >= -EPSILON)  // After flip, z < 0 is in front
                    return float4(0, 0, -1, 1);
                float w = -view_pos.z;  // Positive w for depth
                float2 clip;
                clip.x = view_pos.x / (tan_half_fov * aspect);
                clip.y = view_pos.y / tan_half_fov;
                float layer_depth = (layer + 0.5) / 32.0 * SCREEN_SPACE_DEPTH_MAX;
                #if defined(UNITY_REVERSED_Z)
                    float depth = 1.0 - layer_depth;
                #else
                    float depth = layer_depth;
                #endif
                return float4(clip.x, clip.y, depth * w, w);
            }

            #define PROCESS_IMAGE(N) \
            { \
                if (_Use##N < 0.5) { o.vertex = float4(0,0,-1,1); return o; } \
                float vr_scale = is_vr() ? _VRScale : 1.0; \
                float3 local_pos = float3(0, 0, 0); \
                float3 image_translation = _Position##N.xyz * CM_TO_METER_SCALE * vr_scale; \
                float3 rot_rad = _Rotation##N.xyz * DEG2RAD; \
                float3x3 image_rot = rotation_matrix(rot_rad); \
                float3 image_scale = _Scale##N.xyz * vr_scale; \
                float3 pivot = _Pivot##N.xyz * 0.1; \
                float3x3 rotation_scale = float3x3( \
                    image_rot._m00 * image_scale.x, image_rot._m01 * image_scale.y, image_rot._m02 * image_scale.z, \
                    image_rot._m10 * image_scale.x, image_rot._m11 * image_scale.y, image_rot._m12 * image_scale.z, \
                    image_rot._m20 * image_scale.x, image_rot._m21 * image_scale.y, image_rot._m22 * image_scale.z); \
                float3 pivot_offset = pivot - mul(rotation_scale, pivot); \
                float3 world_pos = mul(rotation_scale, local_pos) + image_translation + pivot_offset; \
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
                    world_pos = mul(root_matrix_cached, world_pos) + root_pos_cached * CM_TO_METER_SCALE * vr_scale; \
                } \
                float3 relative_to_cam = world_pos - cam_pos; \
                float3 view_pos = mul(transpose(cam_rot), relative_to_cam); \
                view_pos.yz = -view_pos.yz; \
                if (view_pos.z >= 0) { o.vertex = float4(0,0,-1,1); return o; } \
                float image_half_size = 0.05; \
                float3x3 image_rotation_scale = rotation_scale; \
                if (_RootIndex##N > 0) { image_rotation_scale = mul(root_matrix_cached, image_rotation_scale); } \
                float3 world_right = image_rotation_scale._m00_m10_m20 * image_half_size; \
                float3 world_up = image_rotation_scale._m01_m11_m21 * image_half_size; \
                float3 corner_offset = (v.uv2.x - 0.5) * 2.0 * world_right + (v.uv2.y - 0.5) * 2.0 * world_up; \
                float3 corner_world = world_pos + corner_offset; \
                if (_WorldSpace##N == 1) { o.vertex = project_world_space(corner_world); } \
                else { o.vertex = project_custom_camera(corner_world, cam_pos, cam_rot, tan_half_fov, aspect, _Layer##N); } \
                o.color = _Color##N; \
            }

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.vertex = float4(0, 0, -1, 1);
                o.image_uv = v.uv2;
                o.image_id = 0;
                o.color = float4(1, 1, 1, 1);
                o.fade = 1.0;

                uint image_id = (uint)(v.uv.x + 0.5);
                o.image_id = image_id;

                float3 unity_camera_pos = get_camera_position();
                float dist = distance(unity_camera_pos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz);
                o.fade = saturate(1.0 - (dist - _FadeMin) / (_FadeMax - _FadeMin + EPSILON));

                float3 cam_pos = _CameraPosition.xyz * CM_TO_METER_SCALE;
                float3x3 cam_rot = rotation_matrix(_CameraRotation.xyz * DEG2RAD);
                float tan_half_fov = tan(_CameraFOV * DEG2RAD * 0.5);
                float aspect = _ScreenParams.x / _ScreenParams.y;

                switch(image_id)
                {
                    case 0: PROCESS_IMAGE(0); break;   case 1: PROCESS_IMAGE(1); break;
                    case 2: PROCESS_IMAGE(2); break;   case 3: PROCESS_IMAGE(3); break;
                    case 4: PROCESS_IMAGE(4); break;   case 5: PROCESS_IMAGE(5); break;
                    case 6: PROCESS_IMAGE(6); break;   case 7: PROCESS_IMAGE(7); break;
                    case 8: PROCESS_IMAGE(8); break;   case 9: PROCESS_IMAGE(9); break;
                    case 10: PROCESS_IMAGE(10); break; case 11: PROCESS_IMAGE(11); break;
                    case 12: PROCESS_IMAGE(12); break; case 13: PROCESS_IMAGE(13); break;
                    case 14: PROCESS_IMAGE(14); break; case 15: PROCESS_IMAGE(15); break;
                    case 16: PROCESS_IMAGE(16); break; case 17: PROCESS_IMAGE(17); break;
                    case 18: PROCESS_IMAGE(18); break; case 19: PROCESS_IMAGE(19); break;
                    case 20: PROCESS_IMAGE(20); break; case 21: PROCESS_IMAGE(21); break;
                    case 22: PROCESS_IMAGE(22); break; case 23: PROCESS_IMAGE(23); break;
                    case 24: PROCESS_IMAGE(24); break; case 25: PROCESS_IMAGE(25); break;
                    case 26: PROCESS_IMAGE(26); break; case 27: PROCESS_IMAGE(27); break;
                    case 28: PROCESS_IMAGE(28); break; case 29: PROCESS_IMAGE(29); break;
                    case 30: PROCESS_IMAGE(30); break; case 31: PROCESS_IMAGE(31); break;
                }

                return o;
            }

            half4 frag(v2f i) : SV_Target
            {
                float4 image_color = float4(1, 1, 1, 1);
                switch(i.image_id)
                {
                    case 0: image_color = _ImageTexture0.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 1: image_color = _ImageTexture1.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 2: image_color = _ImageTexture2.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 3: image_color = _ImageTexture3.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 4: image_color = _ImageTexture4.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 5: image_color = _ImageTexture5.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 6: image_color = _ImageTexture6.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 7: image_color = _ImageTexture7.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 8: image_color = _ImageTexture8.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 9: image_color = _ImageTexture9.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 10: image_color = _ImageTexture10.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 11: image_color = _ImageTexture11.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 12: image_color = _ImageTexture12.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 13: image_color = _ImageTexture13.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 14: image_color = _ImageTexture14.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 15: image_color = _ImageTexture15.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 16: image_color = _ImageTexture16.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 17: image_color = _ImageTexture17.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 18: image_color = _ImageTexture18.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 19: image_color = _ImageTexture19.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 20: image_color = _ImageTexture20.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 21: image_color = _ImageTexture21.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 22: image_color = _ImageTexture22.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 23: image_color = _ImageTexture23.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 24: image_color = _ImageTexture24.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 25: image_color = _ImageTexture25.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 26: image_color = _ImageTexture26.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 27: image_color = _ImageTexture27.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 28: image_color = _ImageTexture28.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 29: image_color = _ImageTexture29.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 30: image_color = _ImageTexture30.Sample(sampler_linear_repeat, i.image_uv); break;
                    case 31: image_color = _ImageTexture31.Sample(sampler_linear_repeat, i.image_uv); break;
                }

                float4 final_color = image_color * i.color;
                final_color.a *= i.fade;
                clip(final_color.a - _AlphaCutoff);

                return half4(final_color.rgb, final_color.a);
            }
            ENDCG
        }
    }
}
