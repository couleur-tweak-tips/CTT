---
description: 各编码器通用的 OBS 初始配置
icon: obs/logo
---

## :material-information-box: 简介 {#introduction }
[Open Broadcaster Software Studio](https://obsproject.com) 是一款用于直播和录制的自由开源软件。

## 高帧率录制 {#high-fps-recording }
[我们](https://discord.gg/CTT)中的很多人把输出编码器设置为按游戏中的实际帧率录制(1)，然后用 [Smoothie](../smoothie/index.md) 做[帧混合](../smoothie/recipe.md#frame-blending)。
{ .annotate}

1. 如果你大约能跑 600FPS，建议录 480FPS 左右，给波动和偶发掉帧留出余量。

## :material-package-down: 安装 OBS {#installing-obs }
在[官方下载页](https://obsproject.com/download)可以找到安装器 / 便携 zip。

=== "Windows"

    * WinGet：`winget install -e --id OBSProject.OBSStudio`
    * Scoop：`scoop bucket add extras; scoop install extras/obs-studio`
    * Chocolatey：`choco install obs-studio`

=== "Linux"

    * Flathub（推荐）：`flatpak install flathub com.obsproject.Studio`
    * Arch 系发行版：`pacman -S obs-studio`
    * Ubuntu 系发行版（抄自 OBS 下载页）：
      ```bash
      sudo add-apt-repository ppa:obsproject/obs-studio
      sudo apt update
      sudo apt install ffmpeg obs-studio
      ```

=== "macOS"

    !!! warning "不支持"
        目前本文档不考虑 macOS 上的 OBS 设置。

    * Homebrew：`brew install --cask obs`

## 其他文档来源 {#other-documentation-sources }
见 OBS 知识库：<https://obsproject.com/kb>

* 启动（CLI）参数：<https://obsproject.com/kb/launch-parameters>

## :material-cog: 初始配置 {#initial-configuration }
??? tip "视频演示"
    <center>
        <video width="720" height="405" controls>
            <source id="mp4" src="../../assets/videos/video/obs/obs-initial-config.mp4" type="video/mp4">
        </video>
    </center>

1. 在 **Auto-Configuration Wizard（自动配置向导）**上点 **Cancel**（取消）跳过它
2. 打开 **Settings（设置） :material-arrow-right: Video（视频）**
3. 把 **Output (Scaled) Resolution（输出缩放分辨率）** 改成与 **Base (Canvas) Resolution（基础画布分辨率）** 完全一致
4. 把 **Common FPS Values（常用帧率值）切换为 :material-arrow-right: Fractional FPS Value（分数帧率值）**，修改分子以得到目标输出 FPS
5. 进入 **Output（输出）** 选项卡，把 **Output Mode（输出模式）** 改为 **Advanced（高级）**
    - **Recording Format（录制格式）**：用 **MPEG-4 (.mp4)** 保兼容，或 **Matroska Video (.mkv)**
6. 进入 **Audio（音频）** 选项卡，在 **Global Audio Devices（全局音频设备）**下配置你的音频设备
7. 点设置窗口的 **OK（确定）**
8. 按喜好调整 **Audio Mixer（混音器）**
9. 添加一个 **Display Capture（显示器采集）**来源（除非你在用 [Linux](linux/index.md)）
10. 在顶部进入 **Docks（停靠窗格） :material-arrow-right: Stats（统计）**，把它拖到预览窗口边缘停靠起来，再按喜好调整大小

### :octicons-graph-16: 统计（Stats）停靠窗格 {#stats-dock }
统计窗格用于观察你的 OBS 设置是否跟得上电脑性能，以及展示其他统计信息。

表征卡顿的两个主要指标是编码滞后（encoding lag）和渲染滞后（rendering lag）。录制游戏运动画面时如果其中一项在涨，就该调整 OBS 设置了。

### :material-replay: 回放缓存（Replay Buffer） {#replay-buffer }
回放缓存是 OBS 的一个功能：按下按钮或快捷键，只把刚才指定时长的录像保存为视频文件。它以内存作临时存储，类似 NVIDIA 的 Shadowplay。

它非常适合测试编码器设置（测试时多动一动）——不用制造一堆没用的视频文件；还能随手把游戏中的精彩瞬间剪下来。

在 **Output（输出）** 的 **Replay Buffer（回放缓存）** 选项卡中配置；启用后可以在 **Hotkeys（快捷键）** 里为它绑定快捷键。
