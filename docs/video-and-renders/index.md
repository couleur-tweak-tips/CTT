---
description: An introduction to video and renders
icon: material/video-box
---

# :material-video-box: Introduction

This section of the wiki will show you how to optimally configure software to help you produce high-quality and optionally motion blurred videos with your own optimised personal workflow.

## :material-book: Definitions

### :material-run-fast: Motion blur
For motion blur, a process is commonly used called frame blending, **which combines frames together to produce a motion blur effect**, without any smearing of HUDs or general artifacting. Commonly this is done from a very high FPS (e.g. 540) down to a common FPS, i.e. 60 or 30.

In general, the higher the input FPS, the smoother the final output would be, due to more blur frames making the blur look more seamless. Blur frames are how many frames are blended together, so `blur frames = input fps / output fps`.

Video editors such as [Vegas Pro](/placeholder/) and [Adobe Premiere Pro](/placeholder/) have these features built-in. However, we recommend using seperate programs such as [blur](/placeholder/) first to pre-render the videos, therefore you don't have any lag in your video editor as well as having much more customisation.

### :material-select-multiple: Interpolation

Video interpolation is a video processing technique that creates new frames between existing ones, effectively increasing the video's frames per second (FPS) using algorithms or AI.

[RIFE](https://github.com/megvii-research/ECCV2022-RIFE) and [SVP](https://www.svp-team.com/) are commonly implemented into frame blending applications to interpolate.

However, interpolation isn't perfect. The lower input FPS you give it, the generally worse result it will produce, meaning that in our case for motion blur, you still will need to record in the highest FPS that your hardware will allow it to.