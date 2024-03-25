---
description: Explaining codecs
icon: material/file-video
---

# :material-file-video: Choose a suitable codec


When modifying videos(1), you are **re-encoding** your video, which often gets you greeted with an overwhelming amount of formats, codecs and a plethora configuration options[¹](https://github.com/couleur-tweak-tips/smoothie-rs/blob/a917cbd61b8bcda73c672fa435c79e231b22fb14/target/encoding_presets.ini#L11-L26)[²](../assets/images/video/vegas-templates.png).
{ .annotate }

1. This means using (up)scale scripts, [Smoothie](./smoothie/index.md), or exporting a NLE project to a video file, this does not concern LosslessCut.

Think about encoded video data like a tightly-packed suitcase :fontawesome-solid-suitcase:, you need to unpack it into raw data in order to change anything(1) in it, and then re-encode this new data into a codec again.
{ .annotate }

1.  Not necessarily for particular scenarios: tools like [LosslessCut](https://mifi.no/losslesscut/) can make cuts every I-frame which is where the compression resets and does not need to re-encode the whole video.

The choice depends on your hardware (do you own an NVIDIA GPU?), what you're uploading to (is it compatible with YouTube, Twitter, etc?), 
how much quality you're ready to lose (lossless means no compression artifacts) and how long you want to wait (can you let your PC render overnight?).

Each codec has it's own pros and cons:


| Features                           |     H.264 / AVC      |                       H.265 / HEVC                       |                                                                           AV1                                                                           |                                               UTVideo                                               |
|------------------------------------|:--------------------:|:--------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------:|
| Fast at encoding[^1]               | :material-check-all: |                     :material-check:                     |                                           :fontawesome-solid-equals: Only fast when encoding with a compatible GPU                                           |                                        :material-check-all:                                         |
| Filesize/Visual fidelity ratio[^2] | Worst out the bunch  |                   :material-check-all:                   |                                                                  :material-check-all:                                                                   |                                    Lossless,<br>makes huge files                                    |
| Compatibility[^3]                  | :material-check-all: | :fontawesome-solid-equals: Works in *some* video players | :material-close: AFAIK Only recent Davinci Resolve versions [support importing it](https://www.reddit.com/r/premiere/comments/10jh4gj/comment/jyvdd0i/) | You may need to [install it](https://github.com/umezawatakeshi/utvideo/releases/tag/utvideo-23.1.0) |
| Decoding speed[^4]                 | :material-check-all: |                   Worst out the bunch                    |                                                                    :material-check:                                                                     |       :material-check-all: It's only got full fat I-frames, resulting in super fast decoding        |

[^1]: **General rule of thumb** of how long you're expected to wait while it's encoding. Note that with a touch of configuration the same codec can be lightning speed or excruciatingly slow.
[^2]: Most important metric when streaming since you have a very limited bandwith budget unlike recording on disk/SSD.
[^3]: Mostly concerns being able to import videos in your video editor, uploading to Twitter, and being able to embed on Discord (aka to play back directly without the need to download). YouTube supports pretty much everything since it re-encodes after. 
[^4]: Important to consider while video editing so videos play back fast in your preview.


## :fontawesome-solid-microchip: Hardware-accelerated encoding { #hwenc }

You might've also noticed `NVENC`, `AMF` and `QuickSync` being mentioned after H.264, H.265 and AV1, this means the encoding is done on your GPU / iGPU instead of your CPU, this comes with pros/cons:
<br>
:material-plus: Faster encoding


:material-plus: Much lower load on the CPU (especially useful when recording while you are playing a game)

:material-minus: Worse filesize / visual fidelity ratio than CPU counterpart

Note that AV1 Encoding is only available on last-gen cards.


??? question ":simple-nvidia: Should I get an RTX 4000 card for it's AV1 encoder?"
    Only if you specifically have a use in mind for archiving or workflows that works best in AV1

    :material-plus: Definitely a step up in visual fidelity for band-with limited scenarios (streaming)

    :material-minus: Most video editors don't support importing AV1 footage yet (Voukoder does support exporting with it with software and hardware encoding)

    :material-minus: No, you won't have better "quality" when recording videos, H264 CQP0 exists if you want lossless quality

## Rate controls

Unless you are recording lossless (HUGE files), you need a way to constrain the video's bandwith

`CBR`: Constant bit rate

:   Most used for streaming nowadays

`CRF` / `CQP`: Constrained rate factor / Constant quantizer

:   The new prefered rate control for recording to disk, as it adapts to the "bandwith-hungryness" of the content, e.g. standing still in front a wall in a video-game will write way less data than when you're spinning and doing a bunch of 360s.

    It's some complex math stuff 

## Couleur's routine & use of codecs { #couleurs }

**Recording w/ OBS**: `H.264 NVENC` to encode as fast(1) as possible
{ .annotate }

1. Even super fast encoding settings can be lossless, NVENC's `P1` Preset which OBS calls "Low quality" is directed at people streaming with a constrained CBR

**Pre-rendering w/ Smoothie**:  `UTVideo` Decodes as fast as possible for video editing

**Exporting w/ Voukoder**: `H265 NVENC` + Upscaling(1) Whatever video editor which supports Voukoder this is a great middleground
{ .annotate }

1. This mentions one of my Voukoder presets that can be installed with my installation script that has an additional filter, which (up)scales to 4K and encode on the fly without needing to encode again with a batch script

## Voukoder & Smoothie encoding presets { #encodingpresets }

* **Smoothie**: Find them in [`target/encodingpresets.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini)

These directly translate to FFmpeg arguments, also add the `4K` macro to add upscaling arguments 

* **Voukoder**: My unofficial [`Install-Voukoder`](https://github.com/couleur-tweak-tips/TweakList/blob/master/modules/Installers/Install-Voukoder.ps1#L232) function

Tries to stay faithful to the aforementioned settings, also includes `+ Upscale` editions

## Other resources to learn more

<https://trac.ffmpeg.org/wiki/Encode/H.264>


<iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/UKtgpKF2RyM?color=white" frameborder=0 allowfullscreen></iframe>