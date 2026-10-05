---
description: Smoothie 安装指南
icon: material/folder-download
---

# 安装 Smoothie

## 依赖

* [FFmpeg](https://ffmpeg.org)，必须位于 PATH 或 smoothie-rs 所在目录中，安装方法见[这里](../ffmpeg/index.md#installation)
    * Smoothie 还会用到 [ffprobe](https://ffmpeg.org/ffprobe.html#Description) 和 [ffplay](https://ffmpeg.org/ffplay.html#Description)，它们应已随 FFmpeg 一起安装

<div class="annotate" markdown>* 要处理的视频文件 (1)</div>

1. 听起来像废话，但你想象不到有多少人在 Discord 上问“能给我的桌面实时模糊吗”，以为这是个实时滤镜。

??? info "VapourSynth 依赖"

    注意：Windows 用户的 .ZIP 已自带这些依赖（[由 VSBundler 打包](https://github.com/couleurm/VSBundler)）

    * [VapourSynth](https://github.com/vapoursynth/vapoursynth)
    * [Python](https://python.org)

    插件：

    * [ffms2](https://github.com/FFMS/ffms2)：源插件
    * [lsmash](https://github.com/AkarinVS/L-SMASH-Works)：另一个源插件
    * [vs-akarin](https://github.com/AkarinVS/vapoursynth-plugin/)：用于帧混合
    * [mvtools](https://github.com/dubhater/vapoursynth-mvtools)：用于 flowblur
    * [svpflow](https://github.com/bjaan/smoothvideo/blob/main/SVPflow_LastGoodVersions.7z?raw=true)：用于补帧
    * [RIFE NCNN Vulkan](https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan)：用于预补帧
    * [fmtc](https://github.com/EleonoreMizo/fmtconv)：格式转换器
    * [timecube](https://github.com/sekrit-twc/timecube)：LUT

    脚本：

    * [adjust](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/adjust.py)：用于色彩分级，作者不详
    * [filldrops](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/filldrops.py)：用于重复帧去重，作者同样不详
    * [havsfunc](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/havsfunc.py)：用于调整 fps 和补帧，在[这里](https://github.com/HomeOfVapourSynthEvolution/havsfunc/releases)维护


=== "Windows"

    ## 自动安装器

    [点击这里下载最新版 Smoothie 安装器](https://github.com/couleur-tweak-tips/SmoothieInstaller/releases/latest/download/SmoothieInstaller.exe)

    它会完成以下事项：
    - 下载 Smoothie 和 FFmpeg 到 `%APPDATA%\Smoothie`
    - 安装 Visual C++ Redistributables
    - 在开始菜单和 Send To（发送到）中创建快捷方式

    ## 手动安装

    本教程涵盖 Smoothie 与 RIFE 模型的手动安装（目前 RIFE 模型没有自动安装器）。

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/RfPDgoMuSWg?start=20&color=white" frameborder=0 allowfullscreen></iframe>


    Smoothie 以便携 zip 包(1)的形式发布，在[这里](https://github.com/couleur-tweak-tips/smoothie-rs/releases)下载最新版本。
    { .annotate}

    1. [便携程序](https://en.wikipedia.org/wiki/Portable_application#Portable_application)指不带安装器、解压即用的软件。优点是卸载很容易（直接删文件夹就行哈哈），缺点是快捷方式得自己建。

    把 `smoothie-rs` 文件夹解压到任意位置，然后在其中运行 `launch.cmd` 即可启动 GUI 模式。


    # 创建 [Send To（发送到）](../sendto.md)快捷方式

    进入 `...\smoothie-rs\bin`，对 `smoothie-rs.exe` 按 <kbd>SHIFT+右键</kbd>，选择“Copy Path（复制路径）”。

    在 `%APPDATA%\Microsoft\Windows\SendTo` 中创建一个指向 <smoothie-rs文件夹\bin\smoothie-rs.exe> 的快捷方式，在目标栏末尾加一个空格和 ` --tui -i`。

    如果 Smoothie 崩溃，可以在 smoothie-rs 可执行文件路径后加 `-v` 参数（即 ` -v --tui -i`）开启详细日志，看看哪里出了问题。

    # 安装 [RIFE 模型](./recipe.md#pre-interp)

    1. RIFE 模型以 ZIP 形式分发，内含以模型版本命名的文件夹，
    2. 把 zip 解压到 smoothie-rs 文件夹下一个名为 `rife models` 的新文件夹，
    3. 在配方中将 [`[pre-interp] model:`](./recipe.md#pre-interp) 设为该文件夹名即可启用某个模型
        * 也可以在资源管理器中对想要的模型文件夹 <u>shift+右键</u> -> `Copy as path（复制路径）`，粘贴为完整路径。


    这里有一包模型可供下载（约 400MB）：

    * <https://github.com/nihui/rife-ncnn-vulkan/releases>

    想要更全的合集（[文件夹地址](https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan/tree/master/models)）：

    * <https://download-directory.github.io/?url=https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan/tree/master/models>

=== "Linux"

    Hqzkii 在 AUR 维护了 [`smoothie-rs-linux-git`](https://aur.archlinux.org/packages/smoothie-rs-linux-git)

    todo，理论上可以直接用 cargo 编译

    Arch 玩家可以看看 <https://aur.archlinux.org/packages/teres> 的依赖列表

    * 帧混合还需要 <https://aur.archlinux.org/packages/vapoursynth-plugin-vsakarin-git>
    * 预补帧还需要 <https://aur.archlinux.org/packages/vapoursynth-plugin-rife-ncnn-vulkan-git>

=== "macOS"

    对非开发者：目前还没有开箱即用的安装包。

    理论上可以用 [Homebrew](https://brew.sh) 安装 VapourSynth 并编译全部插件（spritzer 以前这么干过），但还没有人维护这些包。

    [这里已经有一部分了](https://duckduckgo.com/?q=%22vapoursynth%22%20site%3Aformulae.brew.sh)，想动手的话可以参考


<!--
it'd be cool to be able to opt-in to use invidious instance for vids 

<iframe width='640' height='360' src='https://invidious.io.lol/embed/RfPDgoMuSWg?start=20'  frameborder=0 allowfullscreen></iframe> 


-->
