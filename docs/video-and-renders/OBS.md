---
description: How to initially configure OBS
icon: simple/obsstudio
---

# :simple-obsstudio: Open Broadcaster Software 

## :material-information-box: Introduction
[Open Broadcaster Software (OBS)](https://obsproject.com) is a free and open-source software for live streaming and recording. Here you'll learn how to initially configure and install OBS.

## :material-package-down: Installing OBS
You should the latest versiono of OBS from the official [downloads page](https://obsproject.com/download). This page provides multiple sources from which you can install it.

### Alternative sources

=== "Windows"

    * WinGet: `winget install -e --id OBSProject.OBSStudio`
    * Scoop: `scoop bucket add extras; scoop install extras/obs-studio`
    * Chocolatey: `choco install obs-studio`

=== "Linux"

    * Flathub (recommended): `flatpak install flathub com.obsproject.Studio`
    * Arch-based distros: `pacman -S obs-studio`
    * Ubuntu-based distros: `choco install obs-studio`

=== "macOS"

    * Homebrew: `brew install --cask obs`

## :material-cog: Initial configuration

??? tip "Video Walkthrough"
    <center>
        <video width="720" height="405" controls>
            <source src="/assets/videos/video-and-renders/obs/obs-initial-config.mp4" type="video/mp4">
        </video>
    </center>

For an initial configuration of OBS, you should:

1. Click **Cancel** on the **Auto-Configuration Wizard** to skip it
2. Open **Settings :material-arrow-right: Video**
3. Change the **Output (Scaled) Resolution** to exactly match your **Base (Canvas) Resolution**
4. Switch **Common FPS Values :material-arrow-right: Fractional FPS Value** and modify the numerator to change your desired output FPS
5. Go to the **Output** tab, and change the **Output Mode** to **Advanced**
6. Go to the **Audio** tab, and under **Global Audio Devices**, configure your audio devices
7. Click **OK** on the Settings window
8. Adjust the **Audio Mixer** to your liking
9. Add a **Display Capture** source
10. At the top, go to **Docks :material-arrow-right: Stats**, then drag it to the side of the preview to dock it, then adjust the sizing how you'd like
    - This is used for monitoring if your OBS is having any trouble keeping up with your configuration
