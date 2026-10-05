---
icon: material/monitor-eye
---

# 来源类型 {#source-types }
=== "Windows"

    ## :obs-gamepad: [Game Capture（游戏采集）](https://obsproject.com/kb/game-capture-source) {#game-capture }
    采集某个窗口的内容，性能最好，优先之选。

=== "Linux"

    Linux 的替代来源有几个，但都不及 Windows 的游戏采集：

    * <https://aur.archlinux.org/packages/obs-nvfbc-high-fps-git>（读置顶评论）
    * <https://github.com/nowrep/obs-vkcapture>（见页面底部的 [#usage](https://github.com/nowrep/obs-vkcapture?tab=readme-ov-file#usage)）

## :obs-window: [Window Capture（窗口采集）](https://obsproject.com/kb/window-capture-sources) {#window-capture }
它还能连带标题栏一起采集；游戏采集不可用/出问题时改用它。

## :obs-video: [Display Capture（显示器采集）](https://obsproject.com/kb/display-capture-sources) {#display-capture }
采集某个显示器上显示的一切，性能最差。
