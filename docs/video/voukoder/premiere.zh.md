---
icon: custom/premiere-pro-og
---
# Premiere Pro {#premiere-pro }
先打开导出设置：`File`（文件） -> `Export`（导出） -> `Media...`（媒体）。

=== ":package: H264|H265"

    该选 H.264 还是 H.265，读一读[编解码器指南](../codecguide.md)再定。

    在 `Encoding Settings`（编码设置） -> `Performance`（性能）中，只要有 `Software Only`（仅软件）以外的选项，你就能用硬件加速编码导出，详见上面的链接。

    ![](../../assets/images/video/voukoder/premiere-h264.png)


=== ":custom-voukoder: 用 Voukoder 导出"

    在格式下拉里选中 Voukoder 后，进入 Voukoder 选项卡点 [`Configure...`（配置）](./configuration.md)配置编码器。

    ![](../../assets/images/video/voukoder/premiere-export-tab.png)

<hr>

底部的 `Time Interpolation`（时间插值）是非常重要的设置：

* `Frame Sampling`（帧采样）：素材帧率相对输出帧率的富余部分会被直接丢弃
* `Frame Blending`（帧混合）：素材帧率相对输出帧率的富余部分会被混合叠在一起，产生动态模糊效果。普遍共识是 Premiere Pro 的实现速度最快但观感最差，可以考虑用 [Smoothie](../smoothie/index.md) 预渲染

<hr>

别忘了把预设存下来以备后用：

![](../../assets/images/video/voukoder/premiere-save-preset.png)

它会以 `.epr` 文件保存在 `%USERPROFILE%\Documents\Adobe\Adobe Media Encoder\12.0\Presets`。
