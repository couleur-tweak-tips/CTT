---
icon: custom/avidemux
---

# Avidemux {#avidemux }
<div class="grid cards" markdown>

-   [![](https://upload.wikimedia.org/wikipedia/commons/d/d9/Avidemux-logo.png){align=right}](https://commons.wikimedia.org/wiki/File:Avidemux-logo.png)

    用于转换视频文件的用户界面

    这个程序功能很多，本页只聚焦它的 A/B 剪切功能

    [:octicons-home-16: 官网](https://avidemux.sourceforge.net){ .md-button }
    [:octicons-book-16:](https://sourceforge.net/p/avidemux/wiki/Home/){ .card-link title=Wiki}
    [:material-forum:](https://www.avidemux.org/admForum/){ .card-link title=Forums}
    [:octicons-code-16:](https://github.com/mean00/avidemux2){ .card-link title="Source Code" }

    === ":octicons-download-24:{ .green } 下载"

        可以在 SourceForge 页面获取构建版：

        <https://avidemux.sourceforge.net/download.html>

    === ":custom-scoop: Scoop"
        `scoop install avidemux`{data-clipboard-text="scoop.cmd install main/avidemux"}
        |
        [`avidemux.json`](https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/avidemux.json)
    === ":custom-chocolatey: Chocolatey"
        `choco install avidemux -y`{data-clipboard-text="choco install avidemux -y"}
        |
        [软件包页面](https://community.chocolatey.org/packages/avidemux)
    === ":simple-archlinux:{ .archblue } pacman"
        `sudo pacman -Sy avidemux-qt`{data-clipboard-text="sudo pacman -Sy avidemux-qt"}
        |
        [`arch package`](https://archlinux.org/packages/extra/x86_64/avidemux-qt/)

</div>

![](../../assets/images/video/ffmpeg/video-cutters/avidemux/avidemux-ui.png)
> 更多截图见[这里](https://avidemux.sourceforge.net/screenshots.html)


## 功能 {#features }
和 LosslessCut 相比它非常轻快，但剪切功能没那么多。

用法：

1. 打开应用
1. 拖入视频
1. 播放到想下刀的位置
1. 按 <kbd>A</kbd> 和 <kbd>B</kbd> 设定起止时间
1. <kbd>CTRL+S</kbd> 弹出保存对话框

## 视频教程 {#video-tutorial }
教程来自 [skyler](https://twitter.com/skylerfrags)（[壁纸](https://github.com/Atlas-OS/branding/blob/1fbcad1a8d474ba2c31b3b66528451c764585f32/wallpapers/16_9/v0.3/v2/Wallpapper%2016_9%20-%20v0.3%20v7.png)）

<video width="688" height="387" controls="true" preload="auto">
    <source src="/assets/videos/video/ffmpeg/video-cutters/avidemux-tutorial.mp4">
</video>


## 自定义按键 {#custom-keybindings }
如果你更习惯用 <kbd>I</kbd> 和 <kbd>O</kbd> 来打出入点，

可以在 `avidemux.exe` 所在目录下创建名为 `settings.json` 的文件(1)。
{ .annotate }

1. 在开始菜单里搜它，右键 -> 打开文件所在的位置。

=== ":octicons-file-code-16: `settings.json`"
    ```json
    "keyboard_shortcuts" : {
        "use_alternate_kbd_shortcuts" : true,
        "swap_up_down_keys" : false,
        "alt_mark_a" : "I",
        "alt_mark_b" : "O",
        "alt_reset_markers" : "R",
        "alt_goto_mark_a" : "A",
        "alt_goto_mark_b" : "B",
        "alt_begin" : "S",
        "alt_end" : "E",
        "alt_delete" : "Delete"
    }
    ```
