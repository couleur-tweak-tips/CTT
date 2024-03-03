---
description: An introduction to the Video & Renders section
icon: material/video-box
---

# <!--:material-video-box:--> Introduction

This category is dedicated to document optimal configurations of programs for creating video content (optionally with [high quality motion blur](./smoothie/index.md)) and help you forge your own personal production workflow.

## :material-book: Definitions

### :material-run-fast: Frame blending
The most common form of motion blur, it is without any smearing of HUDs or general artifacting (unlike other methods like RSMB). Commonly this is done from a very high FPS (e.g. 540) down to a common FPS, i.e. 60 or 30.

In general, the higher the input FPS, the smoother the final output would be, due to more blur frames making the blur look more seamless. Blur frames are how many frames are blended together, so `blur frames = input fps / output fps`.

Video editors such as Vegas Pro and Adobe Premiere Pro have these features built-in. However, we recommend using seperate programs such as [Smoothie](./smoothie/index.md) first to pre-render the videos, therefore you don't have any lag in your video editor as well as having much more customization.

### :material-select-multiple: Interpolation

Video interpolation is a video processing technique that creates new frames between existing ones, effectively increasing the video's FPS using algorithms or AI.

[RIFE](https://github.com/megvii-research/ECCV2022-RIFE) and the [SVP](https://www.svp-team.com) algorithm are commonly implemented into frame blending applications to interpolate.

It generates frames from the data it has, and the higher the input FPS, the smaller the window between the two points are, which means more FPS the better.

### :material-file-video-outline: Video encoding and decoding

Video encoding is the process of converting one format (e.g. the raw visual data captured during recording) into a digital codec, with decoding converting videos into a format that can be displayed and viewed on a screen.

A video codec is software or hardware that compresses and decompresses digital video to make file sizes smaller and make storage and distribution of videos easier.