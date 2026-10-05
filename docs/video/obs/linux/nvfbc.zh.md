---
description: Linux 上 NVIDIA GPU 的 OBS NvFBC 来源配置
icon: simple/nvidia
---

# :simple-nvidia: NvFBC {#nvfbc }
!!! note ":material-arch: 已为 Arch Linux 用户打包"

    如果你无法从 [AUR](https://aur.archlinux.org/) 安装，就得自己找替代品或自行编译/安装。
    

## :material-information-box: 介绍 {#information }
NVIDIA 用户在给驱动打补丁后可以使用 NvFBC。NvFBC 类似 NVENC，区别在于它能从帧缓冲直接采集屏幕，效率非常高。

总体而言，它非常适合高帧率录制，效果不亚于 Windows 上默认的 **Display Capture（显示器采集）**来源，甚至更好。

不过很不幸，它也有几个硬伤：

- NvFBC 插件目前**与 OBS 28+ 不兼容**
    - [也许未来会修复](https://gitlab.com/fzwoch/obs-nvfbc/-/issues/10)
- 必须使用 NVIDIA 闭源驱动
- 必须使用 X.Org（不能用 Wayland）
    - 用 `echo $XDG_SESSION_TYPE` 查看

## :material-package-down: 安装 {#installation }
1. 从 AUR 安装 `nvidia-utils-nvlax`{ data-clipboard-text="nvidia-utils-nvlax" }，它会以打过补丁的版本替换 `nvidia-utils`。补丁共两个，全部自动完成：
    - **NVENC 补丁**：解除 NVIDIA 对消费级显卡同时 NVENC 编码会话数的限制
    - **NvFBC 补丁（必需）**：允许在消费级显卡上使用 NvFBC
2. 从 AUR 安装 `downgrade`{ data-clipboard-text="downgrade" }
3. 运行 `sudo downgrade --ala-only obs-studio`{ data-clipboard-text="sudo downgrade --ala-only obs-studio" }，安装最新的 OBS 27（即 `27.2.4 2`）
4. 从 AUR 安装 `obs-nvfbc-high-fps-git`{ data-clipboard-text="obs-nvfbc-high-fps-git" }——这是 “NvFBC Source” OBS 插件，已为高帧率打过补丁
5. 打开 OBS，添加 “NvFBC Source”
6. 配置 NvFBC 来源（多试几组设置），FPS 与 OBS 录制帧率保持一致

### :material-lightbulb-on: 小贴士 {#tips }
- 在 Minecraft 里开启 **Smooth FPS**（平滑帧率）/ 限制帧率，给 OBS 留点 GPU 余量
- 在窗口管理器/桌面环境中切换/禁用合成器（compositing）
- 可以用 AUR 里的 [`teres`](https://aur.archlinux.org/packages/teres) 做帧混合与补帧

### :octicons-cross-reference-16: 参考 {#references }
- [打过补丁的 OBS NvFBC 插件](https://aur.archlinux.org/packages/obs-nvfbc-high-fps-git)
- [降级 Pacman 软件包](https://aur.archlinux.org/packages/downgrade)
- [打过补丁的 `nvidia-utils`](https://aur.archlinux.org/packages/nvidia-utils-nvlax)
- [OBS NvFBC 插件页面](https://gitlab.com/fzwoch/obs-nvfbc/-/tree/master#obs-nvfbc)
