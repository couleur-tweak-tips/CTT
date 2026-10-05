---
icon: material/resize
---


# 为什么要费劲给 YouTube 做超分？ {#why}

把视频放大到更大分辨率（如 `1920x1080`/1080p :material-arrow-right: `3840x2160`/4K），能骗 YouTube 多给你的视频分点码率——尽管你并没有真正增加任何细节。

==这招只对 YouTube 有用：它不会让视频在本地播放器里看起来更好，只会<u>让它在 YouTube 上没原文件那么惨</u>==。

**这应该是每个项目的最后一步，就在上传之前**。剪辑超分过的 4K 素材纯属浪费渲染时间。

    
## 为什么不干脆在渲染前把项目分辨率设成 4K？ {#why-not-nle}

VEGAS Pro（大概也包括其他 NLE）用了 bicubic 缩放滤镜，会让视频略糊。用 FFmpeg 才能确保用对滤镜。

## :custom-voukoder: Voukoder zscale {#why-not-voukoder}

如果你从 [Voukoder](../voukoder/index.md) 导出，也可以加一个超分滤镜。相比先导出再跑超分脚本，它在单次编码里完成导出+超分，耗时更短、画质损失更小。做法见[这里](../voukoder/configuration.md#upscaling)。

## :material-folder-download: 安装 CTT Upscaler {#installation}

=== "自动"

    运行下面的命令会：
    
    * 用 [Scoop](https://scoop.sh) 安装 [FFmpeg](./index.md)
    * 把超分脚本存进 [Send To 文件夹](../sendto.md)

    把下面的命令粘到一个 PowerShell 窗口（无需管理员权限）：

    ```PowerShell title="自动安装超分脚本"
    iex(irm tl.ctt.cx); Get Upscaler
    ```

=== "手动"

    1. 安装 [FFmpeg](../ffmpeg/index.md#installation)

    2. 把[这个批处理文件](https://github.com/couleur-tweak-tips/utils/blob/main/Miscellaneous/CTT%20Upscaler.cmd)另存为 .cmd 文件，建议放在：

        * 你的 [Send To 文件夹](../sendto.md)
        * 或者放在任意位置，用时把视频拖上去

    浏览器可能会把它存成文本文件（如 `CTT Upscaler.cmd.txt`）。如果双击总被记事本打开，请在资源管理器里[显示文件扩展名](https://www.howtogeek.com/205086/beginner-how-to-make-windows-show-file-extensions/)。

    SmartScreen 总会对网上下载的批处理文件发出警告，不放心可以自己审一遍代码。

## 对比 {#comparison }
下面两个视频，一个原样上传，另一个被拉到 4K。全屏播放，把 <kbd>设置</kbd> -> <kbd>画质</kbd> 拉满再看。
=== "1080p"

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/ohjz9Kff7lo?color=white" frameborder=0 allowfullscreen></iframe>

    
=== "1080p 拉到 4K"

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/-FE9s_acdYw?color=white" frameborder=0 allowfullscreen></iframe>
