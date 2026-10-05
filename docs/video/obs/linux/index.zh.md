---
description: Linux 上的 OBS 配置
icon: simple/linux
---

另外，如果你只想以高帧率录游戏、不需要 OBS 的其他功能，可以看看 dec05eba 的 [gpu-screen-recorder](https://git.dec05eba.com/gpu-screen-recorder/about/)。

# :material-linux: Linux OBS 配置 {#linux-obs-configuration }
Linux 版 OBS 默认没有像 Windows 那样用于高帧率或低资源录制的选项。这是因为默认采集方式效率不佳：

- **Screen Capture (XSHM)**（屏幕采集）：超过 120 FPS 基本必卡
- **Window Capture (Xcomposite)**（窗口采集）：效率高得多，但也只能到 ~540 FPS
- **Pipewire Capture**（Pipewire 采集）：超过 60 FPS 基本必卡

如果默认的 **Window Capture (Xcomposite)** 对你够用，本文看到这就行了。但如果你想要更高效的采集方式，就得求助于第三方插件——值不值，见仁见智。

## :octicons-plug-16: 第三方插件 {#third-party-plugins }
- [:simple-nvidia: **NvFBC（为高帧率打过补丁的 `obs-nvfbc`）**](nvfbc.md)
    - 需要 NVIDIA、OBS 27 和 X.Org
    - 屏幕采集
- [:octicons-screen-full-16: **OBS VkCapture（`obs-vkcapture`）**](obs-vkcapture.md)
    - 游戏采集
