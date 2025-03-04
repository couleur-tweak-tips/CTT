---
icon: material/file-eye
---

# Use case examples

Smoothie is a real swiss army knife when you know all of it's tricks, I'll list all the actual use cases I've seen Smoothie be a great alternative for.

## High-FPS VEGAS Pro editing

(This could be applied to Premiere Pro as well, though it has much faster pre-render/proxy capabilities, but objectively worse looking frame blending)

Let's say I record in 480FPS and like to frame blend & export at 60FPS:

Instead of:

* Importing footage in VEGAS Pro
* Editing the footage with lots of preview lag running at 5~15 FPS tops
* Exporting with smart resampling (slow)
* Messed something up? Need to export again? Gotta also resample everything AGAIN

Consider:

* Using Smoothie with frame blending on all clips
* Importing footage in VEGAS Pro
* Editing the footage with way less preview lag
* Exporting at the same framerate as your clips (no smart resampling thus fast)

The only downside is that if you use something like velocity / slow downs it'll look choppy, but nothing prevents you from replacing that particular part with the original 480FPS clip

## Flowframes (for 60+fps interp then frame blending)

e.g in the context of gpu-intensive tasks like recording [Apex Legends gameplay](https://youtu.be/tItOJFwILOc)

Let's say we recorded in 180fps:

Instead of:

* Interpolating each video file sequentially with [Flowframes](https://nmkd.itch.io/flowframes) and exporting in PNG sequence
* Accounting for the temp storage it's gonna take from extracting video files into raw frames
* Opening VEGAS and import as PNG sequence
* Exporting with smart resampling


Consider:

* Queue all videos to Smoothie configured to [pre-interpolate (RIFE)](./recipe.md#pre-interp) and [frame blend](./recipe.md#frame-blending)
* ...thats it.

Enjoy ur smooth frags [:)](https://youtu.be/3cbfKyQktRY)

## Doing render tests

For my fellow [`#video-dicussion`](https://discord.gg/CTT) frogs :)

Instead of:

* Importing footage in VEGAS Pro
* Adding your color grading settings & LUT file
* Exporting with MAGIX at 240M bitrate
* Moving output video file to your upscale folder
* Renaming it to input.mp4
* Sorting out the previous video files you had left in the upscale folder
* Running upscale.bat
* Uploading to YouTube

Consider:

* Configure Smoothie like so:
    * Add your favorite [LUT](./recipe.md#LUT) / configure the [color grading](./recipe.md#color-grading)
    * Turn on [frame blending](./recipe.md#frame-blending)
    <!-- * In the [output enc args](./recipe.md#output) add `4K` to (up)scale to 4K -->
* Run Smoothie
* Share  directly to Discord or to [fileditch.com](https://fileditch.com)