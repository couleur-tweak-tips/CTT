---
description: 关于 Smoothie
icon: custom/smoothie
---


<h1 align="center">
    <!-- yup if i put a line break they're not actually centered =( -->
    <img src="/assets/images/video/smoothie/logo.svg" width=100 /> Smoothie
</h1>
<p align="center">
    给视频添加动态模糊，配置细致入微
</p>
<p align="center">
    <a href="https://discord.com/channels/774315187183288411/1051234238835474502">
        <img src="https://img.shields.io/badge/HOF%20render%20tests-white?logo=discord" alt="HOF render tests" />
    </a>
    <a href="https://www.youtube.com/playlist?list=PLrsLsEZL_o4M_yTqZGwN5cM5ZxJTqkWkZ">
        <img src="https://img.shields.io/badge/Demo%20Playlist-FF0000?logo=youtube" alt="Demo Playlist" />
    </a>
    <a href="https://github.com/couleur-tweak-tips/SmoothieInstaller/releases/latest/download/SmoothieInstaller.exe">
        <img src="https://img.shields.io/badge/Download%20Installer-8A2BE2" alt="Download" />
    </a>
    <a href="https://github.com/couleur-tweak-tips/smoothie-rs/releases/latest/download/smoothie-rs-nightly.zip">
        <img src="https://img.shields.io/badge/Download%20Portable%20zip-8A2BE2" alt="Download" />
    </a>
    <a href="https://github.com/couleur-tweak-tips/TweakList/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/couleur-tweak-tips/TweakList.svg" alt="License" />
    </a>
</p>

![](/assets/images/video/smoothie/smoothie-gui.webp){ align=right width=200}


## Smoothie 是什么？ {#what-is-smoothie }
=== "面向用户"

    Smoothie 可以为游戏录像添加动态模糊，功能与 [smart resampling（智能重采样）](./recipe.md#frame-blending) 和 [RSMB](./recipe.md#flowblur) 类似。

    它是一条一体化的滤镜链，每个组件都可以按你的需要单独开关和配置。


=== "面向开发者"

    Smoothie 是 [blur](https://github.com/f0e/blur) 的跨平台分支，现已用 Rust [重写](https://github.com/couleur-tweak-tips/Smoothie#readme)。

## 为什么要用 Smoothie？ {#why-should-i-use-smoothie }
在以下软件 / 功能面前，Smoothie 可能是更好的选择。

它们都可以自由开关——你可以在[配方](./recipe.md)中自行决定是否禁用：

* [`[frame blending]`](./recipe.md#frame-blending)：VEGAS Pro 的 smart resampling / Premiere Pro 的帧混合 / FFmpeg 的 Tmix 滤镜

    它比用 VEGAS Pro 的 smart resample 渲染快上好几倍，跑分如下：


    * `Smoothie-RS`：10.9 秒
    * `VEGAS Pro 18.0 (build 284)`：81 秒
    * `FFmpeg tmix`：19 秒

    ??? info "跑分细节"
        把一段 1280x720、990 FPS 的素材帧混合到 60 FPS（17 个权重）

        你也可以用[原始素材](https://big.fileditchnew.ch/b2/ZULNQGYkZJsjUDZLITEL.mp4)亲自试试

        它们都是用 UTVideo 编解码器编码的

        以下是我在配方中设置的相关值：
        ```ini
        [frame blending]
        enabled: yes
        fps: 60
        intensity: 1.0
        weighting: vegas

        [output]
        enc args: -c:v utvideo
        container: .MKV
        ```

        FFmpeg 参数：
        ```
        -i grzy.mp4 -vf tmix=frames=17 -y -r 60 -c:v utvideo tmikx.mkv
        ```

* [`[flowblur]`](./recipe.md#flowblur)：[RSMB](https://revisionfx.com/products/rsmb/)、After Effects 的 CC Force Motion Blur
    * [`[artifact masking]`](./recipe.md#artifact-masking)：在视频编辑器里用遮罩工具手动回退 RSMB 涂抹过的区域

        ??? info "遮罩示例"

            以 Apex Legends（《Apex 英雄》）为例：
            
            ![遮罩示例](../../assets/images/video/smoothie/mask.png)

* [`[pre-interp]`](./recipe.md#pre-interp)：[Flowframes](https://nmkd.itch.io/flowframes) / [RIFE](https://github.com/megvii-research/ECCV2022-RIFE)
* [`[output]`](./recipe.md#output)：用 [FFmpeg（`-vcodec <...>`）](https://ffmpeg.org/ffmpeg-all.html#Main-options)转码
* [超分到 `4K`](../ffmpeg/upscaling.md)


## 如何使用 Smoothie {#how-to-use-smoothie }
从开始菜单启动 Smoothie 后，你有两个选择：

* 直接把视频拖放到窗口上
* 点击 `render`，在文件浏览对话框中选择

它会自动忽略非视频文件，如果要处理整个文件夹，直接 `CTRL+A` 全选就好。

你可以用 GUI 配置你的“配方”（配置），也可以直接修改 `recipe.ini` 文件，所有设置的说明在[这里](./recipe.md)。

它还有丰富的 [CLI 参数](./cli.md)，可以在脚本中调用。

你也可以通过 [Send To（发送到）](../sendto.md)直接把素材喂给它 ![Send To folder](../../assets/images/video/smoothie/smoothiesendto.png){ width="450" }

如果你不想在 GUI 里点 render，而是想一打开就弹出文件选择对话框，可以在开始菜单（`%APPDATA%\Microsoft\Windows\Start Menu\Programs`）创建一个快捷方式，并在目标栏追加 ` --tui`：

![Launch.cmd preview](../../assets/images/video/smoothie/launch.png)
