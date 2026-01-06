---
icon: material/script-text-play
---

# Miscellaneous FFmpeg scripts

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

??? quote "Get notified when your video is available in 4K on YouTube"

    # 4K-Notifier

    Get notified when your video is available in 2160p/4K (or any desired target quality) to everyone on YouTube.

    When uploading online, platforms like YouTube transcode your videos, and this saves you from constantly having to check in their clunky Studio page

    It uses [yt-dlp](../../software/yt-dlp.md) to get the available resolutions from YouTube (parses `yt-dlp -F <url>`)

    Every 30 seconds, it'll check the available video quality options, and if it finds the configured one (default is 4k) it beeps and copies the URL to your clipboard

    It's easily useable via PowerShell:
    ```
    iex(irm tl.ctt.cx); 4K-Notifier https://www.youtube.com/watch?v=Ihj7Cbg49TI
    ```

    You can also make a dead simple batch-file for it:

    ```bat
    @echo off
    title 4K-Notifier
    set /p "URL=YouTube URL: "
    PowerShell "iex(irm tl.ctt.cx); 4K-Notifier '%URL%'"
    ```


    Save this to a .bat and make a shortcut to it in `%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\`{ data-clipboard-text="%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs" }

    Or run it yourself: <https://github.com/couleur-tweak-tips/TweakList/blob/master/modules/Miscellaneous/4K-Notifier.ps1>
??? quote "Reduce file size / convert your video to a more compatible format"

    # reenc

    reeenc (to re-encode) is a simple script by atzur that runs the following command on videos you feed it:


    ```PowerShell
    ffmpeg -i $in -c:v libx264 -preset slower -crf 18 -x264-params aq-mode=3 -c:a aac -b:a 256k -pix_fmt yuv420p $out-reenc.mp4
    ```

    This compresses without degrading much, and converts any exotic video/audio/container to the standard: H.264/AAC MP4, which can be thrown into every program without any compatibilities if you had any with your original video file.

    * re-encodes video in the h.264 codec
        * with constant rate factor set to 18
        * <div class="annotate" markdown>sets aqmode to 3</div>
            1. sets adaptative quantizers mode to auto vaq (biased), it quantizes less detailed image areas more strongly, the saved bits can then be used in other parts of the image to preserve details.
    * re-encodes audio to AAC
        * with a bitrate of 256kbps
    * enforces the pixel format to YUV 4:2:0
    * sets the output container to MPEG-4

    Learn more about H.264 encoding [here](https://trac.ffmpeg.org/wiki/Encode/H.264)

    # Installation

    Open PowerShell and paste in the following command to save the [batch-file](https://github.com/atzuur/scripts/blob/main/reenc.bat) in [Send To](../sendto.md)
    ```PowerShell
    powershell "(irm https://github.com/atzuur/scripts/raw/main/reenc.bat) | Out-File (Join-Path ([Environment]::GetFolderPath('SendTo')) reenc.bat) -Encoding ASCII"
    ```
??? quote "Extract a single frame from a video"

    <https://github.com/Thqrn/ffmpeg-scripts/blob/main/video%20frame%20extractor.bat>

??? quote "Simple version of the [CTT Upscaler](./upscaling.md)"

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

??? quote "Compare two videos side-by-side"

    [Install video-compare](https://github.com/pixop/video-compare/#installation) and use it [with SendTo](https://github.com/pixop/video-compare/#send-to-integration-in-windows-file-explorer)
??? quote "Extract a specific frame from a video"

    Use S in mpv to take a screenshot of the current frame
??? quote "Remux to .MP4"

    You can simply do `ffmpeg -i input -c copy output.mp4`

    what matter here is `-c copy` which behaves like `-:ca copy c:v copy`, which copies the audio and video streams losslessly and instantly

    script pending

??? quote "Replace audio"

    See Frost's audio scripts: https://github.com/Thqrn/ffmpeg-scripts/
??? quote "tmix"

    https://github.com/Thqrn/ffmpeg-scripts/blob/main/video%20resampler.bat
??? quote "Cut from point a to b"

    You can use [`-ss` and `-to`](https://ffmpeg.org/ffmpeg-all.html#Main-options), but you should really use a [cutter](../cutters/index.md)

    Frost also made a simple script for that if you prefer typing timestamps in <https://github.com/Thqrn/ffmpeg-scripts/blob/main/video%20trimmer.bat>
