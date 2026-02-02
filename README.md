# Typography

GPU Text Rendering for Unity / VRChat

[![Unity 2022.3+](https://img.shields.io/badge/Unity-2022.3+-black.svg)](https://unity.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

[Japanese](README-JP.md)

Render **32 texts** in **1 draw call** with high quality. Fully GPU-driven, no C# runtime required.

## Performance

Fragment shader instruction counts (Unity compiled shader stats, d3d11):

|                | Math | Texture | Branch |
|----------------|-----:|--------:|-------:|
| **Typography** | **920** | **3** | **31** |
| SSVFX          | 3,702 | 102 | 201 |
| TexSvfx        | 5,585 | 210 | 255 |

**1/4** fragment instructions vs alternatives. Processing concentrated in Vertex Shader - performance gap widens with resolution.

|                |         Avg |    Ratio |
|----------------|------------:|---------:|
| **Typography** | **0.471ms** | **1x** |
| SSVFX          |     0.851ms |   1.8x |
| TexSV          |     6.094ms |  13.0x |

## Features

- High-quality edges with MSDF (sharp at any scale)
- Unicode support (Japanese, emoji, ligatures)
- Up to 8 fonts simultaneously
- 5 Root Transforms (hierarchical structure)
- Typewriter / Curve Path / Shake effects
- Outline / Shadow & Glow / Fractal Noise
- Stencil buffer support
- VR Scale adjustment

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
| Space | Screen / World coordinate mode |
| Mode | Text_Horizontal / Text_Vertical |
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
| Type | Sequential (1 char at a time) / Block (fixed window) |
| Direction | Left to Right / Right to Left / Center Out (Sequential) |
| Centering | Center text alignment (Enable / Disable) |
| Progress | Display progress (0-1, Sequential) |
| Smooth | Character appear fade (0-1) |
| Fade Width | Next character overlap (0-1, 0=wait until complete) |
| Offset | Movement offset on appear |
| Rotation | Rotation on appear |
| Scale | Scale animation on appear |
| Visible Count | Static visible chars (Block) |
| Animating Count | Transitioning chars (Block) |
| Char Delay | Per-char stagger (Block) |
| **Kerning & Tracking** | |
| Anchor | Spacing anchor (Center / Left / Right) |
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
| Mode | Outline (filled) / Stroke (outline only) |
| Width | Width (0-1) |
| Color | Color (HDR) |
| **Shadow & Glow** | |
| Intensity | Intensity (0-1) |
| Softness | Soft shadow blur (0-1) |
| Offset | Offset |
| Color | Color (HDR) |
| **Fractal Noise** | |
| Mode | Simplex / Curl / FBM / Turbulence / Ridged / Marble |
| Intensity | Effect intensity (0-1) |
| Scale | Noise scale |
| Speed | Animation speed |
| Color | Effect color (HDR) |
| Blend | Multiply / Replace / Add |

### Rendering Settings

| Property | Description |
|----------|-------------|
| Fade Min/Max | Distance fade range |
| Render Type | Opaque / Transparent / Overlay |
| Cull | Culling mode |
| ZTest | Depth test |
| ZWrite | Depth write |
| Source/Destination Blend | Blend mode |
| **Stencil** | |
| Reference | Stencil reference value (0-255) |
| Read/Write Mask | Mask value |
| Compare | Comparison function |
| Pass/Fail/ZFail | Stencil operation |
| **Utility** | |
| Quad Padding | Character quad size expansion (0-1) |
| VR Scale | VR environment scale (0.1-1) |

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
- あまね
- 一ノ瀬
- UniTea (group)
- Everyone who helped with announcements
