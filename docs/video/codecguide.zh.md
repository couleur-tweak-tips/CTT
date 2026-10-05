---
description: 编解码器科普
icon: material/file-video
---

# :material-file-video: 选择合适的编解码器 {#choose-a-suitable-codec }
无论是从 NLE 导出视频、还是用脚本/程序处理视频，都必须(1)经过**重新编码**，而这可以由众多编码器中的某一个完成——它们往往还带着[一大堆](https://github.com/couleur-tweak-tips/smoothie-rs/blob/a917cbd61b8bcda73c672fa435c79e231b22fb14/target/encoding_presets.ini#L11-L26)[配置项](../assets/images/video/vegas-templates.png)。
{ .annotate }

1. 这与[视频剪切工具](./cutters/index.md)无关。

把编码后的视频数据想象成一只塞得满满登登的行李箱 :fontawesome-solid-suitcase:：想改动里面的内容(1)，必须先拆箱还原成一连串图像；而要把改动存回视频文件，就得再装箱一次——重新编码。
{ .annotate }

1.  特定场景下并不绝对：像 [LosslessCut](https://mifi.no/losslesscut/) 这样的工具可以只在 I 帧处剪切——那里正是压缩的重置点，无需重新编码整个视频。

编解码器的选择取决于：

* 你的硬件（你有 NVIDIA 显卡吗？）
* 你用什么剪素材（你的 NLE 能预览它吗？）
* 你要传到哪里（目标平台兼容吗？）
* 你愿意牺牲多少画质来换文件体积
* 你的上传速度有多快
* 你愿意等多久（能让电脑通宵渲染吗？）

每种编解码器各有优劣：


|                        |     H.264 / AVC      |                       H.265 / HEVC                       |                                                                           AV1                                                                           |                                               UTVideo                                               |
|------------------------------------|:--------------------:|:--------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------:|
| 编码速度[^1]               | :material-check-all: |                     :material-check:                     |                                           :fontawesome-solid-equals: 只在用兼容 GPU 编码时才快                                           |                                        :material-check-all:                                         |
| 体积/画质比[^2] | 本组最差  |                   :material-check-all:                   |                                                                  :material-check-all:                                                                   |                                    无损，<br>文件巨大                                    |
| 兼容性[^3]                  | :material-check-all: | :fontawesome-solid-equals: 只在*部分*播放器可用 | :material-close: 据我所知只有较新的 DaVinci Resolve 版本[能导入它](https://www.reddit.com/r/premiere/comments/10jh4gj/comment/jyvdd0i/) | 你可能需要自行[安装解码器](https://github.com/umezawatakeshi/utvideo/releases/tag/utvideo-23.1.0) |
| 解码速度[^4]                 | :material-check-all: |                   本组最差                    |                                                                    :material-check:                                                                     |       :material-check-all: 全是原汁原味的 I 帧，解码快得飞起        |

[^1]: **经验法则**：指你预期要等它编码多久。注意同一编解码器只要动一动配置，就能从闪电般飞快变成慢得令人发指。
[^2]: 串流时最重要的指标——因为你可支配的带宽预算极其有限，不像录制到硬盘/SSD。
[^3]: 主要关系到能否把视频导入剪辑软件、能否上传 Twitter、能否在 Discord 内嵌（即不用下载直接播放）。YouTube 基本通吃，反正上传后它自己会转码。
[^4]: 剪辑时要重点考虑——关系到预览时视频能不能快速回放。


## :fontawesome-solid-microchip: 硬件加速编码 {#hwenc }

你可能注意到 H.264、H.265 和 AV1 后面常跟着 `NVENC`、`AMF` 和 `QuickSync` 这些词——这表示编码发生在你的 GPU / 核显而不是 CPU 上。这样做有利有弊：
<br>
<br>
:material-plus: 编码更快，由专用芯片处理


:material-plus: CPU 负担低得多（边打游戏边录制时尤其好用）

:material-minus: 体积/画质比不如它的 CPU 编码形态

注意 AV1 编码只在上一代及更新的显卡上可用。


??? question ":simple-nvidia: 我该为了 AV1 编码器买 RTX 4000 系显卡吗？"
    除非你明确有归档需求、或有特别适合 AV1 的工作流，否则没必要

    :material-plus: 在带宽受限场景（串流）下，画质确实上一台阶

    :material-minus: 多数剪辑软件尚不支持导入 AV1 素材（Voukoder 支持用它导出，软编硬编都行）

    :material-minus: 不会：录制视频的“画质”并不会更好——想要无损画质，H264 CQP0 就在那里

## 码率控制 {#rate-controls }
除非你录制无损（巨大的文件），否则总得有办法约束视频的带宽。

`CBR`：固定码率（Constant Bit Rate）

:   如今串流最常用。

`CRF` / `CQP`：恒定码率因子（Constant Rate Factor）/ 恒定量化参数（Constant Quantization Parameter）

:   录制到磁盘时的首选码率控制——它会根据内容对带宽的“饥渴程度”自适应，比如游戏画面里对着墙站定不动时，写入的数据会比疯狂转圈连做几个 360° 时少得多。

    这背后是挺复杂的数学。

## Couleur 的日常与编解码器使用 {#couleurs }

**OBS 录制**：用 `H.264 NVENC`，以尽可能快(1)的速度编码
{ .annotate }

1. 超快的编码设置也可以是无损的；NVENC 的 `P1` 预设——OBS 把它叫做“低质量”——是针对文件体积而言的，而 CBR 模式下码率直接决定画质。

**Smoothie 预渲染**：`UTVideo`——让剪辑软件解码素材时尽可能快

**Voukoder 导出**：在支持 Voukoder 的诸多剪辑软件中，用 `H265 NVENC + 超分`(1)
{ .annotate }

1. 这里指我的一个 Voukoder 预设，可用我的安装脚本安装。它带一个额外滤镜，直接（向上）超分到 4K 并即时编码，无需再用批处理脚本二压。

## Voukoder 与 Smoothie 的编码预设 {#encodingpresets }

* **Smoothie**：在 [`target/encodingpresets.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini) 里找。

这些预设直接翻译成 FFmpeg 参数，另可加 `4K` 宏来追加超分参数。

* **Voukoder**：我的非官方 [`Install-Voukoder`](https://github.com/couleur-tweak-tips/TweakList/blob/master/modules/Installers/Install-Voukoder.ps1#L232) 函数。

尽量忠实于上述设置，并附带 `+ Upscale` 版本。

## 延伸阅读 {#other-resources-to-learn-more }
* [x266.mov](https://wiki.x266.mov/docs/introduction/prologue)：比本文深入得多的编解码器文档
* <https://trac.ffmpeg.org/wiki/Encode/H.264>


<iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/UKtgpKF2RyM?color=white" frameborder=0 allowfullscreen></iframe>
