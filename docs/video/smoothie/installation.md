---
description: Installation instructions for Smoothie
icon: material/folder-download
---

# Installing Smoothie

## Dependencies

* [FFmpeg](https://ffmpeg.org), must be present in PATH, see how to install it [here](../ffmpeg/index.md#installation)
    * Smoothie also makes use of [ffprobe](https://ffmpeg.org/ffprobe.html#Description) and [ffplay](https://ffmpeg.org/ffplay.html#Description), which should be included with your install

<div class="annotate" markdown>* Video files to use it with (1)</div>

1. This may sound obviously dumb, but you can't imagine the amount of kids asking on Discord "can it blur my desktop" thinking it was a real-time filter.

??? info "VapourSynth dependencies"

    Note: These are already provided with the .ZIP for Windows users

    * [VapourSynth Classic](https://github.com/AmusementClub/vapoursynth-classic)
    * [Python 3.10.9](https://python.org)

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

    This tutorial covers the rest of the installation instructions

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/RfPDgoMuSWg?start=20&color=white" frameborder=0 allowfullscreen></iframe>

    # Manual installation


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

    !!! note "NOT UPSTREAM"
        
        This is not the upstream repo at [couleur-tweak-tips/smoothie-rs](https://github.com/couleur-tweak-tips/smoothie-rs), this is a fork of smoothie that is maintained
        by hybridkernel at 
        [hzqkii/smoothie-rs](https://github.com/hzqkii/smoothie-rs) all bug reports about linux should go to this repo, and not the upstream.

    **Archlinux**    

    You can install smoothie-rs on Archlinux by either adding the [smrs-arch-repo](https://gitlab.com/hzqki/smrs-arch-repo) or installing it via the AUR
    
    Repo (Recommended):

    1. Add `smrs-arch-repo` to your `/etc/pacman.conf`
    
    ```toml
    [smrs-arch-repo]
    SigLevel = Optional DatabaseOptional
    Server = https://gitlab.com/hzqki/$repo/-/raw/main/$arch
    ```
    
    2. Install `smoothie-rs-linux-git` through pacman 
    
    ```bash
    pacman -S smoothie-rs-linux-git
    ```
    
    AUR
    
    1. Install `smoothie-rs-linux-git` from the AUR
    
    ```bash
    yay -S smoothie-rs-linux-git
    ```
    
    **Other Distros**
    
    1. Install [Distrobox](https://distrobox.it/)
    
    2. Install Archlinux inside distrobox:
    
    ```bash
    distrobox-create -i archlinux:latest -n smrs
    ```
    ```bash
    distrobox-enter smrs
    ```
    Update keyring and packages :D
    
    ```bash
    sudo pacman-key --init
    sudo pacman -Sy archlinux-keyring
    sudo pacman -Syu
    ```
    Then just follow the Archlinux installation instructions
    
<!--
it'd be cool to be able to opt-in to use invidious instance for vids 

<iframe width='640' height='360' src='https://invidious.io.lol/embed/RfPDgoMuSWg?start=20'  frameborder=0 allowfullscreen></iframe> 


-->

