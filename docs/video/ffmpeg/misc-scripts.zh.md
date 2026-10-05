---
icon: material/script-text-play
---

# 杂项 FFmpeg 脚本 {#miscellaneous-ffmpeg-scripts }
<style>
.md-typeset summary::before {
    display: none
}
[dir="ltr"] .md-typeset .admonition-title, [dir="ltr"] .md-typeset summary {
  padding-left: 0.5rem; 
}
summary {
    text-align: center;
}
</style>

??? quote "视频在 YouTube 上架 4K 后立刻收到通知"

    # 4K-Notifier {#4k-notifier }
    当你的视频在 YouTube 上对所有观众放出 2160p/4K（或你想要的任意目标画质）时通知你。

    在线上传时，YouTube 这类平台会转码你的视频——这个脚本替你省掉每次打开那难用的 Studio 页面检查的功夫。

    它用 [yt-dlp](../../software/yt-dlp.md) 从 YouTube 获取可用分辨率（解析 `yt-dlp -F <url>`）。

    每 30 秒检查一次可用画质选项，发现配置的目标（默认 4k）就响一声，并把链接复制到剪贴板。

    通过 PowerShell 调用很简单：
    ```
    iex(irm tl.ctt.cx); 4K-Notifier https://www.youtube.com/watch?v=Ihj7Cbg49TI
    ```

    也可以做个极简批处理：

    ```bat
    @echo off
    title 4K-Notifier
    set /p "URL=YouTube URL: "
    PowerShell "iex(irm tl.ctt.cx); 4K-Notifier '%URL%'"
    ```


    存为 .bat，在 `%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\`{ data-clipboard-text="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs" } 放个快捷方式。

    或自己运行：<https://github.com/couleur-tweak-tips/TweakList/blob/master/modules/Miscellaneous/4K-Notifier.ps1>
??? quote "压缩体积 / 把视频转成兼容性更好的格式"

    # reenc {#reenc }
    reenc（re-encode）是 atzur 写的简单脚本，会对你喂给它的视频执行以下命令：


    ```PowerShell
    ffmpeg -i $in -c:v libx264 -preset slower -crf 18 -x264-params aq-mode=3 -c:a aac -b:a 256k -pix_fmt yuv420p $out-reenc.mp4
    ```

    它在几乎不损失画质的前提下完成压缩，并把任何奇门怪异的视频/音频/容器转成标准格式：H.264/AAC MP4——之后扔进任何程序都不会再有兼容性问题（如果你原本的视频有的话）。

    * 用 h.264 编解码器重新编码视频
        * 恒定码率因子设为 18
        * <div class="annotate" markdown>aqmode 设为 3</div>
            1. 将自适应量化器模式设为 auto vaq（带偏置）：对细节较少的画面区域进行更强的量化，省下的码率可以用于画面其他部分以保留细节。
    * 音频重编码为 AAC
        * 码率 256kbps
    * 强制像素格式为 YUV 4:2:0
    * 输出容器设为 MPEG-4

    更多 H.264 编码知识见[这里](https://trac.ffmpeg.org/wiki/Encode/H.264)。

    # 安装 {#installation }
    打开 PowerShell，粘贴以下命令，把[批处理文件](https://github.com/atzuur/scripts/blob/main/reenc.bat)存进 [Send To](../sendto.md)：
    ```PowerShell
    powershell "(irm https://github.com/atzuur/scripts/raw/main/reenc.bat) | Out-File (Join-Path ([Environment]::GetFolderPath('SendTo')) reenc.bat) -Encoding ASCII"
    ```
??? quote "从视频中提取单独一帧"

    <https://github.com/Thqrn/ffmpeg-scripts/blob/main/video%20frame%20extractor.bat>

??? quote "简易版 [CTT Upscaler](./upscaling.md)"

    ```bat
    @echo off
    title CTT Simplescaler
    :: Attempts to go where FFmpeg can be found (fails silently)
    cd /d "C:\ffmpeg\bin" >nul 2>&1


    :: Check for FFmpeg
    where ffmpeg.exe >nul 2>&1 || (
    echo FFmpeg not found, installing!
    :: Uses TweakList's scoop wrapper to get FFmpeg and add it to PATH
    PowerShell "iex(irm tl.ctt.cx);Get FFmpeg"
    :: Check again
    where ffmpeg.exe >nul 2>&1 || (
    color 4F
    echo ERROR: Failed to install FFmpeg!
    pause > nul
    exit
    )
    echo Successfully installed FFmpeg!
    )


    :: If there is no first argument (video), instruct user
    if "%~1"=="" (
    color 4F
    echo ERROR: no input file
    echo In order to upscale a video with this script:
    echo 1 - Select your video in the file explorer
    echo 2 - Drag it onto the .bat you've just opened
    echo 3 - After it's done find it at ^<filename^>-Upscaled.mp4 in the same folder!
    echo Press any key to exit
    pause > nul
    exit /b
    )

    :: Change resolution here
    set vf=-vf scale=3840:2160:flags=neighbor
    :: Change to a GPU encoder here
    set encargs=-c:v libx264 -preset medium -crf 20 -c:a copy


    echo Upscaling %~n1
    ffmpeg.exe -i "%~1" -loglevel warning -stats %vf% %encargs% "%~dpn1-Upscaled.mp4"
    if %ERRORLEVEL% == 0 (exit) else (pause)
    ```    

??? quote "并排对比两个视频"

    [安装 video-compare](https://github.com/pixop/video-compare/#installation)，并[配合 SendTo 使用](https://github.com/pixop/video-compare/#send-to-integration-in-windows-file-explorer)。
??? quote "从视频中截取指定帧"

    在 mpv 里按 S 截取当前帧。
??? quote "重封装为 .MP4"

    直接 `ffmpeg -i input -c copy output.mp4` 就行。

    关键在于 `-c copy`，它相当于 `-c:a copy -c:v copy`，会无损、瞬时地复制音轨和视频流。

    script pending

??? quote "替换音频"

    见 Frost 的音频脚本：https://github.com/Thqrn/ffmpeg-scripts/
??? quote "tmix"
??? quote "从 A 点剪到 B 点"

    可以用 [`-ss` 和 `-to`](https://ffmpeg.org/ffmpeg-all.html#Main-options)，但你真该试试[剪切工具](../cutters/index.md)。

    如果你偏好敲时间戳，Frost 也为这需求写了个简单脚本：<https://github.com/Thqrn/ffmpeg-scripts/blob/main/video%20trimmer.bat>
