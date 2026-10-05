---
icon: custom/ffmpeg
---

本板块收录了一批封装 FFmpeg 特定能力的脚本，让你不必从命令行学起也能用它。

# <!--:custom-ffmpeg:--> FFmpeg {#ffmpeg }
FFmpeg 是一套音频、视频转换、转码与编辑的解决方案。

它的 CLI 三件套 `ffmpeg`、`ffprobe` 和 `ffplay` 被[大量脚本](https://github.com/Thqrn/ffmpeg-scripts)使用。

它也[有库形态](https://github.com/ffmpeg/ffmpeg)，被无数程序采用。

它可以同时做到以下任意组合：

* 从一种[编解码器](../codecguide.md)转换到另一种，或直接 `copy` 原样封装过去（`-c`）
* 剪切视频（LosslessCut 就是靠 FFmpeg 干这个）（`-ss` `-to`）
* 增删、合并音轨/视频轨/字幕轨（如多个 `-i`/`-input`）

以及[许许多多其他实用功能](https://ffmpeg.org/ffmpeg-all.html)。

## 安装 {#installation }
=== "Windows"

    === "自动"

        可以用 [Scoop](https://scoop.sh/) 包管理器轻松装到 PATH：

        ```PowerShell
        Set-ExecutionPolicy Bypass -Scope Process -Force
        irm https://get.scoop.sh | iex
        scoop.cmd install ffmpeg
        ```

    === "手动"

        todo: 用文字讲一遍

        视频简介里提到的链接：<https://www.gyan.dev/ffmpeg/builds>

        <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/WwWITnuWQW4?color=white" frameborder=0 allowfullscreen></iframe>

=== "Linux"

    用你顺手的包管理器即可。

    todo: 给各包管理器命令做标签页


### ff-tools {#ff-tools }
主要有三个“[fftools](https://git.ffmpeg.org/gitweb/ffmpeg.git/tree/HEAD:/fftools)”：

* `ffmpeg`：处理音视频等——瑞士军刀
* `ffplay`：利用 ffmpeg 解码能力的视频播放器
* `ffprobe`：探测工具，读取视频/音频文件的格式与规格信息
