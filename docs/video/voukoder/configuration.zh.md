---
icon: octicons/gear-16
---

# 配置 Voukoder {#configuring-voukoder }
Voukoder 可用以下相关编码器：

### 有损压缩编解码器 {#compression-based-codecs }
* H.264 (AVC) 与 H.265 (HEVC)
    * CPU（软件 x26*）
    * NVENC（NVIDIA）
    * AMF（AMD）
    * QuickSync（Intel）
* VP9
* AV1
    * CPU（SVT-AV1）
    * NVENC（NVIDIA）

可能还有其他硬件加速编码器，欢迎补充。

### 无损编解码器 {#lossless-codecs }
几乎不需要配置：在 Video 面板 -> Encoder 选项卡选中并保存即可。

* UTVideo（推荐）
* ProRes



=== "H.264 (NVENC)"
    ![](../../assets/images/video/voukoder/h264-nvenc.png)
=== "HEVC (NVENC)"
    ![](../../assets/images/video/voukoder/h265-nvenc.png)
=== "H.264 (x264)"
    ![](../../assets/images/video/voukoder/x264.png)
=== "HEVC (x265)"
    ![](../../assets/images/video/voukoder/x265.png)

# 超分 {#upscaling }
可以用 Voukoder 的 `zscale` 滤镜实现超分与编码同时进行：

![](../../assets//images/video/voukoder/voukoder-add-filter.png)


![](../../assets/images/video/voukoder/voukoder-set-zscale.png)
