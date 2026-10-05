---
description: 视频与渲染板块介绍
icon: material/video-box
---

# <!--:material-video-box:--> 简介 {#introduction }
本板块致力于记录视频创作相关程序的最优配置（如果你对[高质量动态模糊](./smoothie/index.md)感兴趣，这里是重点），并帮助你打造属于自己的制作工作流。

## :material-book: 名词解释 {#definitions }
### :material-run-fast: 帧混合（Frame blending） {#frame-blending }
最常见的动态模糊形式，不会出现 HUD 涂抹或一般意义上的伪影（不像 RSMB 等其他方法）。通常是从很高的 FPS（比如 540）降到常见 FPS，比如 60 或 30。

一般来说，输入 FPS 越高，最终输出越顺滑，因为参与模糊的帧越多、模糊过渡越无缝。模糊帧数就是叠在一起的帧的数量，即 `模糊帧数 = 输入 fps / 输出 fps`。

Vegas Pro 和 Adobe Premiere Pro 这类视频编辑器内置了该功能。但我们建议先用 [Smoothie](./smoothie/index.md) 之类的独立程序预渲染——这样编辑器里完全不卡，可折腾的空间也大得多。

### :material-select-multiple: 补帧（Interpolation） {#interpolation }
视频补帧是一种在现有帧之间生成新帧的视频处理技术，用算法或 AI 有效地提升视频 FPS。

知名的有 [RIFE](https://github.com/megvii-research/ECCV2022-RIFE) 和 [SVP](https://www.svp-team.com)，[blur 和 Smoothie](./smoothie/smoothievsblur.md)就在使用它们。

它在两个现有帧之间的时间窗里生成新帧：输入 FPS 越高，两个相邻帧之间的时间窗越小，生成的帧伪影也就越少。
