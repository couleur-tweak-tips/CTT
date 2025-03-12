---
description: Installation instructions for Smoothie
icon: material/folder-download
---

# Installing Smoothie

## Dependencies

* [FFmpeg](https://ffmpeg.org), must be present in PATH or smoothie-rs' directory, see how to install it [here](../ffmpeg/index.md#installation)
    * Smoothie also makes use of [ffprobe](https://ffmpeg.org/ffprobe.html#Description) and [ffplay](https://ffmpeg.org/ffplay.html#Description), which should be included with your install

<div class="annotate" markdown>* Video files to use it with (1)</div>

1. This may sound obviously dumb, but you can't imagine the amount of kids asking on Discord "can it blur my desktop" thinking it was a real-time filter.

??? info "VapourSynth dependencies"

    Note: These are already provided with the .ZIP for Windows users, [created in VSBundler](https://github.com/couleurm/VSBundler)

    * [VapourSynth](https://github.com/vapoursynth/vapoursynth)
    * [Python](https://python.org)

    Plugins:

    * [ffms2](https://github.com/FFMS/ffms2): Source plugin
    * [lsmash](https://github.com/AkarinVS/L-SMASH-Works): Another source plugin
    * [vs-akarin](https://github.com/AkarinVS/vapoursynth-plugin/): Used for frame blending
    * [mvtools](https://github.com/dubhater/vapoursynth-mvtools): Used for flowblur
    * [svpflow](https://github.com/bjaan/smoothvideo/blob/main/SVPflow_LastGoodVersions.7z?raw=true): Used for interpolation
    * [RIFE NCNN Vulkan](https://github.comstyler00dollar/VapourSynth-RIFE-ncnn-Vulkan): Used for pre-interp
    * [fmtc](https://github.com/EleonoreMizo/fmtconv): Format converter
    * [timecube](https://github.com/sekrit-twc/timecube): LUT

    Scripts:

    * [adjust](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/adjust.py): For color grading, I don't know who made it
    * [filldrops](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/filldrops.py): For frame deduplication, I don't know who made this one either
    * [havsfunc](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/havsfunc.py): Used to change fps and interpolate, maintained [here](https://github.com/HomeOfVapourSynthEvolution/havsfunc/releases)


=== "Windows"

    ## Automatic Installer

    [Click here to download the latest version  of the smoothie intaller](https://github.com/couleur-tweak-tips/SmoothieInstaller/releases/latest/download/SmoothieInstaller.exe)

    It does the following:
    - Downloads Smoothie and FFmpeg to `%APPDATA%\Smoothie`
    - Installs Visual C++ Redistributables
    - Makes a shortcut in the Start Menu and Send To

    ## Manual installation

    This tutorial covers the manual installation instructions of Smoothie and the RIFE models (there are no automatic RIFE model installers currently)

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/RfPDgoMuSWg?start=20&color=white" frameborder=0 allowfullscreen></iframe>


    Smoothie comes in a portable zip file(1), download the latest version [here](https://github.com/couleur-tweak-tips/smoothie-rs/releases).
    { .annotate}

    1. [A portable program](https://en.wikipedia.org/wiki/Portable_application#Portable_application) means it doesn't come with an installer, you just unzip and run it. Upsides is it's easy to uninstall (just delete the folder lol) but downsides is you gotta make shortcuts to it yourself

    Extract the `smoothie-rs` folder somewhere, then in it you can use `launch.cmd` to launch it in it's GUI mode.


    # Making a [Send To](../sendto.md) shortcut

    Navigate to `...\smoothie-rs\bin` and get `smoothie-rs.exe`'s PATH by <kbd>SHIFT+Right click</kbd>ing it and "Copy Path"

    In `%APPDATA%\Microsoft\Windows\SendTo` make a shortcut to <smoothie-rs-folder\bin\smoothie-rs.exe> with add a space and ` --tui -i`

    If Smoothie is crashing on you, add the `-v` argument (that'd be ` -v --tui -i`) after the smoothie-rs executable's path to enable verbose logging to see what's wrong

    # Installing [RIFE models](./recipe.md#pre-interp)

    1. RIFE models distributed as ZIPs containing folders named by model version,
    2. Extract the zip to a new folder named `rife models` in your smoothie-rs folder
    3. Use one by setting in the recipe [`[pre-interp] model:`](./recipe.md#pre-interp) to the folder name
        * You can also <u>shift right click</u> the desired model folder in the Explorer -> `Copy as path` on the desired model, and paste it as a full path.


    You can download a pack of them here (~400MB):

    * <https://github.com/nihui/rife-ncnn-vulkan/releases>

    If you'd like a larger collection ([folder url](https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan/tree/master/models)):

    * <https://download-directory.github.io/?url=https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan/tree/master/models>

=== "Linux"

    Hqzkii maintains [`smoothie-rs-linux-git`](https://aur.archlinux.org/packages/smoothie-rs-linux-git) in the AUR

    todo, cargo should be able to compile it

    for arch nerds see the dependencies of <https://aur.archlinux.org/packages/teres>

    * you'll also need <https://aur.archlinux.org/packages/vapoursynth-plugin-vsakarin-git> for frame blending
    * and <https://aur.archlinux.org/packages/vapoursynth-plugin-rife-ncnn-vulkan-git> for pre-interp

=== "macOS"

    For non developers: there's no user friendly package for it yet.

    It is theoretically possible to install VapourSynth with [Homebrew](https://brew.sh) and compile every plugins (spritzer's done it before) but there's no one maintaining these packages yet.

    There's [a few of them already present](https://duckduckgo.com/?q=%22vapoursynth%22%20site%3Aformulae.brew.sh) for you to get an idea if you wanna get started


<!--
it'd be cool to be able to opt-in to use invidious instance for vids 

<iframe width='640' height='360' src='https://invidious.io.lol/embed/RfPDgoMuSWg?start=20'  frameborder=0 allowfullscreen></iframe> 


-->

