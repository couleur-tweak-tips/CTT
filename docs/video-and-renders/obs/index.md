---
description: Initial OBS configuration for all configurations
icon: simple/obsstudio
---

# :simple-obsstudio: Open Broadcaster Software 

## :material-information-box: Introduction
[Open Broadcaster Software (OBS)](https://obsproject.com) is a free and open-source software for live streaming and recording. Here you'll learn how to initially configure and install OBS.

## :material-package-down: Installing OBS
You should the latest version of OBS from the official [downloads page](https://obsproject.com/download). This page provides multiple sources from which you can install it.

### Alternative sources

=== "Windows"

    * WinGet: `winget install -e --id OBSProject.OBSStudio`
    * Scoop: `scoop bucket add extras; scoop install extras/obs-studio`
    * Chocolatey: `choco install obs-studio`

=== "Linux"

    * Flathub (recommended): `flatpak install flathub com.obsproject.Studio`
    * Arch-based distros: `pacman -S obs-studio`
    * Ubuntu-based distros (copied from OBS download page):
      ```bash
      sudo add-apt-repository ppa:obsproject/obs-studio
      sudo apt update
      sudo apt install ffmpeg obs-studio
      ```

=== "macOS"

    !!! warning "Unsupported"
        At the moment, OBS settings for macOS aren't considered in the documentation.

    * Homebrew: `brew install --cask obs`

## :material-cog: Initial configuration

??? tip "Video Walkthrough"
    <center>
        <video width="720" height="405" controls>
            <source id="mp4" src="/CTT/assets/videos/video-and-renders/obs/obs-initial-config.mp4" type="video/mp4">
        </video>
    </center>

??? info "Recording formats"
    - **MPEG-4 (.mp4)** has the best compatibility, and will work for Discord embeds and in pretty much any video editor
    - **Matroska Video (.mkv)** has decent compatibility, but won't work for Discord embeds. However, if OBS suddenly closes or your computer unexpectedly shuts down, your recording will be saved, unlike `.mp4`.
        - You can convert `.mkv` and other formats to regular `.mp4` videos within OBS using remuxing.
    
    ??? tip "How to use remuxing"
        <center>
            ![How to remux](/CTT/assets/images/video-and-renders/obs/nvenc/how_to_remux.gif){ width="600" }
        </center>

1. Click **Cancel** on the **Auto-Configuration Wizard** to skip it
2. Open **Settings :material-arrow-right: Video**
3. Change the **Output (Scaled) Resolution** to exactly match your **Base (Canvas) Resolution**
4. Switch **Common FPS Values :material-arrow-right: Fractional FPS Value** and modify the numerator to change your desired output FPS
5. Go to the **Output** tab, and change the **Output Mode** to **Advanced**
    - **Recording Format:** Use **MPEG-4 (.mp4)** for compatibility or **Matroska Video (.mkv)**.
6. Go to the **Audio** tab, and under **Global Audio Devices**, configure your audio devices
7. Click **OK** on the Settings window
8. Adjust the **Audio Mixer** to your liking
9. Add a **Display Capture** source (unless you're on [Linux](/CTT/video-and-renders/obs/linux/))
10. At the top, go to **Docks :material-arrow-right: Stats**, then drag it to the side of the preview to dock it, then adjust the sizing how you'd like

### :octicons-graph-16: Stats dock
The stats dock is used for monitoring if your OBS settings can keep up with your computer, as well as other statistics shown.

The main two statistics to indicate lag are encoding lag and rendering lag. If one of these statistics are increasing when recording your game in movement, then you should adjust your OBS settings.

### :material-replay: Replay Buffer
Replay buffer is a feature in OBS that allows users to save only the last specified seconds of a recording to a video file on the press of a button or hotkey. It uses RAM as a temporary storage, similar to NVIDIA's Shadowplay.

It's very useful for testing encoder settings (with lots of movement in the test) without making lots of useless video files, as well as easily clipping moments in gameplay or whatever else.

You can configure it in the **Replay Buffer** tab in **Output**, and you can set hotkeys for it in **Hotkeys** after it has been enabled.

## :material-account-question: Where to go from here

!!! warning "Ranking"
    NVIDIA's encoder (NVENC) is by far the best for recording, as it is fast and not resource intensive, unless you push it to its limits. Other encoders may struggle to record very high FPS, such as 240 FPS and over.

From here, you'll want to go to the page which fits [your GPU](https://www.microsoft.com/en-us/windows/learning-center/how-to-check-gpu "How to check your GPU in Windows").

- :simple-nvidia: [**NVIDIA NVENC**](/CTT/video-and-renders/obs/nvenc)
- :custom-amd: [**AMD AMF**](/CTT/video-and-renders/obs/amf)
- :simple-intel: [**Intel QuickSync**](/CTT/video-and-renders/obs/quicksync)

### :octicons-cpu-16: Software Encoding

These are much slower and more resource intensive than the GPU/hardware-accelerated encoders listed above, but they're also universally compatible and much more efficient.

- :octicons-cpu-16: [**CPU x264**](/CTT/video-and-renders/obs/x264/)