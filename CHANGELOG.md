# Changelog

## [2.4.0] - 2026-02-02

VR対応の改善と不具合修正です。

### Changed

- VR Scale → VR FOV に変更
  - カメラ位置に依存しない、より直感的なVR調整方式に変更しました
  - Camera Settings内に VR FOV プロパティを追加（デフォルト: 110）
  - VR環境では自動的にVR FOVが使用されます

### Fixed

- 10番目以降のテキストレイヤーが表示されない不具合を修正

---

## [2.3.0] - 2026-02-01

シェーダーの構造を見直しました。新エフェクト追加と一部機能の削除を含みます。
また、シェーダーパスをGekikaraStore/v2.3.0/Typographyに変更しました。

### Added

- Fractal Noise
	- 文字にフラクタルノイズをかけられるようになりました(Simplex, Curl, FBM, Turbulence, Ridged, Murble)

### Changed

- Typewriter
	- Fade Widthフィールドを追加しました。今まで文字が完全に出現するまで次の文字は表示されませんでしたが、このパラメータを操作するとそれを調整できます。
	- 要はなめらかに表示できるということです。
	
- Shadow & Glow
	- 手法を見直し、軽量に美しいシャドウが表示できるようになりました。

### Removed

- Lock In Optimized Shader
	- バグがあったので削除しました。

- MatCap, Texture
	- Fractal Noiseの方が軽量かつ様々な表現が出来るので削除しました。

---

## [2.1.0] - 2026-01-07

マイナーアップデート。新エフェクト追加と一部機能の削除を含みます。
テクスチャの再利用をおこなうため、自動的にTextureArrayにする機能をつけています(実験的)

### Added

- Typewriter
  - Centering有効時のスムーズ値を調整できるようになりました

- Outline
  - アウトラインの角を丸くできるようになりました
  - アウトラインをもっと太くできるようにしました

- MatCap
  - テキストにMatCapを適用できるようになりました
  - Bevel/Blendで効果を調整可能です

- Texture
  - テキストにテクスチャを適用できるようになりました
  - Glyph UV / World UV モードを選択可能です

- Particle
  - パーティクルを出せるようになりました
  - スクリーンスペース・ワールドスペース両方で使えます
  - 空間演出におすすめです

- Image
  - 32個の画像を出せるようにしました
  - Flipbook, Chromakeyに対応しています

### Changed

- Lock In Optimized Shader
  - シェーダーはビルド時に最適化されるようになりました
  - 検証はしましたが、もしバグってたらごめんなさい

- UI Changed
  - 各項目に色を付けてわかりやすくしました
  - Root TransformをText Settingsの外に置くように修正しました

- Shadow Dither
  - ディザパターンの名前を変更しました
  - Hash → Uniform, IGN → Golden, R2 → Halton

### Removed

- Gradient
  - グラデーション機能を削除しました
  - テクスチャの方を使用してください

- Debugger Animation
  - メンテが大変になってきたので一旦削除しました
  - 次のアプデで動くようにしたいですが、優先度とモチベは低いです

- Imagery
  - マテリアル間でのCamera Settingsの同期ができなかったので削除しました

---

## [2.0.0] - 2025-12-22

パフォーマンス改善・リファクタリング・機能追加がメインのアップデートです。
破壊的変更が含まれています。

### Fixed

- Typographyの設定ファイルのパスを`_Typography`から`Typography_Atlases`に修正しました
- Project名をタイプするたびにフォルダが生成されるのを修正しました
- Drop ShadowのSoftnessが全然ソフトじゃないのを修正しました
- DataTexture / FontArray 保存時に発生していたアセット名警告を修正しました

### Added

- Imagery
  - Imageryシェーダーを追加しました
  - 画像のみを表示するシンプルなシェーダーです
  - エフェクトは今後増やすつもりです(優先度低)

- Debugger
    - ScreenSpaceテキスト専用のエディタウィンドウを追加しました
    - Typography > Debugger からアクセス可能です
    - AnimationWindow連携もしていますが、不安定な箇所もあるのでアルファ版です
    - Imageryにはまだ対応していません

- Spacing Anchor
    - Spacingの基準点を選択できるようになりました
    - Center：中央を基準に左右へ拡大縮小（デフォルト）
    - Left：左端を固定し、右へ拡大
    - Right：右端を固定し、左へ拡大
    - Spacing が 0 のときは全モードで同一の表示になります

- Typewriter Centering
  - テキストの中央揃えができるようになりました
  - アニメーション中もレイアウトが崩れません

- Typewriter Smooth
  - 文字が表示される際のフェード幅を調整できるようになりました
  - 0 でハードエッジ、1 で滑らかなトランジションになります

- Typewriter Scale
  - 文字出現時にスケールアニメーションを適用できるようになりました
  - ポップインのような演出が可能です

- Outline Stroke Mode
    - Outline に Stroke モードを追加しました
    - 従来の Outline（塗りあり）に加え、輪郭線のみの描画が可能になりました

- Gradient
    - テキストにグラデーションを適用できるようになりました
    - 水平方向と垂直方向の切り替えが可能です
    - Color A / Color B で開始色と終了色を指定できます
    - Intensity スライダーでグラデーションの強度を調整できます

- Shadow Dither
    - ソフトシャドウのディザパターンを選択できるようになりました
    - Hash：ランダムなノイズパターン
    - IGN：Interleaved Gradient Noise（TAA向け）
    - R2：低差異列による均一な分布

- Shadow Samples
    - ソフトシャドウのサンプル数を 4〜32 の範囲で調整できます
    - 品質とパフォーマンスのバランスを取れるようになりました

- Stencil Settings
  - ステンシルバッファを完全に制御できるようになりました
  - マスク処理やポータルエフェクトに対応します

- Quad Padding
  - 文字ごとのQuadサイズを変更できるパラメータを追加しました
  - 文字やエフェクトが見切れることがなくなりました

- VR Scale
  - VR環境下での見え方を調整できるようになりました
  - VR Scaleで調整可能です

### Changed

- Space
  - `World Space` のトグル形式を廃止し、`Space` 列挙型（Screen / World）に変更しました
  - UI の一貫性が向上しています

- Camera Settings
  - カメラの Position を中心として Rotation が適用されるようになりました
  - より直感的なカメラ操作が可能になっています
  - v1系とは互換性がありません

- Text Settings
  - 座標系を標準座標系（Z-が前方）に統一しました
  - v1系とは互換性がありません

- Curve Move
  - カーブの中心点を補正するパラメータを追加しました
  - Intensityを増減させてもテキストが意図しない位置にズレないようになりました

- Curve Rotation
  - 曲線に沿った文字の回転を改善しました
  - カーブの接線方向に沿って自然に回転するようになりました

- Shader Architecture
  - シェーダーコードを Core.hlsl / Effects.hlsl / Macros.hlsl に分割しました
  - 保守性と可読性が向上しています

- v2f Structure
  - 頂点シェーダーからフラグメントシェーダーへのデータ転送を最適化しました

- MSDF Rendering
  - レンダリングで使用する値を事前計算するようにしました
  - シェーダーの動作がさらに軽量になりました

### Removed

- Image Mode
  - Image モードを削除しました
  - テキスト描画に機能を集中させ、シェーダーを軽量化しています

- Debug Mode
  - Debug モードを削除しました
  - デバッグ機能はTypographyDebugger.csに置き換えられました