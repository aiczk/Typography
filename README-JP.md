# Typography

GPU テキストレンダリング for Unity / VRChat

[![Unity 2022.3+](https://img.shields.io/badge/Unity-2022.3+-black.svg)](https://unity.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

[English](README.md)

**1 ドローコール**で **32 テキスト**を高品質描画。C# ランタイム不要の完全 GPU 駆動。

## パフォーマンス

Fragment Shader 命令数（Unity compiled shader stats, d3d11）：

|                | Math | Texture | Branch |
|----------------|-----:|--------:|-------:|
| **Typography** | **920** | **3** | **31** |
| SSVFX          | 3,702 | 102 | 201 |
| TexSvfx        | 5,585 | 210 | 255 |

Fragment 命令数 **1/4**。処理を Vertex Shader に集約し、解像度が上がるほど差が拡大。

|                |         Avg |     比率 |
|----------------|------------:|-------:|
| **Typography** | **0.471ms** | **1x** |
| SSVFX          |     0.851ms |  1.8x  |
| TexSvfx        |     6.094ms |  13.0x |

> Imagery も同等のパフォーマンス（0.500ms）を実現

## 機能

- MSDF による高品質エッジ（拡大縮小でもシャープ）
- Unicode 対応（日本語、絵文字、合字）
- 最大 8 フォント同時使用
- 5 Root Transform（階層構造）
- Typewriter / Curve Path / Shake エフェクト
- Outline / Shadow & Glow / Fractal Noise
- Stencil バッファ対応
- VR スケール調整

## インストール

1. [Thry Editor](https://github.com/Thryrallo/ThryEditor) をインポート
2. Typography unitypackage をインポート
3. `Typography/Mesh.asset` を MeshFilter に設定
4. Material 作成 → Shader: `GekikaraStore/Typography`

## 基本的な使い方

1. **Fonts** セクションでフォント追加
2. **Text Settings** でテキスト入力、「Gen」クリック
3. Position / Rotation / Scale で配置調整

## プロパティ

### Global

| プロパティ | 説明 |
|-----------|------|
| Project | プロジェクト名（同一プロジェクトのマテリアルはアトラスを共有） |

### Camera Settings

| プロパティ | 説明 |
|-----------|------|
| Position | 仮想カメラ位置（スクリーン座標モード用） |
| Rotation | 仮想カメラ回転 |
| FOV | 視野角（10-120） |

### Root Transforms

| プロパティ | 説明 |
|-----------|------|
| Position | ルート位置（cm） |
| Rotation | ルート回転 |
| Scale | ルートスケール |

5つのルートを定義可能。テキストを Root に割り当てると階層的に変形。

### Text Settings

| プロパティ | 説明 |
|-----------|------|
| Root | 親ルート（None / Root 1-5） |
| Space | Screen / World 座標モード |
| Mode | Text_Horizontal / Text_Vertical |
| Text | テキスト入力 + Gen ボタン |
| Font | フォント選択（Fonts で追加したもの） |
| Layer | 描画順（0-31、大きいほど前面） |
| Color | テキスト色（HDR 対応） |
| Position | 位置（cm） |
| Rotation | 回転（ZXY 順序、Unity 準拠） |
| Scale | スケール |
| Pivot | 回転中心（文字幅単位） |

### Animator

| プロパティ | 説明 |
|-----------|------|
| **Typewriter** | |
| Type | Sequential（1文字ずつ）/ Block（固定ウィンドウ） |
| Direction | Left to Right / Right to Left / Center Out（Sequential） |
| Centering | テキスト中央揃え（Enable / Disable） |
| Progress | 表示進行（0-1、Sequential） |
| Smooth | 文字出現フェード（0-1） |
| Fade Width | 次文字の重なり（0-1、0=完全出現まで待機） |
| Offset | 出現時の移動オフセット |
| Rotation | 出現時の回転 |
| Scale | 出現時のスケールアニメーション |
| Visible Count | 静止表示文字数（Block） |
| Animating Count | アニメーションさせる文字数（Block） |
| Char Delay | 文字ごとの遅延（Block） |
| **Kerning & Tracking** | |
| Anchor | Spacing 基準点（Center / Left / Right） |
| Spacing | 文字間隔（-1 〜 1） |

### Effector

| プロパティ | 説明 |
|-----------|------|
| **Curve Path** | |
| X/Y/Z Curve | 各軸のカーブ |
| Intensity | 変形強度（0-1） |
| Offset | カーブ開始位置（0-1） |
| Speed | アニメーション速度 |
| Rotation | カーブに沿った回転（0-1） |
| **Shake** | |
| Amplitude | 振幅（0-1） |
| Frequency | 周波数（0-20） |
| Blend | 文字単位↔行単位のブレンド |
| **Outline** | |
| Mode | Outline（塗りあり）/ Stroke（輪郭線のみ） |
| Width | 太さ（0-1） |
| Color | 色（HDR） |
| **Shadow & Glow** | |
| Intensity | 強度（0-1） |
| Softness | ソフトシャドウのぼかし（0-1） |
| Offset | オフセット |
| Color | 色（HDR） |
| **Fractal Noise** | |
| Mode | Simplex / Curl / FBM / Turbulence / Ridged / Marble |
| Intensity | エフェクト強度（0-1） |
| Scale | ノイズスケール |
| Speed | アニメーション速度 |
| Color | エフェクト色（HDR） |
| Blend | Multiply / Replace / Add |

### Rendering Settings

| プロパティ | 説明 |
|-----------|------|
| Fade Min/Max | 距離フェード範囲 |
| Render Type | Opaque / Transparent / Overlay |
| Cull | カリングモード |
| ZTest | 深度テスト |
| ZWrite | 深度書き込み |
| Source/Destination Blend | ブレンドモード |
| **Stencil** | |
| Reference | ステンシル参照値（0-255） |
| Read/Write Mask | マスク値 |
| Compare | 比較関数 |
| Pass/Fail/ZFail | ステンシル操作 |
| **Utility** | |
| Quad Padding | 文字Quadサイズ拡張（0-1） |
| VR Scale | VR環境スケール（0.1-1） |

## 仕様

| 項目    | 値             |
|-------|---------------|
| テキスト数 | 32            |
| フォント数 | 8             |
| Atlas | 4096×4096 BC7 |
| 最大文字数 | 32            |

## 依存関係

- [Thry Editor](https://github.com/Thryrallo/ThryEditor) - マテリアルエディタ

## ライセンス

MIT - [LICENSE](LICENSE) 参照

本プロジェクトは [msdf-atlas-gen](https://github.com/Chlumsky/msdf-atlas-gen)（MIT License）を使用しています。詳細は [THIRD-PARTY-LICENSES.md](THIRD-PARTY-LICENSES.md) を参照してください。

## サンプル

https://vrchat.com/home/avatar/avtr_20c77b57-edc0-4de3-bace-3b7b21b998bd

## 謝辞

本プロジェクトは [Krzysztof Narkowicz (knarkowicz)](https://knarkowicz.wordpress.com/) 氏の [ShaderToyText](https://www.shadertoy.com/view/XtfyRS) に着想を得ています。GPU テキストレンダリングへの洗練されたアプローチが本作品の基盤となりました。知識をコミュニティに共有してくださったことに感謝いたします。

## Special Thanks（敬称略）
- 皐月-Satuki
- ぷくぷくまる
- あまね
- 一ノ瀬
- UniTea（グループ）
- その他の告知に協力してくださった皆様
