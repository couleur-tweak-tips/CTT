---
icon: custom/ffmpeg
---

# :custom-ffmpeg: FFmpeg & LibAV: an introduction

FFmpeg is most known for being a tool for handling multimedia (notably <u>A</u>udio & <u>V</u>ideo). It's a swiss army knife when used in scripts. 

It's backbones, LibAV, lets other program make use of it's wide capabilities (e.g Voukoder does).


It can do any and all of these at once:

* Convert from a [codec](../codecguide.md) to another, or simply `copy` to transfer it without touching it(1) (`-c`)
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

        <iframe width="688" height="387" src="https://www.youtube.com/embed/WwWITnuWQW4?color=white" frameborder=0 allowfullscreen></iframe>

=== "Linux"

    You can use your favorite manager

    todo: make content tabs for all package manager commands


### ff-tools

There are three main "[fftools](https://git.ffmpeg.org/gitweb/ffmpeg.git/tree/HEAD:/fftools)":

* `ffmpeg`: for handling audio, videos.. the swiss army knife
* `ffplay`: a video player that makes use of ffmpeg's decoding abilities
* `ffprobe`: probing tools to gather information on a video/audio file's formats and specifications

## Scripts

This section contains scripts for you to use for specific tasks so you don't need (though we recommend) to learn how to use the CLI and FFmpeg
    