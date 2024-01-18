---
description: Initial OBS configuration for all encoders
icon: obs/logo
---

## :material-information-box: Introduction
[Open Broadcaster Software Studio](https://obsproject.com) is free and open-source software for live streaming and recording.

## High FPS recording

A lot of [us](https://discord.gg/CTT) configure our encoder to record as high FPS as we get in-game(1) to then [frame blend](../smoothie/recipe.md#frame-blending) with [Smoothie](../smoothie/index.md).
{ .annotate}

1. If you get about 600FPS it's recommended to record around 480FPS to accommodate for the variations and eventual drops

## :material-package-down: Installing OBS

You should install the latest version of OBS from the [official downloads page](https://obsproject.com/download). This page provides multiple sources you can install it from.

## Other documentation sources

See OBS' knowledgebase: https://obsproject.com/kb

<!--
* Launch (CLI) Parameters: https://obsproject.com/kb/launch-parameters

this is linked in the page above anyway, i don't think it needs to be linked here
-->

## :material-cog: Initial configuration

??? tip "Video Walkthrough"
    <center>
        <video width="720" height="405" controls>
            <source id="mp4" src="../../assets/videos/video/obs/obs-initial-config.mp4" type="video/mp4">
        </video>
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
9. Add a **Display Capture** source (unless you're on [Linux](linux/index.md))
10. At the top, go to **Docks :material-arrow-right: Stats**, then drag it to the side of the preview to dock it, then adjust the sizing how you'd like

### :octicons-graph-16: Stats dock
The stats dock is used for monitoring if your OBS settings can keep up with your computer, as well as other statistics shown.

The main two statistics to indicate lag are encoding lag and rendering lag. If one of these statistics are increasing when recording your game in movement, then you should adjust your OBS settings.

### :material-replay: Replay Buffer
Replay buffer is a feature in OBS that allows users to save only the last specified seconds of a recording to a video file on the press of a button or hotkey. It uses RAM as a temporary storage, similar to NVIDIA's Shadowplay.

It's very useful for testing encoder settings (with lots of movement in the test) without making lots of useless video files, as well as easily clipping moments in gameplay or whatever else.

You can configure it in the **Replay Buffer** tab in **Output**, and you can set hotkeys for it in **Hotkeys** after it has been enabled.