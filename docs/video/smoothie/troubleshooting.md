---
description: Common Smoothie problems and their solutions
icon: material/lifebuoy
---

# Troubleshooting

When troubleshooting, make sure to read the **entire error message**, most of the time the text above the red error text is what explains the issue.

Here's a handful of common errors and how to solve them:

#### `ffmpeg.exe is not installed/in PATH, ensure FFmpeg is installed` { #ffmpeg-not-found }

:   You need [ffmpeg](../ffmpeg/index.md#installation), see [Smoothie's dependencies](./installation.md#dependencies)


#### `*Smoothie crashing before any error can be read*` { #smoothie-instant-crash }

:   Run Smoothie by using `launch.cmd` and select your video. Smoothie will stay open and you can read the error. If there's no error message, it's likely a problem with your Send to shortcut</ins>.

#### `Smoothie Recipe parser: setting XYZ has no parent category` { #recipe-parse-error }

:   Double check the syntax of your recipe config file. Make sure you're not using the config from the old [smoothie-py](https://github.com/couleur-tweak-tips/Smoothie) or [blur](https://github.com/f0e/blur).


#### `No valid videos were passed to smoothie` { #no-valid-videos }

:   It means all of the input files it's gone through were not valid video files, ensure they're not corrupted / empty (0 bytes)

#### `'X' is not an official yuv4mpegpipe pixel format`  { #invalid-yuv4mpeg-pixel-format }

:   Your video is recorded in a color format that is unsuppored by SVPFlow (interpolation algorithm). Convert your video to a supported color format (NV12) or don't use interpolation (or use pre-interp instead).

#### `VapourSynth Resize error 3074: no path between colorspaces (2/2/2 => 0/2/2)` { #resize-error }

:   This is due to some incompatible color convertion with your video during [RIFE pre-interp](./recipe.md#pre-interp), try changing your OBS' advanced color settings and see what works.

#### `FFmpeg encoding error: Driver does not support the required nvenc API version.` { #nvenc-driver-version-error }

:   Update your Nvidia GPU drivers or use others encoding arguments like H264/5 CPU, or UTVideo 

#### `Python exception: Source: The index does not match the source file`  { #source-index-mismatch }

: Ensure your video path doesn't have any non-english, special characters. The name of your file might be the problem, try renaming it.

#### `Warning: Failed to load [...]\smoothie-rs\bin\vapoursynth64\plugins\librife.dll. GetLastError() returned 126. The file you tried to load or one of its dependencies is probably missing.`

:   You're running this in a VM or do not have vulkan libraries installed.

### The error is persisting or not listed here

:   Please [make a support post on our Discord](https://discord.gg/CTT) or [contact me](../../contact.md#couleur)

Shout out [z1xus and gem-storm](https://github.com/gem-storm/smrs-guide) for the base of most of this page!