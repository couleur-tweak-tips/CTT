---
description: About Smoothie
icon: custom/smoothie
---


<h1 align="center">
    <!-- yup if i put a line break they're not actually centered =( -->
    <img src="/assets/images/video/smoothie/logo.svg" width=100 /> Smoothie
</h1>
<p align="center">
    add motion blur to videos, with granular configuration
</p>
<p align="center">
    <a href="https://discord.com/channels/774315187183288411/1051234238835474502">
        <img src="https://img.shields.io/badge/HOF%20render%20tests-white?logo=discord" alt="HOF render tests" />
    </a>
    <a href="https://www.youtube.com/playlist?list=PLrsLsEZL_o4M_yTqZGwN5cM5ZxJTqkWkZ">
        <img src="https://img.shields.io/badge/Demo%20Playlist-FF0000?logo=youtube" alt="Demo Playlist" />
    </a>
    <a href="https://github.com/couleur-tweak-tips/smoothie-rs/releases/latest/download/smoothie-rs-nightly.zip">
        <img src="https://img.shields.io/badge/Download%20(.zip)-8A2BE2" alt="Download" />
    </a>
    <a href="https://github.com/couleur-tweak-tips/TweakList/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/couleur-tweak-tips/TweakList.svg" alt="License" />
    </a>
</p>

---

## What is Smoothie?

=== "User facing"

    Smoothie applies motion blur on video-game footage, it's got features similar to [smart-resampling](./recipe.md#frame-blending) and [RSMB](./recipe.md#flowblur).
    
    It acts as an all-in-one filter chain, you can individually toggle and configure each component if you'd like.


=== "Developer facing"

    Smoothie is a cross-platform fork of [blur](https://github.com/f0e/blur), now [rewritten](https://github.com/couleur-tweak-tips/Smoothie#readme) in Rust.

## Why should I use Smoothie?

Smoothie can be a better alternative to using the following programs / features.

They're opt-in/out, so you can disable them at your discretion via the [recipe](./recipe.md):

* [`[frame blending]`](./recipe.md#frame-blending): VEGAS Pro's smart resampling / Premiere Pro's frame blending / FFmpeg's Tmix filter
    
    It's magnitudes faster than rendering with VEGAS Pro's smart resample, benchmark:


    * `Smoothie-RS`: 10.9 seconds
    * `VEGAS Pro 18.0 (build 284)`: 81 seconds
    * `FFmpeg tmix`: 19 seconds

    ??? info "Benchmark details"
        Frame blending a 1280x720, 990fps clip to 60fps (17 weights)

        Try it yourself with the [raw clip](https://big.fileditchnew.ch/b2/ZULNQGYkZJsjUDZLITEL.mp4)

        They were encoded with the UTVideo codec

        Here's the relevant values I've set in the recipe:
        ```ini
        [frame blending]
        enabled: yes
        fps: 60
        intensity: 1.0
        weighting: vegas

        [output]
        enc args: -c:v utvideo
        container: .MKV
        ```

        FFmpeg arguments:
        ```
        -i grzy.mp4 -vf tmix=frames=17 -y -r 60 -c:v utvideo tmikx.mkv
        ```

* [`[flowblur]`](./recipe.md#flowblur): [RSMB](https://revisionfx.com/products/rsmb/), After Effects' CC Force Motion Blur
    * [`[artifact masking]`](./recipe.md#artifact-masking): Manually reverting RSMB where it smeared in a video editor with masking tools
    
        ??? info "Mask example"

            E.g for apex legends:
            
            ![Mask example](../../assets/images/video/smoothie/mask.png)

* [`[pre-interp]`](./recipe.md#pre-interp): [Flowframes](https://nmkd.itch.io/flowframes) / [RIFE](https://github.com/megvii-research/ECCV2022-RIFE)
* [`[output]`](./recipe.md#output): Transcoding with [FFmpeg (`-vcodec <...>`)](https://ffmpeg.org/ffmpeg-all.html#Main-options)
        * [Upscaling to `4K`](../ffmpeg/upscaling.md)


## How to use Smoothie

You can configure your "recipe" (config) by modifying `recipe.ini`, all settings are explained [here](./recipe.md)

It does not have an interface as it is a [CLI tool](https://en.wikipedia.org/wiki/Command-line_interface) but there are tons of wrappers so you never have to open a terminal and type anything yourself:

1. You can feed your videos directly via [SendTo](../sendto.md) ![Send To folder](../../assets/images/video/smoothie/smoothiesendto.png){ width="450" }

2. Or select your videos in a file picker dialog by running [`Launch.cmd`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/.github/workflows/shipper.ps1#L22) ![Launch.cmd preview](../../assets/images/video/smoothie/launch.png)
