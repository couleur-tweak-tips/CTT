---
icon: fontawesome/solid/blender
---

# Tmix

This simple batchfile is a wrapper for the [ffmpeg tmix video filter](https://ffmpeg.org/ffmpeg-filters.html#tmix).


It can be useful to quickly convert high fps footage into lower fps with [frame blending](../smoothie/recipe.md#frame-blending).

You may want to use it to makes smaller files and can be decoded faster in video editors, to help that further the ffmpeg arguments are using the libx264 codec with fastdecode tuning, which allows for even less preview lag in e.g. VEGAS Pro.

It can save considerable amounts of render time if you are editing a long video and exporting it multiple times because you're not wasting time on the frame blending.

## Download

On that page, click on the :octicons-download-16: "download raw file" button on the right:

<https://github.com/couleur-tweak-tips/utils/blob/main/Miscellaneous/tmix.bat>

## Usage

Drag and drop videos on the batch file or move it in [Send To](../sendto.md)

## A faster alternative

The same result can be achieved using [smoothie](../smoothie/index.md), by configuring it like so:

```ini
[frame blending]
enabled: yes
fps: 60
intensity: 1.0
weighting: equal
bright blend: no

[output]
enc args: -c:v libx264 -tune fastdecode -preset veryfast -g 60 -x264-params bframes=0 -crf 20 -forced-idr 1 -strict -2 -maxrate 100M -bufsize 10M
```