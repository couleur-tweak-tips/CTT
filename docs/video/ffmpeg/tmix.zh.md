---
icon: fontawesome/solid/blender
---

# Tmix {#tmix }
这个简单的批处理文件是 [ffmpeg tmix 视频滤镜](https://ffmpeg.org/ffmpeg-filters.html#tmix)的封装。

它可以快速把高帧率素材[帧混合](../smoothie/recipe.md#frame-blending)到低帧率。

你可能想用它把文件做小、让剪辑软件解码更快——为此它的 ffmpeg 参数用了 libx264 编码器配 fastdecode 调优，能进一步减少 VEGAS Pro 等剪辑软件中的预览卡顿。

如果你在剪长视频、还要导很多遍，它能省下可观的渲染时间——帧混合的耗时被前置掉了，不再是每次都花的冤枉钱。

## 下载 {#download }
打开页面，点右侧的 :octicons-download-16: “download raw file”按钮：

<https://github.com/couleur-tweak-tips/utils/blob/main/Miscellaneous/tmix.bat>

## 用法 {#usage }
把视频拖到批处理文件上，或把它放进 [Send To](../sendto.md)。

## 更快的替代方案 {#a-faster-alternative }
用 [smoothie](../smoothie/index.md) 也能达到同样效果，这样配置：

```ini
[frame blending]
enabled: yes
fps: 60
intensity: 1.0
weighting: equal
bright blend: no

[output]
enc args: -c:v libx264 -tune fastdecode -preset veryfast -g 60 -x264-params bframes=0 -crf 20 -forced-idr 1 -strict -2 -maxrate 100M -bufsize 10M
```
