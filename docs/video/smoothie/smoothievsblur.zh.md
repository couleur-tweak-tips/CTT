---
description: Smoothie 与 blur 的区别
icon: custom/blur
---


相关：你可以用[转换器](./converter/index.html)把 ``.blur-config.cfg`` 文件转换成 Smoothie 的 `recipe.ini` 文件

## 哪个更好 / 我该用哪个？ {#which-is-bettershould-i-use }
blur 和 Smoothie 的底层非常相似，都基于 VapourSynth 和一批几乎相同的插件。本页列出你会遇到的所有差异，方便你自己做判断。

!!! warning "本页面向 blur 老用户"

    这里解释的是我在开发 Smoothie 时从 blur 汲取灵感所做出的设计取舍。如果你从没用过 blur，读下去意义不大（除非你想让某个配方和某个 blur 配置看起来一模一样）。

## Smoothie 的优点 {#smoothie-pros }
* Smoothie 的[配方取值是可选的](./recipe.md#smoothie-recipe)

* Smoothie 用 ffplay 实现了流畅得多的[预览窗口](./recipe.md#preview-window)

* Smoothie 有[伪影遮罩](./recipe.md#artifact-masking)

* Smoothie 有 [flowblur](./recipe.md#artifact-masking)

* Smoothie 有 [RIFE 预补帧](./recipe.md#pre-interp)，~~blur 从 [beta v1.92](https://github.com/f0e/blur/releases) 起就没有了~~ 它又回来了！

* 海量 [CLI 参数](./cli.md)

## blur 的优点 {#blur-pros }
* 为 macOS ARM 和 Linux 预打包（Smoothie 也能做到，只是需要时间和热情）

* 可以在示例视频的某一帧上即时预览配置效果

* 百分比进度 + 拖放队列系统——而我更想给 Smoothie 做一个文件选择对话框

* 全局 / 按文件夹的配置体系

* 设置说明直接写在 GUI 里，不用看文档

* 权重曲线预览

* 桌面通知

## 术语对照 {#terms-used }
* blur 配置里有个叫 `- blur` 的分类，我觉得名字起得含糊，已改名为更有表达力的 `[frame blending]`

* 上面那个分类里的 `blur amount` 也已改名为 `intensity`。我还在找更好的叫法，[有想法请告诉我 👁👁](../../contact.md#couleur)

### 已被反哺回 blur 的特性 {#features-now-back-ported-to-blur }
从 [beta v1.92](https://github.com/f0e/blur/releases) 开始，许多曾让 Smoothie 与众不同的特性已经进了 blur：

* ~~帧混合在 Smoothie 上更快~~ [tekno 直接把代码抄过去了](https://github.com/f0e/blur/blob/master/plugins/blending.py)

* ~~Smoothie 的 vpy 脚本不是硬编码的、可以随意改，blur 则是往临时文件里追加写死的 Python 代码~~

* ~~Smoothie 是单一全局配置，blur 会先看输入文件同目录下有没有配置~~ 在 blur v1.92 里 tekno 加了目录无配置时回落全局配置的功能，我也该抄过来 😋

## 内部构成 {#internals }
[blur](https://f0e.github.io/blur)、[Smoothie](./index.md) 和 [teres](https://github.com/animafps/teres) 都用到了这两个程序：

* VapourSynth——视频滤镜库，以 Python 脚本为前端
* FFmpeg——把 VSPipe 输出的未压缩 Y4M 流封装成编码视频

## 时间线 {#timeline }
* 2020 年 6 月：blur 在 GitHub 上创建

* 2022 年 1 月：blur 自 v1.8 后进入休眠，我 fork 了 blur，用 Python 写成 smoothie

* 2022 年 2 月：另一位开发者 Anima 用 Rust 重写了 blur，名为 teres

* 2023 年 1 月：看到 teres 后我做了 smoothie-rs，原来的 Smoothie 更名为 smoothie-py 并弃用

* 2024 年 4 月：smoothie-rs 仓库提交了第一段 egui 代码

* 2025 年 1 月：Hqzki/hybridkernel 一时兴起做了 smoothie-go

* 2025 年 3 月：smoothie-rs 发布了 Windows 安装器和 GUI

* 2025 年 4 月：tekno 发布带 GUI 的 blur v2.0——距离[最初基于 Electron 的 blurGUI](https://github.com/f0e/blurgui)已经过去好几年

* 2025 年 5 月：tekno 把 v2.23 定为最新稳定版，而上一个稳定版还是 2021 年底发布的 v1.8

时至今日，blur 新 beta 的内部构成与 Smoothie 的相似程度，已经胜过当年 teres 之于 blur。

~~teres 的主要优势是可以在 [Arch 用户仓库](https://repology.org/project/teres/versions)里装到。~~ [smoothie-rs 现在也可以了](https://aur.archlinux.org/packages?K=smoothie-rs)
