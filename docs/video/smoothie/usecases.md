---
icon: material/file-eye
---

# Use case examples

Smoothie is a real swiss army knife when you know all of it's tricks, I'll list all the actual use cases I've seen Smoothie be a great alternative for

## High-FPS VEGAS Pro editing

(This could be applied to Premiere Pro as well, though it has much faster pre-render/proxy capabilities, but objectively worse looking frame blending)

Let's say I record in 480FPS and like to frameblend & export at 60FPS:

Instead of doing:

* Record video-game footage in 480FPS with OBS
* Import footage in VEGAS Pro
* Edit the footage with preview lag running at 5~15 FPS tops
* Export with smart resampling (slow)
* Need to export again? Gotta also resample everything AGAIN

Consider:

* Record video-game footage in 480FPS with OBS
* Use Smoothie with frameblending on all clips (e.g 60fps out)
* Import footage in VEGAS Pro
* Edit the footage with way less preview lag
* Export at the same framerate as your clips (no smart resampling thus fast)

The only downside is that if you use something like velocity / slow downs it'll look choppy, but nothing prevents you from replacing that particular part with the original 480FPS clip

## Flowframes (for 60+fps interp then frame blending)

e.g in the context of gpu-intensive tasks like recording [Apex Legends gameplay](https://youtu.be/tItOJFwILOc)

Instead of doing:

* Record video-game footage in 180FPS with OBS
* Interpolate each video file sequentially with [Flowframes](https://nmkd.itch.io/flowframes) and exporting in PNG sequence
* Account for the temp storage it's gonna take from extracting video files into raw frames and the output folder
* Open VEGAS and import as PNG sequence
* Export with frame resampling


Consider:

* Record video-game footage in 180FPS with OBS
* Queue all videos to Smoothie configured to [pre-interpolate (RIFE)](./recipe.md#pre-interp) and [frameblend](./recipe.md#frame-blending)
* ..thats it.

enjoy ur smooth frags [:)](https://youtu.be/3cbfKyQktRY)

## Doing render tests

For my fellow [`#video-dicussion`](https://discord.gg/CTT) frogs :)

Instead of doing:

* Record video-game footage in 480FPS with OBS
* Import footage in VEGAS Pro
* Add your color grading settings & LUT file
* Export with MAGIX at 240M bitrate
* Move output video file to your upscale folder
* Rename it to input.mp4
* Sort out the previous video files you had left in the upscale folder
* Run upscale.bat
* Upload to YouTube

Consider:

* Record video-game footage in 480FPS with OBS
* Configure Smoothie like so:
    * Add your favorite [LUT](./recipe.md#lut) / configure the [color grading](./recipe.md#color-grading)
    * Turn on [frame blending](./recipe.md#frame-blending)
    <!-- * In the [output enc args](./recipe.md#output) add `4K` to (up)scale to 4K -->
* Run Smoothie
* Share  directly to Discord or to [fileditch.com](https://fileditch.com)