#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace Typography.Editor
{
    public class TypographyDebugger : EditorWindow
    {
        #region Constants

        // Core
        private const int TextCount = 32;
        private const int RootCount = 5;
        private const float CmToM = 0.01f;
        private const float MtoCm = 100f;
        private const float TextGlyphScale = 0.1f;
        private const string TagTextPrefix = "_TextInput_Text_";
        private const float PivotRadius = 0.005f;

        // Handle sizes
        private const float HandleScreenSize = 60f;
        private const float HandleThickness = 2f;
        private const float PositionHandleRatio = 1.2f;
        private const float PlaneSizeRatio = 0.2f;
        private const float RotationHandleRatio = 1.5f;
        private const float ScaleHandleRatio = 1.8f;
        private const float ScaleCubeSize = 0.13f;
        private const int RotationHandleSegments = 64;

        // Hit detection thresholds
        private const float AxisHitThreshold = 10f;
        private const float RotationHitThreshold = 8f;
        private const float ScaleCubeHitThreshold = 12f;
        private const float ScaleLineHitThreshold = 8f;
        private const float SelectionHitThreshold = 20f;

        // Colors
        private static readonly Color TextHandleColor = new(0.2f, 0.8f, 1f, 1f);
        private static readonly Color CameraHandleColor = new(0.8f, 0.8f, 0.8f, 1f);
        private static readonly Color SelectedColor = new(1f, 1f, 0f, 1f);
        private static readonly Color CurveColor = new(1f, 0.4f, 0.8f, 1f);
        private static readonly Color CurveDotColor = new(1f, 0.6f, 0.9f, 1f);
        private const int CurveSegments = 30;
        private const float CurveDotRadius = 0.003f;

        #endregion

        private PreviewRenderUtility _previewUtility;
        private Material _previewMaterial;
        private Material _originalMaterial;
        private Renderer _targetRenderer;
        private MeshFilter _targetMeshFilter;

        // Multiple material support
        private readonly List<Renderer> _allTargetRenderers = new();
        private readonly List<string> _targetNames = new();
        private int _selectedTargetIndex;

        // Camera orbit
        private Vector2 _orbitAngles = new(30f, -45f);
        private float _orbitDistance = 2f;
        private Vector3 _orbitPivot = Vector3.zero;

        // Selection
        private int _selectedTextIndex = -1;
        private bool _cameraSelected;

        // Drag state
        private enum DragAxis { None, X, Y, Z, XY, XZ, YZ, All }
        private enum DragMode { None, Position, Rotation, Scale }
        private DragAxis _dragAxis = DragAxis.None;
        private DragMode _dragMode = DragMode.None;
        private bool _isDragging;
        private Vector3 _dragStartWorldPos;
        private Vector3 _dragStartHitPoint;
        private Quaternion _dragStartRotation;
        private Vector3 _dragStartScale;
        private float _dragStartAngle;
        private float _dragStartDistance;
        private Rect _currentRect;

        // Root transforms cache
        private readonly Vector3[] _rootPositions = new Vector3[RootCount];
        private readonly Matrix4x4[] _rootMatrices = new Matrix4x4[RootCount];

        // Property IDs
        private static readonly int[] IDUse = new int[TextCount];
        private static readonly int[] IDPosition = new int[TextCount];
        private static readonly int[] IDRotation = new int[TextCount];
        private static readonly int[] IDScale = new int[TextCount];
        private static readonly int[] IDPivot = new int[TextCount];
        private static readonly int[] IDSpacing = new int[TextCount];
        private static readonly int[] IDSpacingAnchor = new int[TextCount];
        private static readonly int[] IDMode = new int[TextCount];
        private static readonly int[] IDWorldSpace = new int[TextCount];
        private static readonly int[] IDRootIndex = new int[TextCount];
        private static readonly int[] IDLayer = new int[TextCount];

        // Curve properties
        private static readonly int[] IDCurveIntensity = new int[TextCount];
        private static readonly int[] IDCurveOffset = new int[TextCount];
        private static readonly int[] IDCurveCenter = new int[TextCount];
        private static readonly int[] IDCurveDataX0 = new int[TextCount];
        private static readonly int[] IDCurveDataX1 = new int[TextCount];
        private static readonly int[] IDCurveDataY0 = new int[TextCount];
        private static readonly int[] IDCurveDataY1 = new int[TextCount];
        private static readonly int[] IDCurveDataZ0 = new int[TextCount];
        private static readonly int[] IDCurveDataZ1 = new int[TextCount];

        private static readonly int[] IDRootPosition = new int[RootCount];
        private static readonly int[] IDRootMatrixRow0 = new int[RootCount];
        private static readonly int[] IDRootMatrixRow1 = new int[RootCount];
        private static readonly int[] IDRootMatrixRow2 = new int[RootCount];

        private static readonly int IDCameraPosition = Shader.PropertyToID("_CameraPosition");
        private static readonly int IDCameraRotation = Shader.PropertyToID("_CameraRotation");
        private static readonly int IDCameraFOV = Shader.PropertyToID("_CameraFOV");

        static TypographyDebugger()
        {
            for (var i = 0; i < TextCount; i++)
            {
                IDUse[i] = Shader.PropertyToID($"_Use{i}");
                IDPosition[i] = Shader.PropertyToID($"_Position{i}");
                IDRotation[i] = Shader.PropertyToID($"_Rotation{i}");
                IDScale[i] = Shader.PropertyToID($"_Scale{i}");
                IDPivot[i] = Shader.PropertyToID($"_Pivot{i}");
                IDSpacing[i] = Shader.PropertyToID($"_Spacing{i}");
                IDSpacingAnchor[i] = Shader.PropertyToID($"_SpacingAnchor{i}");
                IDMode[i] = Shader.PropertyToID($"_Mode{i}");
                IDWorldSpace[i] = Shader.PropertyToID($"_WorldSpace{i}");
                IDRootIndex[i] = Shader.PropertyToID($"_RootIndex{i}");
                IDLayer[i] = Shader.PropertyToID($"_Layer{i}");

                // Curve properties
                IDCurveIntensity[i] = Shader.PropertyToID($"_CurveIntensity{i}");
                IDCurveOffset[i] = Shader.PropertyToID($"_CurveOffset{i}");
                IDCurveCenter[i] = Shader.PropertyToID($"_CurveCenter{i}");
                IDCurveDataX0[i] = Shader.PropertyToID($"_CurveDataX{i}_0");
                IDCurveDataX1[i] = Shader.PropertyToID($"_CurveDataX{i}_1");
                IDCurveDataY0[i] = Shader.PropertyToID($"_CurveDataY{i}_0");
                IDCurveDataY1[i] = Shader.PropertyToID($"_CurveDataY{i}_1");
                IDCurveDataZ0[i] = Shader.PropertyToID($"_CurveDataZ{i}_0");
                IDCurveDataZ1[i] = Shader.PropertyToID($"_CurveDataZ{i}_1");
            }

            for (var i = 0; i < RootCount; i++)
            {
                IDRootPosition[i] = Shader.PropertyToID($"_RootPosition{i}");
                IDRootMatrixRow0[i] = Shader.PropertyToID($"_RootMatrix{i}_Row0");
                IDRootMatrixRow1[i] = Shader.PropertyToID($"_RootMatrix{i}_Row1");
                IDRootMatrixRow2[i] = Shader.PropertyToID($"_RootMatrix{i}_Row2");
            }
        }

        [MenuItem("Typography/Debugger")]
        public static void ShowWindow()
        {
            var window = GetWindow<TypographyDebugger>();
            window.titleContent = new GUIContent("Debugger(α)");
            window.minSize = new Vector2(400, 300);
            window.Show();
        }

        private void OnEnable()
        {
            _previewUtility = new PreviewRenderUtility();
            _previewUtility.camera.fieldOfView = 60f;
            _previewUtility.camera.nearClipPlane = 0.01f;
            _previewUtility.camera.farClipPlane = 100f;
            _previewUtility.camera.clearFlags = CameraClearFlags.SolidColor;
            _previewUtility.camera.backgroundColor = new Color(0.1f, 0.1f, 0.1f, 1f);

            // Add light
            _previewUtility.lights[0].intensity = 1f;
            _previewUtility.lights[0].transform.rotation = Quaternion.Euler(50f, -30f, 0f);

            FindAllTargets();
        }

        private void OnDisable()
        {
            if (_previewMaterial != null)
            {
                DestroyImmediate(_previewMaterial);
                _previewMaterial = null;
            }

            _previewUtility?.Cleanup();
            _previewUtility = null;
        }

        private void OnGUI()
        {
            // Toolbar
            EditorGUILayout.BeginHorizontal(EditorStyles.toolbar);
            if (GUILayout.Button("Refresh", EditorStyles.toolbarButton, GUILayout.Width(60)))
            {
                FindAllTargets();
            }
            if (GUILayout.Button("Reset View", EditorStyles.toolbarButton, GUILayout.Width(70)))
            {
                _orbitAngles = new Vector2(30f, -45f);
                _orbitDistance = 2f;
                _orbitPivot = Vector3.zero;
            }
            GUILayout.FlexibleSpace();

            // Target dropdown
            if (_allTargetRenderers.Count > 0)
            {
                EditorGUI.BeginChangeCheck();
                var newIndex = EditorGUILayout.Popup(_selectedTargetIndex, _targetNames.ToArray(),
                    EditorStyles.toolbarPopup, GUILayout.MinWidth(150));
                if (EditorGUI.EndChangeCheck() && newIndex != _selectedTargetIndex)
                {
                    SelectTarget(newIndex);
                }
            }
            else
            {
                GUILayout.Label("No target found", EditorStyles.toolbarButton);
            }
            EditorGUILayout.EndHorizontal();

            // Preview area
            var previewRect = GUILayoutUtility.GetRect(position.width, position.height - 20);
            if (previewRect.width > 1 && previewRect.height > 1)
            {
                HandleInput(previewRect);
                DrawPreview(previewRect);
            }
        }

        private void FindAllTargets()
        {
            _allTargetRenderers.Clear();
            _targetNames.Clear();

            // Find all renderers with Typography shader
            var renderers = FindObjectsOfType<Renderer>();
            foreach (var renderer in renderers)
            {
                var mat = renderer.sharedMaterial;
                if (mat != null && mat.shader != null && mat.shader.name.Contains("Typography"))
                {
                    _allTargetRenderers.Add(renderer);
                    _targetNames.Add($"{renderer.name} ({mat.name})");
                }
            }

            // Clamp selected index
            if (_selectedTargetIndex >= _allTargetRenderers.Count)
                _selectedTargetIndex = 0;

            // Select target
            SelectTarget(_selectedTargetIndex);
        }

        private void SelectTarget(int index)
        {
            _selectedTargetIndex = index;
            _targetRenderer = null;
            _targetMeshFilter = null;
            _originalMaterial = null;

            if (index >= 0 && index < _allTargetRenderers.Count)
            {
                _targetRenderer = _allTargetRenderers[index];
                _targetMeshFilter = _targetRenderer.GetComponent<MeshFilter>();
                _originalMaterial = _targetRenderer.sharedMaterial;
            }

            // Reset selection when target changes
            _selectedTextIndex = -1;
            _cameraSelected = false;

            CreatePreviewMaterial();
        }

        private void CreatePreviewMaterial()
        {
            if (_previewMaterial != null)
                DestroyImmediate(_previewMaterial);

            if (_originalMaterial == null)
            {
                _previewMaterial = null;
                return;
            }

            // Copy material
            _previewMaterial = new Material(_originalMaterial);
            _previewMaterial.name = "Preview_" + _originalMaterial.name;

            // Convert ScreenSpace texts to WorldSpace, hide original WorldSpace texts
            for (var i = 0; i < TextCount; i++)
            {
                if (!_previewMaterial.HasProperty(IDWorldSpace[i])) continue;

                var originalWorldSpace = _previewMaterial.GetInt(IDWorldSpace[i]);
                if (originalWorldSpace == 0) // ScreenSpace
                {
                    _previewMaterial.SetInt(IDWorldSpace[i], 1); // Convert to WorldSpace
                }
                else // WorldSpace - hide in preview (ScreenSpace editor only)
                {
                    _previewMaterial.SetFloat(IDUse[i], 0);
                }
            }
        }

        private void CacheRootTransforms()
        {
            if (_previewMaterial == null) return;

            for (var i = 0; i < RootCount; i++)
            {
                if (!_previewMaterial.HasProperty(IDRootPosition[i])) continue;

                var rootPosRaw = _previewMaterial.GetVector(IDRootPosition[i]);
                _rootPositions[i] = new Vector3(rootPosRaw.x, rootPosRaw.y, rootPosRaw.z) * CmToM;

                var row0 = _previewMaterial.GetVector(IDRootMatrixRow0[i]);
                var row1 = _previewMaterial.GetVector(IDRootMatrixRow1[i]);
                var row2 = _previewMaterial.GetVector(IDRootMatrixRow2[i]);

                _rootMatrices[i] = new Matrix4x4(
                    new Vector4(row0.x, row1.x, row2.x, 0),
                    new Vector4(row0.y, row1.y, row2.y, 0),
                    new Vector4(row0.z, row1.z, row2.z, 0),
                    new Vector4(0, 0, 0, 1)
                );
            }
        }

        private void HandleInput(Rect rect)
        {
            _currentRect = rect;
            var evt = Event.current;
            if (!rect.Contains(evt.mousePosition)) return;

            switch (evt.type)
            {
                case EventType.MouseDown:
                    if (evt.button == 0)
                    {
                        // Alt+click is for camera orbit, skip handle interaction
                        if (evt.alt)
                        {
                            // Don't change selection, just allow orbit via MouseDrag
                            evt.Use();
                            Repaint();
                            break;
                        }

                        // Check position handle first (innermost)
                        var posAxis = GetHoveredAxis(rect, evt.mousePosition);
                        if (posAxis != DragAxis.None && (_selectedTextIndex >= 0 || _cameraSelected))
                        {
                            StartDrag(rect, evt.mousePosition, posAxis);
                            evt.Use();
                        }
                        // Check scale handle (middle)
                        else
                        {
                            var scaleAxis = GetHoveredScaleAxis(rect, evt.mousePosition);
                            if (scaleAxis != DragAxis.None && _selectedTextIndex >= 0) // Scale only for text, not camera
                            {
                                StartScaleDrag(rect, evt.mousePosition, scaleAxis);
                                evt.Use();
                            }
                            // Check rotation handle (outermost)
                            else
                            {
                                var rotAxis = GetHoveredRotationAxis(rect, evt.mousePosition);
                                if (rotAxis != DragAxis.None && (_selectedTextIndex >= 0 || _cameraSelected))
                                {
                                    StartRotationDrag(rect, evt.mousePosition, rotAxis);
                                    evt.Use();
                                }
                                else
                                {
                                    HandleSelection(rect, evt.mousePosition);
                                    evt.Use();
                                }
                            }
                        }
                        Repaint();
                    }
                    break;

                case EventType.MouseDrag:
                    if (evt.button == 0 && _isDragging)
                    {
                        if (_dragMode == DragMode.Rotation)
                            UpdateRotationDrag(rect, evt.mousePosition);
                        else if (_dragMode == DragMode.Scale)
                            UpdateScaleDrag(rect, evt.mousePosition);
                        else
                            UpdateDrag(rect, evt.mousePosition);
                        evt.Use();
                        Repaint();
                    }
                    else if (evt.button == 0 && !_isDragging) // Orbit only when not dragging
                    {
                        _orbitAngles.x += evt.delta.y * 0.5f;
                        _orbitAngles.y += evt.delta.x * 0.5f;
                        _orbitAngles.x = Mathf.Clamp(_orbitAngles.x, -89f, 89f);
                        evt.Use();
                        Repaint();
                    }
                    else if (evt.button == 2) // Middle drag - pan
                    {
                        var panSpeed = _orbitDistance * 0.002f;
                        var camRotation = Quaternion.Euler(_orbitAngles.x, _orbitAngles.y, 0);
                        _orbitPivot -= camRotation * Vector3.right * evt.delta.x * panSpeed;
                        _orbitPivot += camRotation * Vector3.up * evt.delta.y * panSpeed;
                        evt.Use();
                        Repaint();
                    }
                    break;

                case EventType.MouseUp:
                    if (evt.button == 0 && _isDragging)
                    {
                        EndDrag();
                        evt.Use();
                        Repaint();
                    }
                    break;

                case EventType.ScrollWheel:
                    _orbitDistance *= 1f + evt.delta.y * 0.1f;
                    _orbitDistance = Mathf.Clamp(_orbitDistance, 0.1f, 50f);
                    evt.Use();
                    Repaint();
                    break;
            }
        }

        private void DrawPreview(Rect rect)
        {
            if (_previewUtility == null || _targetMeshFilter == null || _previewMaterial == null)
            {
                EditorGUI.DrawRect(rect, new Color(0.1f, 0.1f, 0.1f, 1f));
                GUI.Label(rect, "No Typography object found", EditorStyles.centeredGreyMiniLabel);
                return;
            }

            // Sync material properties from original
            SyncMaterialProperties();

            // Update camera position
            var camRotation = Quaternion.Euler(_orbitAngles.x, _orbitAngles.y, 0);
            var camPosition = _orbitPivot + camRotation * Vector3.back * _orbitDistance;
            _previewUtility.camera.transform.position = camPosition;
            _previewUtility.camera.transform.rotation = camRotation;

            // Begin preview
            _previewUtility.BeginPreview(rect, GUIStyle.none);

            // Draw mesh
            var mesh = _targetMeshFilter.sharedMesh;
            if (mesh != null)
            {
                var matrix = _targetRenderer.transform.localToWorldMatrix;
                _previewUtility.DrawMesh(mesh, matrix, _previewMaterial, 0);
            }

            // Render
            _previewUtility.camera.Render();

            // End and display
            var texture = _previewUtility.EndPreview();
            GUI.DrawTexture(rect, texture, ScaleMode.StretchToFill, false);

            // Draw Handles in 3D space
            Handles.SetCamera(rect, _previewUtility.camera);
            DrawGizmosAndHandles();
        }

        private void DrawGizmosAndHandles()
        {
            for (var i = 0; i < TextCount; i++)
            {
                if (!_previewMaterial.HasProperty(IDUse[i])) continue;
                if (_previewMaterial.GetFloat(IDUse[i]) < 0.5f) continue;

                // Only show originally ScreenSpace texts (WorldSpace == 0)
                if (_originalMaterial == null) continue;
                if (_originalMaterial.GetInt(IDWorldSpace[i]) == 1) continue;

                DrawTextGizmo(i);
            }

            // Draw camera frustum
            if (_previewMaterial.HasProperty(IDCameraPosition))
                DrawCameraGizmo();
        }

        private void DrawTextGizmo(int index)
        {
            var posRaw = _previewMaterial.GetVector(IDPosition[index]);
            var rotRaw = _previewMaterial.GetVector(IDRotation[index]);
            var scaleRaw = _previewMaterial.GetVector(IDScale[index]);
            var pivotRaw = _previewMaterial.HasProperty(IDPivot[index]) ? _previewMaterial.GetVector(IDPivot[index]) : Vector4.zero;
            var spacing = _previewMaterial.HasProperty(IDSpacing[index]) ? _previewMaterial.GetFloat(IDSpacing[index]) : 0f;
            var spacingAnchor = _previewMaterial.HasProperty(IDSpacingAnchor[index]) ? _previewMaterial.GetInt(IDSpacingAnchor[index]) : 0;
            var mode = _previewMaterial.HasProperty(IDMode[index]) ? _previewMaterial.GetInt(IDMode[index]) : 0;

            var localPos = new Vector3(posRaw.x, posRaw.y, posRaw.z) * CmToM;
            var localRot = Quaternion.Euler(rotRaw.x, rotRaw.y, rotRaw.z);
            var scale = new Vector3(scaleRaw.x, scaleRaw.y, scaleRaw.z);
            var pivot = new Vector3(pivotRaw.x, pivotRaw.y, pivotRaw.z);

            var rootIndex = _previewMaterial.HasProperty(IDRootIndex[index]) ? _previewMaterial.GetInt(IDRootIndex[index]) : 0;

            Vector3 worldPos;
            Quaternion worldRot;
            if (rootIndex > 0 && rootIndex <= RootCount)
            {
                var rootIdx = rootIndex - 1;
                worldPos = _rootMatrices[rootIdx].MultiplyPoint3x4(localPos) + _rootPositions[rootIdx];
                worldRot = _rootMatrices[rootIdx].rotation * localRot;
            }
            else
            {
                worldPos = localPos;
                worldRot = localRot;
            }

            // Calculate bounds
            var text = _previewMaterial.GetTag(TagTextPrefix + index, false, "");
            var charCount = CountTextElements(text);
            if (charCount == 0) charCount = 1;

            var spacingMult = 1f + spacing;
            var step = spacingMult * TextGlyphScale;
            var totalLength = (charCount - 1) * step;
            var baseTotal = (charCount - 1) * TextGlyphScale;

            var startPos = spacingAnchor switch
            {
                1 => -baseTotal * 0.5f,
                2 => baseTotal * 0.5f - totalLength,
                _ => -totalLength * 0.5f
            };
            var centerX = (startPos + startPos + totalLength) * 0.5f;
            var width = totalLength + TextGlyphScale;

            var isVertical = mode == 2;
            var boundsSize = isVertical ? new Vector3(TextGlyphScale, width, 0.01f) : new Vector3(width, TextGlyphScale, 0.01f);
            var boundsCenter = isVertical ? new Vector3(0f, -centerX, 0f) : new Vector3(centerX, 0f, 0f);
            var pivotOffset = pivot * TextGlyphScale;

            var isSelected = _selectedTextIndex == index;
            var matrix = Matrix4x4.TRS(worldPos, worldRot, scale);

            // Draw bounding box
            Handles.color = isSelected ? SelectedColor : TextHandleColor;
            Handles.matrix = matrix;
            DrawWireCube(boundsCenter - pivotOffset, boundsSize);

            // Draw pivot
            Handles.color = Color.yellow;
            var pivotScale = Mathf.Min(scale.x, scale.y, scale.z);
            DrawSolidSphere(Vector3.zero, PivotRadius / pivotScale);

            Handles.matrix = Matrix4x4.identity;

            // Draw curve path
            DrawCurvePath(index, worldPos, worldRot, scale, charCount, spacing, spacingAnchor, isVertical);

            // Draw custom handles for selected
            if (isSelected)
            {
                // Hide other handles when dragging
                if (!_isDragging || _dragMode == DragMode.Position)
                    DrawPositionHandle(worldPos, worldRot);
                if (!_isDragging || _dragMode == DragMode.Rotation)
                    DrawRotationHandle(worldPos, worldRot);
                if (!_isDragging || _dragMode == DragMode.Scale)
                    DrawScaleHandle(worldPos, worldRot, scale);
            }
        }

        private void DrawCameraGizmo()
        {
            GetCameraWorldTransform(out var camPos, out var camRot);
            var fov = _previewMaterial.HasProperty(IDCameraFOV) ? _previewMaterial.GetFloat(IDCameraFOV) : 60f;

            Handles.color = _cameraSelected ? SelectedColor : CameraHandleColor;
            Handles.matrix = Matrix4x4.TRS(camPos, camRot, Vector3.one);
            Handles.DrawWireDisc(Vector3.zero, Vector3.forward, 0.1f);
            Handles.DrawLine(Vector3.zero, Vector3.forward * 0.2f);
            // Draw frustum lines
            var aspect = 16f / 9f;
            var halfFov = fov * 0.5f * Mathf.Deg2Rad;
            var nearDist = 0.15f;
            var farDist = 1f;
            var nearHeight = Mathf.Tan(halfFov) * nearDist;
            var nearWidth = nearHeight * aspect;
            var farHeight = Mathf.Tan(halfFov) * farDist;
            var farWidth = farHeight * aspect;

            var nearTL = new Vector3(-nearWidth, nearHeight, nearDist);
            var nearTR = new Vector3(nearWidth, nearHeight, nearDist);
            var nearBL = new Vector3(-nearWidth, -nearHeight, nearDist);
            var nearBR = new Vector3(nearWidth, -nearHeight, nearDist);
            var farTL = new Vector3(-farWidth, farHeight, farDist);
            var farTR = new Vector3(farWidth, farHeight, farDist);
            var farBL = new Vector3(-farWidth, -farHeight, farDist);
            var farBR = new Vector3(farWidth, -farHeight, farDist);

            Handles.DrawLine(nearTL, nearTR);
            Handles.DrawLine(nearTR, nearBR);
            Handles.DrawLine(nearBR, nearBL);
            Handles.DrawLine(nearBL, nearTL);
            Handles.DrawLine(farTL, farTR);
            Handles.DrawLine(farTR, farBR);
            Handles.DrawLine(farBR, farBL);
            Handles.DrawLine(farBL, farTL);
            Handles.DrawLine(nearTL, farTL);
            Handles.DrawLine(nearTR, farTR);
            Handles.DrawLine(nearBL, farBL);
            Handles.DrawLine(nearBR, farBR);

            Handles.matrix = Matrix4x4.identity;

            // Draw custom handles for camera
            if (_cameraSelected)
            {
                // Hide other handles when dragging
                if (!_isDragging || _dragMode == DragMode.Position)
                    DrawPositionHandle(camPos, camRot);
                if (!_isDragging || _dragMode == DragMode.Rotation)
                    DrawRotationHandle(camPos, camRot);
            }
        }

        private void DrawCurvePath(int index, Vector3 worldPos, Quaternion worldRot, Vector3 scale,
            int charCount, float spacing, int spacingAnchor, bool isVertical)
        {
            if (!_previewMaterial.HasProperty(IDCurveIntensity[index])) return;
            var intensity = _previewMaterial.GetFloat(IDCurveIntensity[index]);
            if (intensity < 0.001f) return;

            var curveTime = _previewMaterial.HasProperty(IDCurveOffset[index]) ? _previewMaterial.GetFloat(IDCurveOffset[index]) : 0f;
            var curveCenter = _previewMaterial.HasProperty(IDCurveCenter[index])
                ? (Vector3)_previewMaterial.GetVector(IDCurveCenter[index])
                : Vector3.zero;

            var dataX0 = _previewMaterial.HasProperty(IDCurveDataX0[index]) ? _previewMaterial.GetVector(IDCurveDataX0[index]) : new Vector4(0.5f, 0.5f, 0.5f, 0.5f);
            var dataX1 = _previewMaterial.HasProperty(IDCurveDataX1[index]) ? _previewMaterial.GetVector(IDCurveDataX1[index]) : new Vector4(0.5f, 0.5f, 0.5f, 0.5f);
            var dataY0 = _previewMaterial.HasProperty(IDCurveDataY0[index]) ? _previewMaterial.GetVector(IDCurveDataY0[index]) : new Vector4(0.5f, 0.5f, 0.5f, 0.5f);
            var dataY1 = _previewMaterial.HasProperty(IDCurveDataY1[index]) ? _previewMaterial.GetVector(IDCurveDataY1[index]) : new Vector4(0.5f, 0.5f, 0.5f, 0.5f);
            var dataZ0 = _previewMaterial.HasProperty(IDCurveDataZ0[index]) ? _previewMaterial.GetVector(IDCurveDataZ0[index]) : new Vector4(0.5f, 0.5f, 0.5f, 0.5f);
            var dataZ1 = _previewMaterial.HasProperty(IDCurveDataZ1[index]) ? _previewMaterial.GetVector(IDCurveDataZ1[index]) : new Vector4(0.5f, 0.5f, 0.5f, 0.5f);

            var spacingMult = 1f + spacing;
            var step = spacingMult * TextGlyphScale;
            var totalLength = (charCount - 1) * step;
            var baseTotal = (charCount - 1) * TextGlyphScale;

            var startPos = spacingAnchor switch
            {
                1 => -baseTotal * 0.5f,
                2 => baseTotal * 0.5f - totalLength,
                _ => -totalLength * 0.5f
            };

            Handles.matrix = Matrix4x4.TRS(worldPos, worldRot, scale);
            Handles.color = CurveColor;

            var prevPoint = Vector3.zero;
            for (var seg = 0; seg <= CurveSegments; seg++)
            {
                var normalizedPos = (float)seg / CurveSegments;
                var charPos = startPos + totalLength * normalizedPos;

                var curveOffset = SampleBakedCurve3D(dataX0, dataX1, dataY0, dataY1, dataZ0, dataZ1, normalizedPos, curveTime);
                var adjustedOffset = (curveOffset - curveCenter) * intensity * TextGlyphScale * spacingMult;

                Vector3 point;
                if (isVertical)
                    point = new Vector3(adjustedOffset.x, -charPos + adjustedOffset.y, adjustedOffset.z);
                else
                    point = new Vector3(charPos + adjustedOffset.x, adjustedOffset.y, adjustedOffset.z);

                if (seg > 0)
                    Handles.DrawLine(prevPoint, point);
                prevPoint = point;
            }

            // Draw dots
            Handles.color = CurveDotColor;
            var scaleMin = Mathf.Min(scale.x, scale.y, scale.z);
            for (var c = 0; c < charCount; c++)
            {
                var normalizedPos = charCount > 1 ? (float)c / (charCount - 1) : 0.5f;
                var charPos = startPos + totalLength * normalizedPos;

                var curveOffset = SampleBakedCurve3D(dataX0, dataX1, dataY0, dataY1, dataZ0, dataZ1, normalizedPos, curveTime);
                var adjustedOffset = (curveOffset - curveCenter) * intensity * TextGlyphScale * spacingMult;

                Vector3 point;
                if (isVertical)
                    point = new Vector3(adjustedOffset.x, -charPos + adjustedOffset.y, adjustedOffset.z);
                else
                    point = new Vector3(charPos + adjustedOffset.x, adjustedOffset.y, adjustedOffset.z);

                DrawWireSphere(point, CurveDotRadius / scaleMin);
            }

            Handles.matrix = Matrix4x4.identity;
        }

        private static void DrawWireCube(Vector3 center, Vector3 size)
        {
            var half = size * 0.5f;
            var p0 = center + new Vector3(-half.x, -half.y, -half.z);
            var p1 = center + new Vector3(half.x, -half.y, -half.z);
            var p2 = center + new Vector3(half.x, half.y, -half.z);
            var p3 = center + new Vector3(-half.x, half.y, -half.z);
            var p4 = center + new Vector3(-half.x, -half.y, half.z);
            var p5 = center + new Vector3(half.x, -half.y, half.z);
            var p6 = center + new Vector3(half.x, half.y, half.z);
            var p7 = center + new Vector3(-half.x, half.y, half.z);

            Handles.DrawLine(p0, p1); Handles.DrawLine(p1, p2); Handles.DrawLine(p2, p3); Handles.DrawLine(p3, p0);
            Handles.DrawLine(p4, p5); Handles.DrawLine(p5, p6); Handles.DrawLine(p6, p7); Handles.DrawLine(p7, p4);
            Handles.DrawLine(p0, p4); Handles.DrawLine(p1, p5); Handles.DrawLine(p2, p6); Handles.DrawLine(p3, p7);
        }

        private static void DrawWireSphere(Vector3 center, float radius)
        {
            Handles.DrawWireDisc(center, Vector3.up, radius);
            Handles.DrawWireDisc(center, Vector3.right, radius);
            Handles.DrawWireDisc(center, Vector3.forward, radius);
        }

        private static void DrawSolidSphere(Vector3 center, float radius)
        {
            Handles.SphereHandleCap(0, center, Quaternion.identity, radius * 2f, EventType.Repaint);
        }

        private static float CatmullRom(float p0, float p1, float p2, float p3, float t)
        {
            return 0.5f * (2f * p1 + (-p0 + p2) * t +
                   (2f * p0 - 5f * p1 + 4f * p2 - p3) * t * t +
                   (-p0 + 3f * p1 - 3f * p2 + p3) * t * t * t);
        }

        private static float SampleBakedCurve(Vector4 data0, Vector4 data1, float t)
        {
            t = Mathf.Clamp01(t) * 7f;
            var idx = Mathf.FloorToInt(t);
            var frac = t - idx;
            float[] samples = { data0.x, data0.y, data0.z, data0.w, data1.x, data1.y, data1.z, data1.w };
            var i0 = Mathf.Max(0, idx - 1);
            var i1 = idx;
            var i2 = Mathf.Min(7, idx + 1);
            var i3 = Mathf.Min(7, idx + 2);
            return CatmullRom(samples[i0], samples[i1], samples[i2], samples[i3], frac);
        }

        private static Vector3 SampleBakedCurve3D(Vector4 dataX0, Vector4 dataX1, Vector4 dataY0, Vector4 dataY1,
            Vector4 dataZ0, Vector4 dataZ1, float normalizedPos, float phase)
        {
            var t = Frac(normalizedPos + phase);
            return new Vector3(
                SampleBakedCurve(dataX0, dataX1, t) * 2f - 1f,
                SampleBakedCurve(dataY0, dataY1, t) * 2f - 1f,
                SampleBakedCurve(dataZ0, dataZ1, t) * 2f - 1f
            );
        }

        private static float Frac(float x) => x - Mathf.Floor(x);

        private static int CountTextElements(string text)
        {
            if (string.IsNullOrEmpty(text)) return 0;
            var count = 0;
            var enumerator = StringInfo.GetTextElementEnumerator(text);
            while (enumerator.MoveNext())
            {
                var element = enumerator.Current.ToString();
                if (string.IsNullOrEmpty(element) || char.IsControl(element[0])) continue;
                count++;
            }
            return count;
        }

        private void SyncMaterialProperties()
        {
            if (_originalMaterial == null || _previewMaterial == null) return;

            // Sync all properties except WorldSpace
            _previewMaterial.CopyPropertiesFromMaterial(_originalMaterial);

            // Re-apply: convert ScreenSpace to WorldSpace, hide original WorldSpace texts
            for (var i = 0; i < TextCount; i++)
            {
                if (!_previewMaterial.HasProperty(IDWorldSpace[i])) continue;

                var originalWorldSpace = _originalMaterial.GetInt(IDWorldSpace[i]);
                if (originalWorldSpace == 0) // Original is ScreenSpace
                {
                    _previewMaterial.SetInt(IDWorldSpace[i], 1); // Keep as WorldSpace in preview
                }
                else // WorldSpace - hide in preview (ScreenSpace editor only)
                {
                    _previewMaterial.SetFloat(IDUse[i], 0);
                }
            }

            CacheRootTransforms();
        }

        private Vector3 GetTextWorldPosition(int index)
        {
            GetTextWorldTransform(index, out var worldPos, out _);
            return worldPos;
        }

        private void GetTextWorldTransform(int index, out Vector3 worldPos, out Quaternion worldRot)
        {
            var posRaw = _previewMaterial.GetVector(IDPosition[index]);
            var rotRaw = _previewMaterial.GetVector(IDRotation[index]);
            var localPos = new Vector3(posRaw.x, posRaw.y, posRaw.z) * CmToM;
            var localRot = Quaternion.Euler(rotRaw.x, rotRaw.y, rotRaw.z);
            var rootIndex = _previewMaterial.HasProperty(IDRootIndex[index]) ? _previewMaterial.GetInt(IDRootIndex[index]) : 0;

            if (rootIndex > 0 && rootIndex <= RootCount)
            {
                var rootIdx = rootIndex - 1;
                worldPos = _rootMatrices[rootIdx].MultiplyPoint3x4(localPos) + _rootPositions[rootIdx];
                worldRot = _rootMatrices[rootIdx].rotation * localRot;
            }
            else
            {
                worldPos = localPos;
                worldRot = localRot;
            }
        }

        private void GetCameraWorldTransform(out Vector3 worldPos, out Quaternion worldRot)
        {
            var posRaw = _previewMaterial.GetVector(IDCameraPosition);
            var rotRaw = _previewMaterial.GetVector(IDCameraRotation);
            worldPos = new Vector3(posRaw.x, posRaw.y, posRaw.z) * CmToM;
            worldRot = Quaternion.Euler(rotRaw.x, rotRaw.y, rotRaw.z);
        }

        private bool TryGetSelectedWorldTransform(out Vector3 worldPos, out Quaternion worldRot)
        {
            if (_selectedTextIndex >= 0)
            {
                GetTextWorldTransform(_selectedTextIndex, out worldPos, out worldRot);
                return true;
            }
            if (_cameraSelected)
            {
                GetCameraWorldTransform(out worldPos, out worldRot);
                return true;
            }
            worldPos = Vector3.zero;
            worldRot = Quaternion.identity;
            return false;
        }

        private Vector2 WorldToScreen(Rect rect, Vector3 worldPos)
        {
            var cam = _previewUtility.camera;
            var viewportPos = cam.WorldToViewportPoint(worldPos);
            return new Vector2(
                rect.x + viewportPos.x * rect.width,
                rect.y + (1f - viewportPos.y) * rect.height
            );
        }

        private void HandleSelection(Rect rect, Vector2 mousePos)
        {
            if (_previewMaterial == null) return;

            var closestDist = SelectionHitThreshold;
            var newSelectedIndex = -1;
            var newCameraSelected = false;

            // Check texts (ScreenSpace only)
            for (var i = 0; i < TextCount; i++)
            {
                if (!_previewMaterial.HasProperty(IDUse[i])) continue;
                if (_previewMaterial.GetFloat(IDUse[i]) < 0.5f) continue;
                if (_originalMaterial == null) continue;
                if (_originalMaterial.GetInt(IDWorldSpace[i]) == 1) continue;

                var worldPos = GetTextWorldPosition(i);
                var screenPos = WorldToScreen(rect, worldPos);
                var dist = Vector2.Distance(mousePos, screenPos);

                if (dist < closestDist)
                {
                    closestDist = dist;
                    newSelectedIndex = i;
                    newCameraSelected = false;
                }
            }

            // Check camera
            if (_previewMaterial.HasProperty(IDCameraPosition))
            {
                GetCameraWorldTransform(out var camWorldPos, out _);
                var dist = Vector2.Distance(mousePos, WorldToScreen(rect, camWorldPos));
                if (dist < closestDist)
                {
                    newSelectedIndex = -1;
                    newCameraSelected = true;
                }
            }

            _selectedTextIndex = newSelectedIndex;
            _cameraSelected = newCameraSelected;
        }

        private void Update()
        {
            // Repaint for live updates
            if (_originalMaterial != null)
                Repaint();
        }

        // ============================================================================
        // Custom Position Handle (RuntimeTransformHandle style)
        // ============================================================================

        private float GetHandleSize(Vector3 position)
        {
            var cam = _previewUtility.camera;
            var distance = Vector3.Distance(cam.transform.position, position);
            // Convert screen pixels to world size at this distance
            var screenToWorld = distance * Mathf.Tan(cam.fieldOfView * 0.5f * Mathf.Deg2Rad) * 2f / _currentRect.height;
            return HandleScreenSize * screenToWorld;
        }

        private void DrawPositionHandle(Vector3 position, Quaternion rotation)
        {
            Handles.matrix = Matrix4x4.identity;

            var baseSize = GetHandleSize(position);
            var handleLength = baseSize * PositionHandleRatio;
            var planeSize = baseSize * PlaneSizeRatio;
            var coneSize = baseSize * 0.2f;

            // Local axes
            var localRight = rotation * Vector3.right;
            var localUp = rotation * Vector3.up;
            var localForward = rotation * Vector3.forward;

            var hoveredAxis = DragAxis.None;
            if (!_isDragging && _currentRect.width > 0)
            {
                hoveredAxis = GetHoveredAxis(_currentRect, Event.current.mousePosition);
            }

            // X axis (red)
            Handles.color = (_dragAxis == DragAxis.X || hoveredAxis == DragAxis.X) ? Color.yellow : Color.red;
            Handles.DrawLine(position, position + localRight * handleLength, HandleThickness);
            Handles.ConeHandleCap(0, position + localRight * handleLength, Quaternion.LookRotation(localRight), coneSize, EventType.Repaint);

            // Y axis (green)
            Handles.color = (_dragAxis == DragAxis.Y || hoveredAxis == DragAxis.Y) ? Color.yellow : Color.green;
            Handles.DrawLine(position, position + localUp * handleLength, HandleThickness);
            Handles.ConeHandleCap(0, position + localUp * handleLength, Quaternion.LookRotation(localUp), coneSize, EventType.Repaint);

            // Z axis (blue)
            Handles.color = (_dragAxis == DragAxis.Z || hoveredAxis == DragAxis.Z) ? Color.yellow : Color.blue;
            Handles.DrawLine(position, position + localForward * handleLength, HandleThickness);
            Handles.ConeHandleCap(0, position + localForward * handleLength, Quaternion.LookRotation(localForward), coneSize, EventType.Repaint);

            // XY plane (red+green)
            Handles.color = (_dragAxis == DragAxis.XY || hoveredAxis == DragAxis.XY) ? new Color(1, 1, 0, 0.5f) : new Color(1, 0.5f, 0, 0.3f);
            Handles.DrawSolidRectangleWithOutline(
                new[] { position, position + localRight * planeSize * 2, position + (localRight + localUp) * planeSize * 2, position + localUp * planeSize * 2 },
                Handles.color, Color.clear);

            // XZ plane (red+blue)
            Handles.color = (_dragAxis == DragAxis.XZ || hoveredAxis == DragAxis.XZ) ? new Color(1, 1, 0, 0.5f) : new Color(1, 0, 0.5f, 0.3f);
            Handles.DrawSolidRectangleWithOutline(
                new[] { position, position + localRight * planeSize * 2, position + (localRight + localForward) * planeSize * 2, position + localForward * planeSize * 2 },
                Handles.color, Color.clear);

            // YZ plane (green+blue)
            Handles.color = (_dragAxis == DragAxis.YZ || hoveredAxis == DragAxis.YZ) ? new Color(1, 1, 0, 0.5f) : new Color(0, 0.5f, 1, 0.3f);
            Handles.DrawSolidRectangleWithOutline(
                new[] { position, position + localUp * planeSize * 2, position + (localUp + localForward) * planeSize * 2, position + localForward * planeSize * 2 },
                Handles.color, Color.clear);
        }

        private DragAxis GetHoveredAxis(Rect rect, Vector2 mousePos)
        {
            if (_previewUtility == null || !TryGetSelectedWorldTransform(out var targetPos, out var targetRot))
                return DragAxis.None;

            // Local axes
            var localRight = targetRot * Vector3.right;
            var localUp = targetRot * Vector3.up;
            var localForward = targetRot * Vector3.forward;

            var baseSize = GetHandleSize(targetPos);
            var handleLength = baseSize * PositionHandleRatio;
            var planeSize = baseSize * PlaneSizeRatio;

            var screenOrigin = WorldToScreen(rect, targetPos);
            var screenX = WorldToScreen(rect, targetPos + localRight * handleLength);
            var screenY = WorldToScreen(rect, targetPos + localUp * handleLength);
            var screenZ = WorldToScreen(rect, targetPos + localForward * handleLength);

            // Check planes
            if (IsPointInQuad(mousePos, screenOrigin, WorldToScreen(rect, targetPos + localRight * planeSize * 2),
                WorldToScreen(rect, targetPos + (localRight + localUp) * planeSize * 2), WorldToScreen(rect, targetPos + localUp * planeSize * 2)))
                return DragAxis.XY;
            if (IsPointInQuad(mousePos, screenOrigin, WorldToScreen(rect, targetPos + localRight * planeSize * 2),
                WorldToScreen(rect, targetPos + (localRight + localForward) * planeSize * 2), WorldToScreen(rect, targetPos + localForward * planeSize * 2)))
                return DragAxis.XZ;
            if (IsPointInQuad(mousePos, screenOrigin, WorldToScreen(rect, targetPos + localUp * planeSize * 2),
                WorldToScreen(rect, targetPos + (localUp + localForward) * planeSize * 2), WorldToScreen(rect, targetPos + localForward * planeSize * 2)))
                return DragAxis.YZ;

            // Check axes
            if (DistanceToLineSegment(mousePos, screenOrigin, screenX) < AxisHitThreshold)
                return DragAxis.X;
            if (DistanceToLineSegment(mousePos, screenOrigin, screenY) < AxisHitThreshold)
                return DragAxis.Y;
            if (DistanceToLineSegment(mousePos, screenOrigin, screenZ) < AxisHitThreshold)
                return DragAxis.Z;

            return DragAxis.None;
        }

        private static float DistanceToLineSegment(Vector2 point, Vector2 a, Vector2 b)
        {
            var ab = b - a;
            var ap = point - a;
            var t = Mathf.Clamp01(Vector2.Dot(ap, ab) / ab.sqrMagnitude);
            var closest = a + ab * t;
            return Vector2.Distance(point, closest);
        }

        private static bool IsPointInQuad(Vector2 p, Vector2 a, Vector2 b, Vector2 c, Vector2 d)
        {
            return IsPointInTriangle(p, a, b, c) || IsPointInTriangle(p, a, c, d);
        }

        private static bool IsPointInTriangle(Vector2 p, Vector2 a, Vector2 b, Vector2 c)
        {
            var d1 = Sign(p, a, b);
            var d2 = Sign(p, b, c);
            var d3 = Sign(p, c, a);
            var hasNeg = (d1 < 0) || (d2 < 0) || (d3 < 0);
            var hasPos = (d1 > 0) || (d2 > 0) || (d3 > 0);
            return !(hasNeg && hasPos);
        }

        private static float Sign(Vector2 p1, Vector2 p2, Vector2 p3)
        {
            return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
        }

        private void StartDrag(Rect rect, Vector2 mousePos, DragAxis axis)
        {
            _isDragging = true;
            _dragAxis = axis;
            _dragMode = DragMode.Position;

            if (_selectedTextIndex >= 0)
                GetTextWorldTransform(_selectedTextIndex, out _dragStartWorldPos, out _dragStartRotation);
            else if (_cameraSelected)
                GetCameraWorldTransform(out _dragStartWorldPos, out _dragStartRotation);

            _dragStartHitPoint = GetHitPointOnAxis(rect, mousePos, _dragStartWorldPos, _dragStartRotation, axis);
            Undo.RecordObject(_originalMaterial, _selectedTextIndex >= 0 ? "Move Text" : "Move Camera");
        }

        private void UpdateDrag(Rect rect, Vector2 mousePos)
        {
            if (!_isDragging) return;

            var currentHitPoint = GetHitPointOnAxis(rect, mousePos, _dragStartWorldPos, _dragStartRotation, _dragAxis);
            var delta = currentHitPoint - _dragStartHitPoint;
            var newWorldPos = _dragStartWorldPos + delta;

            if (_selectedTextIndex >= 0)
            {
                ApplyTextPosition(_selectedTextIndex, newWorldPos);
            }
            else if (_cameraSelected)
            {
                ApplyCameraPosition(newWorldPos);
            }
        }

        private void EndDrag()
        {
            _isDragging = false;
            _dragAxis = DragAxis.None;
            _dragMode = DragMode.None;
        }

        private Vector3 GetHitPointOnAxis(Rect rect, Vector2 mousePos, Vector3 origin, Quaternion rotation, DragAxis axis)
        {
            var cam = _previewUtility.camera;

            // Convert GUI points to viewport coordinates
            var mouseViewport = new Vector2(
                (mousePos.x - rect.x) / rect.width,
                1f - (mousePos.y - rect.y) / rect.height
            );
            var ray = cam.ViewportPointToRay(mouseViewport);

            // Local axes
            var localRight = rotation * Vector3.right;
            var localUp = rotation * Vector3.up;
            var localForward = rotation * Vector3.forward;

            switch (axis)
            {
                case DragAxis.X:
                    return ClosestPointOnRay(new Ray(origin, localRight), ray);
                case DragAxis.Y:
                    return ClosestPointOnRay(new Ray(origin, localUp), ray);
                case DragAxis.Z:
                    return ClosestPointOnRay(new Ray(origin, localForward), ray);
                case DragAxis.XY:
                    return RayPlaneIntersection(ray, origin, localForward);
                case DragAxis.XZ:
                    return RayPlaneIntersection(ray, origin, localUp);
                case DragAxis.YZ:
                    return RayPlaneIntersection(ray, origin, localRight);
                case DragAxis.All:
                    return RayPlaneIntersection(ray, origin, cam.transform.forward);
                default:
                    return origin;
            }
        }

        private static Vector3 ClosestPointOnRay(Ray axisRay, Ray cameraRay)
        {
            var a = axisRay.origin;
            var b = axisRay.direction;
            var c = cameraRay.origin;
            var d = cameraRay.direction;

            var e = a - c;
            var bd = Vector3.Dot(b, d);
            var be = Vector3.Dot(b, e);
            var de = Vector3.Dot(d, e);
            var bb = Vector3.Dot(b, b);
            var dd = Vector3.Dot(d, d);

            var denom = bb * dd - bd * bd;
            if (Mathf.Abs(denom) < 0.0001f)
                return a;

            var t = (bd * de - be * dd) / denom;
            return a + b * t;
        }

        private static Vector3 RayPlaneIntersection(Ray ray, Vector3 planePoint, Vector3 planeNormal)
        {
            var denom = Vector3.Dot(planeNormal, ray.direction);
            if (Mathf.Abs(denom) < 0.0001f)
                return planePoint;

            var t = Vector3.Dot(planePoint - ray.origin, planeNormal) / denom;
            return ray.origin + ray.direction * t;
        }

        // ============================================================================
        // Animation Recording Support
        // ============================================================================

        private MaterialPropertyBlock _propertyBlock;

        // Cached reflection for AnimationWindow
        private static Type _animationWindowType;
        private static PropertyInfo _animationWindowStateProperty;
        private static PropertyInfo _currentTimeProperty;
        private static PropertyInfo _activeAnimationClipProperty;
        private static EditorWindow _cachedAnimationWindow;

        private void SetMaterialVector(int propertyId, string propertyName, Vector4 value)
        {
            // Record for undo
            Undo.RecordObject(_originalMaterial, "Modify Material");

            _originalMaterial.SetVector(propertyId, value);

            // For animation recording: add keyframe directly to AnimationClip
            if (AnimationMode.InAnimationMode() && _targetRenderer != null)
            {
                // Apply via MaterialPropertyBlock for visual feedback
                _propertyBlock ??= new MaterialPropertyBlock();
                _targetRenderer.GetPropertyBlock(_propertyBlock);
                _propertyBlock.SetVector(propertyId, value);
                _targetRenderer.SetPropertyBlock(_propertyBlock);

                // Add keyframe to animation clip
                AddKeyframeToAnimationClip(propertyName, value);
            }

            EditorUtility.SetDirty(_originalMaterial);
        }

        private void AddKeyframeToAnimationClip(string propertyName, Vector4 value)
        {
            if (_targetRenderer == null) return;

            // Get AnimationWindow via reflection
            var (clip, time) = GetAnimationWindowState();
            if (clip == null) return;

            // Get path from root to renderer
            var root = GetAnimationRoot();
            if (root == null) return;

            var path = AnimationUtility.CalculateTransformPath(_targetRenderer.transform, root);

            // Create bindings for each component (x, y, z, w)
            var components = new[] { "x", "y", "z", "w" };
            var values = new[] { value.x, value.y, value.z, value.w };

            Undo.RecordObject(clip, "Add Keyframe");

            for (var i = 0; i < 4; i++)
            {
                var binding = new EditorCurveBinding
                {
                    path = path,
                    type = typeof(Renderer),
                    propertyName = $"material.{propertyName}.{components[i]}"
                };

                // Get existing curve or create new one
                var curve = AnimationUtility.GetEditorCurve(clip, binding) ?? new AnimationCurve();

                // Add or update keyframe at current time
                var keyframe = new Keyframe(time, values[i]);
                var existingIndex = FindKeyframeAtTime(curve, time);
                if (existingIndex >= 0)
                    curve.MoveKey(existingIndex, keyframe);
                else
                    curve.AddKey(keyframe);

                AnimationUtility.SetEditorCurve(clip, binding, curve);
            }
        }

        private static int FindKeyframeAtTime(AnimationCurve curve, float time)
        {
            const float tolerance = 0.0001f;
            for (var i = 0; i < curve.keys.Length; i++)
            {
                if (Mathf.Abs(curve.keys[i].time - time) < tolerance)
                    return i;
            }
            return -1;
        }

        private Transform GetAnimationRoot()
        {
            // Try to get root from Animator
            var animator = _targetRenderer.GetComponentInParent<Animator>();
            if (animator != null)
                return animator.transform;

            // Try to get root from Animation
            var animation = _targetRenderer.GetComponentInParent<Animation>();
            if (animation != null)
                return animation.transform;

            return null;
        }

        private (AnimationClip clip, float time) GetAnimationWindowState()
        {
            try
            {
                // Cache reflection types
                if (_animationWindowType == null)
                {
                    _animationWindowType = Type.GetType("UnityEditor.AnimationWindow,UnityEditor");
                    if (_animationWindowType == null) return (null, 0);
                }

                // Get AnimationWindow instance
                _cachedAnimationWindow ??= EditorWindow.GetWindow(_animationWindowType, false, null, false);
                if (_cachedAnimationWindow == null) return (null, 0);

                // Get state property
                if (_animationWindowStateProperty == null)
                {
                    _animationWindowStateProperty = _animationWindowType.GetProperty("state",
                        BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                    if (_animationWindowStateProperty == null) return (null, 0);
                }

                var state = _animationWindowStateProperty.GetValue(_cachedAnimationWindow);
                if (state == null) return (null, 0);

                var stateType = state.GetType();

                // Get current time
                if (_currentTimeProperty == null)
                {
                    _currentTimeProperty = stateType.GetProperty("currentTime",
                        BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                }

                // Get active animation clip
                if (_activeAnimationClipProperty == null)
                {
                    _activeAnimationClipProperty = stateType.GetProperty("activeAnimationClip",
                        BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                }

                var time = _currentTimeProperty != null ? (float)_currentTimeProperty.GetValue(state) : 0f;
                var clip = _activeAnimationClipProperty != null
                    ? _activeAnimationClipProperty.GetValue(state) as AnimationClip
                    : null;

                return (clip, time);
            }
            catch (Exception e)
            {
                Debug.LogWarning($"Failed to get AnimationWindow state: {e.Message}");
                return (null, 0);
            }
        }

        private void ApplyTextPosition(int index, Vector3 worldPos)
        {
            var rootIndex = _previewMaterial.HasProperty(IDRootIndex[index]) ? _previewMaterial.GetInt(IDRootIndex[index]) : 0;

            Vector3 newLocalPos;
            if (rootIndex > 0 && rootIndex <= RootCount)
            {
                var rootIdx = rootIndex - 1;
                var invMatrix = _rootMatrices[rootIdx].inverse;
                newLocalPos = invMatrix.MultiplyPoint3x4(worldPos - _rootPositions[rootIdx]);
            }
            else
            {
                newLocalPos = worldPos;
            }

            var posInCm = newLocalPos * MtoCm;
            SetMaterialVector(IDPosition[index], $"_Position{index}", new Vector4(posInCm.x, posInCm.y, posInCm.z, 0));
        }

        private void ApplyCameraPosition(Vector3 worldPos)
        {
            var posInCm = worldPos * MtoCm;
            SetMaterialVector(IDCameraPosition, "_CameraPosition", new Vector4(posInCm.x, posInCm.y, posInCm.z, 0));
        }

        // ============================================================================
        // Rotation Handle
        // ============================================================================

        private void DrawRotationHandle(Vector3 position, Quaternion rotation)
        {
            Handles.matrix = Matrix4x4.identity;

            var handleLength = GetHandleSize(position);
            var rotationRadius = handleLength * RotationHandleRatio;

            // Local axes
            var localRight = rotation * Vector3.right;
            var localUp = rotation * Vector3.up;
            var localForward = rotation * Vector3.forward;

            var hoveredRotAxis = DragAxis.None;
            if (!_isDragging && _currentRect.width > 0)
            {
                hoveredRotAxis = GetHoveredRotationAxis(_currentRect, Event.current.mousePosition);
            }

            // X axis rotation (red) - rotates around local X
            Handles.color = (_dragMode == DragMode.Rotation && _dragAxis == DragAxis.X) || hoveredRotAxis == DragAxis.X
                ? Color.yellow : new Color(1f, 0f, 0f, 0.8f);
            Handles.DrawWireDisc(position, localRight, rotationRadius);

            // Y axis rotation (green) - rotates around local Y
            Handles.color = (_dragMode == DragMode.Rotation && _dragAxis == DragAxis.Y) || hoveredRotAxis == DragAxis.Y ? Color.yellow : new Color(0f, 1f, 0f, 0.8f);
            Handles.DrawWireDisc(position, localUp, rotationRadius);

            // Z axis rotation (blue) - rotates around local Z
            Handles.color = (_dragMode == DragMode.Rotation && _dragAxis == DragAxis.Z) || hoveredRotAxis == DragAxis.Z ? Color.yellow : new Color(0f, 0f, 1f, 0.8f);
            Handles.DrawWireDisc(position, localForward, rotationRadius);

            // Screen-space rotation (white) - rotates around camera forward
            Handles.color = (_dragMode == DragMode.Rotation && _dragAxis == DragAxis.All) || hoveredRotAxis == DragAxis.All ? Color.yellow : new Color(1f, 1f, 1f, 0.5f);
            Handles.DrawWireDisc(position, _previewUtility.camera.transform.forward, rotationRadius * 1.1f);
        }

        private DragAxis GetHoveredRotationAxis(Rect rect, Vector2 mousePos)
        {
            if (_previewUtility == null || !TryGetSelectedWorldTransform(out var targetPos, out var targetRot))
                return DragAxis.None;

            // Local axes
            var localRight = targetRot * Vector3.right;
            var localUp = targetRot * Vector3.up;
            var localForward = targetRot * Vector3.forward;

            var handleLength = GetHandleSize(targetPos);
            var rotationRadius = handleLength * RotationHandleRatio;

            var screenOrigin = WorldToScreen(rect, targetPos);

            // Check screen-space ring first (outermost)
            var screenRadiusAll = GetScreenRadius(rect, targetPos, rotationRadius * 1.1f);
            var distToOrigin = Vector2.Distance(mousePos, screenOrigin);
            if (Mathf.Abs(distToOrigin - screenRadiusAll) < RotationHitThreshold)
                return DragAxis.All;

            // Check each axis ring using local axes
            if (IsOnRotationRing(rect, mousePos, targetPos, localRight, rotationRadius, RotationHitThreshold))
                return DragAxis.X;
            if (IsOnRotationRing(rect, mousePos, targetPos, localUp, rotationRadius, RotationHitThreshold))
                return DragAxis.Y;
            if (IsOnRotationRing(rect, mousePos, targetPos, localForward, rotationRadius, RotationHitThreshold))
                return DragAxis.Z;

            return DragAxis.None;
        }

        private bool IsOnRotationRing(Rect rect, Vector2 mousePos, Vector3 center, Vector3 axis, float radius, float threshold)
        {
            // Sample points on the ring and find closest
            var minDist = float.MaxValue;
            for (var i = 0; i < RotationHandleSegments; i++)
            {
                var angle = (float)i / RotationHandleSegments * Mathf.PI * 2f;
                var tangent = Vector3.Cross(axis, Vector3.up);
                if (tangent.sqrMagnitude < 0.001f)
                    tangent = Vector3.Cross(axis, Vector3.right);
                tangent.Normalize();
                var bitangent = Vector3.Cross(axis, tangent);

                var pointOnRing = center + (tangent * Mathf.Cos(angle) + bitangent * Mathf.Sin(angle)) * radius;
                var screenPoint = WorldToScreen(rect, pointOnRing);
                var dist = Vector2.Distance(mousePos, screenPoint);
                minDist = Mathf.Min(minDist, dist);
            }

            return minDist < threshold;
        }

        private float GetScreenRadius(Rect rect, Vector3 center, float worldRadius)
        {
            var edgePoint = center + _previewUtility.camera.transform.right * worldRadius;
            var screenCenter = WorldToScreen(rect, center);
            var screenEdge = WorldToScreen(rect, edgePoint);
            return Vector2.Distance(screenCenter, screenEdge);
        }

        private void StartRotationDrag(Rect rect, Vector2 mousePos, DragAxis axis)
        {
            _isDragging = true;
            _dragAxis = axis;
            _dragMode = DragMode.Rotation;

            if (_selectedTextIndex >= 0)
                GetTextWorldTransform(_selectedTextIndex, out _dragStartWorldPos, out _dragStartRotation);
            else if (_cameraSelected)
                GetCameraWorldTransform(out _dragStartWorldPos, out _dragStartRotation);

            _dragStartAngle = GetRotationAngle(rect, mousePos, _dragStartWorldPos, _dragStartRotation, axis);
            Undo.RecordObject(_originalMaterial, _selectedTextIndex >= 0 ? "Rotate Text" : "Rotate Camera");
        }

        private void UpdateRotationDrag(Rect rect, Vector2 mousePos)
        {
            if (!_isDragging || _dragMode != DragMode.Rotation) return;

            var currentAngle = GetRotationAngle(rect, mousePos, _dragStartWorldPos, _dragStartRotation, _dragAxis);
            var deltaAngle = currentAngle - _dragStartAngle;

            // Local axes based on start rotation
            var rotationAxis = _dragAxis switch
            {
                DragAxis.X => _dragStartRotation * Vector3.right,
                DragAxis.Y => _dragStartRotation * Vector3.up,
                DragAxis.Z => _dragStartRotation * Vector3.forward,
                DragAxis.All => _previewUtility.camera.transform.forward,
                _ => _dragStartRotation * Vector3.up
            };

            var newRotation = Quaternion.AngleAxis(deltaAngle * Mathf.Rad2Deg, rotationAxis) * _dragStartRotation;

            if (_selectedTextIndex >= 0)
            {
                ApplyTextRotation(_selectedTextIndex, newRotation);
            }
            else if (_cameraSelected)
            {
                ApplyCameraRotation(newRotation);
            }
        }

        private float GetRotationAngle(Rect rect, Vector2 mousePos, Vector3 center, Quaternion rotation, DragAxis axis)
        {
            var cam = _previewUtility.camera;

            // Convert GUI points to viewport coordinates
            var mouseViewport = new Vector2(
                (mousePos.x - rect.x) / rect.width,
                1f - (mousePos.y - rect.y) / rect.height
            );
            var ray = cam.ViewportPointToRay(mouseViewport);

            // Local axes
            var rotationAxis = axis switch
            {
                DragAxis.X => rotation * Vector3.right,
                DragAxis.Y => rotation * Vector3.up,
                DragAxis.Z => rotation * Vector3.forward,
                DragAxis.All => cam.transform.forward,
                _ => rotation * Vector3.up
            };

            // Intersect with rotation plane
            var hitPoint = RayPlaneIntersection(ray, center, rotationAxis);
            var direction = (hitPoint - center).normalized;

            // Get tangent and bitangent for the rotation plane
            var tangent = Vector3.Cross(rotationAxis, Vector3.up);
            if (tangent.sqrMagnitude < 0.001f)
                tangent = Vector3.Cross(rotationAxis, Vector3.right);
            tangent.Normalize();
            var bitangent = Vector3.Cross(rotationAxis, tangent);

            // Project direction onto tangent/bitangent plane
            var x = Vector3.Dot(direction, tangent);
            var y = Vector3.Dot(direction, bitangent);

            return Mathf.Atan2(y, x);
        }

        private void ApplyTextRotation(int index, Quaternion worldRot)
        {
            var rootIndex = _previewMaterial.HasProperty(IDRootIndex[index]) ? _previewMaterial.GetInt(IDRootIndex[index]) : 0;

            Quaternion newLocalRot;
            if (rootIndex > 0 && rootIndex <= RootCount)
            {
                var rootIdx = rootIndex - 1;
                newLocalRot = Quaternion.Inverse(_rootMatrices[rootIdx].rotation) * worldRot;
            }
            else
            {
                newLocalRot = worldRot;
            }

            var euler = newLocalRot.eulerAngles;
            SetMaterialVector(IDRotation[index], $"_Rotation{index}", new Vector4(euler.x, euler.y, euler.z, 0));
        }

        private void ApplyCameraRotation(Quaternion worldRot)
        {
            var euler = worldRot.eulerAngles;
            SetMaterialVector(IDCameraRotation, "_CameraRotation", new Vector4(euler.x, euler.y, euler.z, 0));
        }

        // ============================================================================
        // Scale Handle
        // ============================================================================

        private void DrawScaleHandle(Vector3 position, Quaternion rotation, Vector3 scale)
        {
            Handles.matrix = Matrix4x4.identity;

            var handleLength = GetHandleSize(position);
            var rotationRadius = handleLength * RotationHandleRatio; // Start from outside rotation handle
            var scaleLength = handleLength * ScaleHandleRatio;
            var cubeSize = handleLength * ScaleCubeSize;

            // Local axes
            var localRight = rotation * Vector3.right;
            var localUp = rotation * Vector3.up;
            var localForward = rotation * Vector3.forward;

            var hoveredScaleAxis = DragAxis.None;
            if (!_isDragging && _currentRect.width > 0)
            {
                hoveredScaleAxis = GetHoveredScaleAxis(_currentRect, Event.current.mousePosition);
            }

            // When dragging, start from origin instead of rotation ring
            var startRadius = (_isDragging && _dragMode == DragMode.Scale) ? 0f : rotationRadius;

            // X axis scale (red)
            var xStart = position + localRight * startRadius;
            var xEnd = position + localRight * scaleLength;
            Handles.color = (_dragMode == DragMode.Scale && _dragAxis == DragAxis.X) || hoveredScaleAxis == DragAxis.X ? Color.yellow : new Color(1f, 0f, 0f, 1f);
            Handles.DrawLine(xStart, xEnd, 2f);
            Handles.CubeHandleCap(0, xEnd, rotation, cubeSize, EventType.Repaint);

            // Y axis scale (green)
            var yStart = position + localUp * startRadius;
            var yEnd = position + localUp * scaleLength;
            Handles.color = (_dragMode == DragMode.Scale && _dragAxis == DragAxis.Y) || hoveredScaleAxis == DragAxis.Y ? Color.yellow : new Color(0f, 1f, 0f, 1f);
            Handles.DrawLine(yStart, yEnd, 2f);
            Handles.CubeHandleCap(0, yEnd, rotation, cubeSize, EventType.Repaint);

            // Z axis scale (blue)
            var zStart = position + localForward * startRadius;
            var zEnd = position + localForward * scaleLength;
            Handles.color = (_dragMode == DragMode.Scale && _dragAxis == DragAxis.Z) || hoveredScaleAxis == DragAxis.Z ? Color.yellow : new Color(0f, 0f, 1f, 1f);
            Handles.DrawLine(zStart, zEnd, 2f);
            Handles.CubeHandleCap(0, zEnd, rotation, cubeSize, EventType.Repaint);

            // Uniform scale (center cube)
            Handles.color = (_dragMode == DragMode.Scale && _dragAxis == DragAxis.All) || hoveredScaleAxis == DragAxis.All ? Color.yellow : new Color(0.8f, 0.8f, 0.8f, 1f);
            Handles.CubeHandleCap(0, position, rotation, cubeSize, EventType.Repaint);
        }

        private DragAxis GetHoveredScaleAxis(Rect rect, Vector2 mousePos)
        {
            if (_previewUtility == null || _selectedTextIndex < 0) return DragAxis.None;

            GetTextWorldTransform(_selectedTextIndex, out var targetPos, out var targetRot);

            // Local axes
            var localRight = targetRot * Vector3.right;
            var localUp = targetRot * Vector3.up;
            var localForward = targetRot * Vector3.forward;

            var handleLength = GetHandleSize(targetPos);
            var rotationRadius = handleLength * RotationHandleRatio * 1.1f; // Line start
            var scaleLength = handleLength * ScaleHandleRatio; // Line end

            var screenOrigin = WorldToScreen(rect, targetPos);

            // Line start points (from rotation ring)
            var screenXStart = WorldToScreen(rect, targetPos + localRight * rotationRadius);
            var screenYStart = WorldToScreen(rect, targetPos + localUp * rotationRadius);
            var screenZStart = WorldToScreen(rect, targetPos + localForward * rotationRadius);

            // Line end points (cube positions)
            var screenXEnd = WorldToScreen(rect, targetPos + localRight * scaleLength);
            var screenYEnd = WorldToScreen(rect, targetPos + localUp * scaleLength);
            var screenZEnd = WorldToScreen(rect, targetPos + localForward * scaleLength);

            // Check cube endpoints first (higher priority)
            if (Vector2.Distance(mousePos, screenXEnd) < ScaleCubeHitThreshold)
                return DragAxis.X;
            if (Vector2.Distance(mousePos, screenYEnd) < ScaleCubeHitThreshold)
                return DragAxis.Y;
            if (Vector2.Distance(mousePos, screenZEnd) < ScaleCubeHitThreshold)
                return DragAxis.Z;

            // Check scale lines
            if (DistanceToLineSegment(mousePos, screenXStart, screenXEnd) < ScaleLineHitThreshold)
                return DragAxis.X;
            if (DistanceToLineSegment(mousePos, screenYStart, screenYEnd) < ScaleLineHitThreshold)
                return DragAxis.Y;
            if (DistanceToLineSegment(mousePos, screenZStart, screenZEnd) < ScaleLineHitThreshold)
                return DragAxis.Z;

            // Check center for uniform scale
            if (Vector2.Distance(mousePos, screenOrigin) < ScaleCubeHitThreshold * 0.8f)
                return DragAxis.All;

            return DragAxis.None;
        }

        private void StartScaleDrag(Rect rect, Vector2 mousePos, DragAxis axis)
        {
            _isDragging = true;
            _dragAxis = axis;
            _dragMode = DragMode.Scale;

            _dragStartWorldPos = GetTextWorldPosition(_selectedTextIndex);
            var scaleRaw = _previewMaterial.GetVector(IDScale[_selectedTextIndex]);
            _dragStartScale = new Vector3(scaleRaw.x, scaleRaw.y, scaleRaw.z);

            // Store initial distance from center for scaling calculation
            var screenOrigin = WorldToScreen(rect, _dragStartWorldPos);
            _dragStartDistance = Vector2.Distance(mousePos, screenOrigin);

            Undo.RecordObject(_originalMaterial, "Scale Text");
        }

        private void UpdateScaleDrag(Rect rect, Vector2 mousePos)
        {
            if (!_isDragging || _dragMode != DragMode.Scale) return;

            var screenOrigin = WorldToScreen(rect, _dragStartWorldPos);
            var currentDistance = Vector2.Distance(mousePos, screenOrigin);

            // Calculate scale factor based on distance change
            var scaleFactor = _dragStartDistance > 0.001f ? currentDistance / _dragStartDistance : 1f;
            scaleFactor = Mathf.Max(0.01f, scaleFactor); // Prevent zero/negative scale

            Vector3 newScale;
            switch (_dragAxis)
            {
                case DragAxis.X:
                    newScale = new Vector3(_dragStartScale.x * scaleFactor, _dragStartScale.y, _dragStartScale.z);
                    break;
                case DragAxis.Y:
                    newScale = new Vector3(_dragStartScale.x, _dragStartScale.y * scaleFactor, _dragStartScale.z);
                    break;
                case DragAxis.Z:
                    newScale = new Vector3(_dragStartScale.x, _dragStartScale.y, _dragStartScale.z * scaleFactor);
                    break;
                case DragAxis.All:
                    newScale = _dragStartScale * scaleFactor;
                    break;
                default:
                    newScale = _dragStartScale;
                    break;
            }

            ApplyTextScale(_selectedTextIndex, newScale);
        }

        private void ApplyTextScale(int index, Vector3 scale)
        {
            SetMaterialVector(IDScale[index], $"_Scale{index}", new Vector4(scale.x, scale.y, scale.z, 0));
        }
    }
}
#endif
