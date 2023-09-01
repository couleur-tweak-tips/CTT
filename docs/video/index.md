---
description: An introduction to the Video & Renders section
icon: material/video-box
---

# :material-video-box: Introduction

This section of the wiki is for video-related content, specifically using OBS to record high-quality, high-framerate videos, and how motion blur can be applied to those videos.

## :material-book: Definitions

### :material-run-fast: Motion Blur
When most people say motion blur, what they really mean is blending consecutive frames in a high-framerate video to a lower framerate, which replicates the effect of motion blur seen in real life and photography. This is called frame blending, and is what we'll be using in this wiki.

In general, the higher the input FPS, the smoother the final output would be, since more blur frames (the frames combined to make the new frame) make the blur look more seamless. The number of blur frames can be calculated by dividing the input fps by the output fps, then multiplying by the blur amount: `blur frames = input fps / output fps * blur amount`.

Video editors such as [Vegas Pro](/placeholder/) and [Adobe Premiere Pro](/placeholder/) have these features built-in. However, we recommend using seperate programs such as blur or smoothie first to pre-render the videos, since they're faster and more configurable with how they handle frame blending. Using them will also decrease preview lag in editors.

### :material-select-multiple: Interpolation

Video interpolation is a video processing technique that creates new frames between existing ones, effectively increasing the video's framerate. This is done using algorithms (such as SVP) or AI models (such as RIFE).

However, **interpolation is not and never will be perfect**. The good news is that it can do a very convincing job of appearing perfect with higher framerate inputs. Higher is better, and lower is always worse, as long as your recording framerate doesn't exceed your in-game framerate and you don't have too many dropped or duplicated frames (which can be seen in skipped frames in OBS' stats dock).

### :material-file-video-outline: Video Encoding/Decoding

Video encoding is the process of converting raw video into a digital codec, with decoding converting videos into a format that can be displayed and viewed on a screen.

A video codec is software or hardware that can encode and decode videos. The most common video codec is H.264 (aka AVC), which is what is most commonly used and references here.