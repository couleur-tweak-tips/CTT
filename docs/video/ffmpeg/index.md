---
icon: custom/ffmpeg
---

This section contains scripts for you that wrap certain capabilites of FFmpeg so you don't need to learn how to use it FFmpeg from the command line

# <!--:custom-ffmpeg:--> FFmpeg

FFmpeg is a solution for converting, transcoding, editing audio and video.

It's CLI tools `ffmpeg`, `ffprobe` and `ffplay` are used [in many scripts](https://github.com/Thqrn/ffmpeg-scripts). 

It's also [available as a library](https://github.com/ffmpeg/ffmpeg) and used by countless programs.

It can do any and all of these at once:

* Convert from one [codec](../codecguide.md) to another, or simply `copy` to transfer it without touching it (`-c`)
* Cut videos (LosslessCut uses FFmpeg for that) (`-ss` `-to`)
* Add/remove/merge audio/video/subtitle tracks (e.g multiple `-i`/`-input`)

And [a lot, a lot of other useful stuff](https://ffmpeg.org/ffmpeg-all.html)

## Installation

=== "Windows"

    === "Automatic"

        You can use the [Scoop](https://scoop.sh/) package manager to easily install it to PATH 

        ```PowerShell
        Set-ExecutionPolicy Bypass -Scope Process -Force
        irm https://get.scoop.sh | iex
        scoop.cmd install ffmpeg
        ```

    === "Manual"

        todo: explain this in text

        the link in description in question: <https://www.gyan.dev/ffmpeg/builds>

        <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/WwWITnuWQW4?color=white" frameborder=0 allowfullscreen></iframe>

=== "Linux"

    You can use your favorite package manager

    todo: make content tabs for all package manager commands


### ff-tools

There are three main "[fftools](https://git.ffmpeg.org/gitweb/ffmpeg.git/tree/HEAD:/fftools)":

* `ffmpeg`: For handling audio, videos, etc. The swiss army knife
* `ffplay`: A video player that makes use of ffmpeg's decoding abilities
* `ffprobe`: Probing tools to gather information on a video/audio file's formats and specifications

