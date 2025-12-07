# Typography

GPU Text Rendering for Unity / VRChat

[![Unity 2022.3+](https://img.shields.io/badge/Unity-2022.3+-black.svg)](https://unity.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

[Japanese](README-JP.md)

Render **32 texts** in **1 draw call** with high quality. Fully GPU-driven, no C# runtime required.

## Performance

|                | Fragment Math | Fragment Texture |
|----------------|--------------:|-----------------:|
| **Typography** |        **55** |            **2** |
| SSVFX          |         3,702 |              102 |
| TexSvfx        |         5,585 |              210 |

**1/102** fragment instructions (vs TexSvfx, SSVFX). Processing concentrated in Vertex Shader - performance gap widens with resolution.

|                |         Avg |  Ratio |
|----------------|------------:|-------:|
| **Typography** | **0.540ms** | **1x** |
| SSVFX          |     1.205ms |   2.2x |
| TexSvfx        |     6.127ms |  11.4x |

## Features

- High-quality edges with MSDF (sharp at any scale)
- Unicode support (Japanese, emoji, ligatures)
- Up to 8 fonts simultaneously
- Text / Image mode
- 5 Root Transforms (hierarchical structure)
- Typewriter / Curve Path / Shake effects
- Outline / Drop Shadow

## Installation

1. Import [Thry Editor](https://github.com/Thryrallo/ThryEditor)
2. Import Typography unitypackage
3. Set `Typography/Mesh.asset` to MeshFilter
4. Create Material with Shader: `GekikaraStore/Typography`

## Basic Usage

1. Add fonts in **Fonts** section
2. Enter text in **Text Settings**, click "Gen"
3. Adjust Position / Rotation / Scale

## Properties

### Global

| Property | Description |
|----------|-------------|
| Project | Project name (materials with same project share atlas) |

### Camera Settings

| Property | Description |
|----------|-------------|
| Position | Virtual camera position (for screen-space mode) |
| Rotation | Virtual camera rotation |
| FOV | Field of view (10-120) |

### Root Transforms

| Property | Description |
|----------|-------------|
| Position | Root position (cm) |
| Rotation | Root rotation |
| Scale | Root scale |

5 roots available. Assign texts to a Root for hierarchical transformation.

### Text Settings

| Property | Description |
|----------|-------------|
| Root | Parent root (None / Root 1-5) |
| World Space | ON: world coordinates, OFF: screen coordinates |
| Mode | Text_Horizontal / Text_Vertical / Image |
| Text | Text input + Gen button |
| Font | Font selection (from Fonts section) |
| Layer | Draw order (0-31, higher = front) |
| Color | Text color (HDR) |
| Position | Position (cm) |
| Rotation | Rotation (ZXY order, Unity standard) |
| Scale | Scale |
| Pivot | Rotation center (character width units) |

### Animator

| Property | Description |
|----------|-------------|
| **Typewriter** | |
| Mode | Left to Right / Right to Left / Center Out |
| Progress | Display progress (0-1) |
| Direction | Movement direction on appear |
| Rotation | Rotation on appear |
| **Kerning & Tracking** | |
| Spacing | Character spacing (-1 to 1) |

### Effector

| Property | Description |
|----------|-------------|
| **Curve Path** | |
| X/Y/Z Curve | Curve for each axis |
| Intensity | Deformation strength (0-1) |
| Offset | Curve start position (0-1) |
| Speed | Animation speed |
| Rotation | Rotation along curve (0-1) |
| **Shake** | |
| Amplitude | Amplitude (0-1) |
| Frequency | Frequency (0-20) |
| Blend | Per-character to per-line blend |
| **Outline** | |
| Width | Width (0-0.1) |
| Color | Color (HDR) |
| **Drop Shadow** | |
| Intensity | Intensity (0-1) |
| Offset | Offset |
| Color | Color (HDR) |

### Rendering Settings

| Property | Description |
|----------|-------------|
| Fade Min/Max | Distance fade range |
| Render Type | Opaque / Transparent / Overlay |
| Cull | Culling mode |
| ZTest | Depth test |
| ZWrite | Depth write |
| Source/Destination Blend | Blend mode |

### Debug

| Property | Description |
|----------|-------------|
| Pivot Color/Size | Pivot display (Editor only) |
| Bounds Color/Width | Bounding box display |

## Specifications

| Item | Value |
|------|-------|
| Text count | 32 |
| Font count | 8 |
| Atlas | 4096x4096 BC7 |
| Max characters | 32 |

## Dependencies

- [Thry Editor](https://github.com/Thryrallo/ThryEditor) - Material editor

## License

MIT - See [LICENSE](LICENSE)

This project uses [msdf-atlas-gen](https://github.com/Chlumsky/msdf-atlas-gen) (MIT License). See [THIRD-PARTY-LICENSES.md](THIRD-PARTY-LICENSES.md) for details.

## Sample

https://vrchat.com/home/avatar/avtr_20c77b57-edc0-4de3-bace-3b7b21b998bd

## Acknowledgments

This project was inspired by [ShaderToyText](https://www.shadertoy.com/view/XtfyRS) by [Krzysztof Narkowicz (knarkowicz)](https://knarkowicz.wordpress.com/). His elegant approach to GPU-based text rendering laid the foundation for this work. Thank you for sharing your knowledge with the community.

## Special Thanks
- 皐月-Satuki
- ぷくぷくまる
- UniTea (group)
- Cute Aggression (group)
- Everyone who helped with announcements
