---
icon: fontawesome/solid/blender
---

# Tmix

This simple batchfile is a wrapper the [ffmpeg tmix video filter](https://ffmpeg.org/ffmpeg-filters.html#tmix).


It can be useful to quickly convert high fps footage into lower fps with [frame blending](../smoothie/recipe.md#frame-blending).

You may want to do this because it makes smaller files and can be played with less lag in video editors, infact the default encoding arguments is libx264 with fastdecode tuning, which allows for even less preview lag in e.g. VEGAS Pro.

It can save considerable amounts of render times if you are editing a large project and exporting it multiple times because you're not wasting time on the frame blending.

## Download

On that page, click on the :octicons-download-16: "download raw file" button on the right:

<https://github.com/couleur-tweak-tips/utils/blob/main/Miscellaneous/tmix.bat>

## Usage

Drag and drop videos on the batch file or drop it in [Send To](../sendto.md)

## A faster alternative

The equivalent in [smoothie](../smoothie/index.md) would be to configure it like so:

```ini
[frame blending]
enabled: yes
fps: 60
intensity: 1.0
weighting: equal
bright blend: no
```