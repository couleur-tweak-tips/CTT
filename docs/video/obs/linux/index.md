---
description: OBS configuration for Linux
icon: simple/linux
---

Also see dec05eba's [gpu-screen-recorder](https://git.dec05eba.com/gpu-screen-recorder/about/) if you just want to record games in high FPS without using the rest of OBS' features

# :material-linux: Linux OBS Configuration

On OBS for Linux, there's not much options by default for high FPS or otherwise low resource recording like Windows. This is due to inefficient capture methods:

- **Screen Capture (XSHM):** Generally can't record above 120 FPS without lag
- **Window Capture (Xcomposite):** Much more efficient, but still limited to ~540 FPS
- **Pipewire Capture:** Generally can't record above 60 FPS without lag

If the default **Window Capture (Xcomposite)** works just fine for you, you can stop here. However, if you want more efficient capture methods, you will have to go with third-party plugins, which may or may not be worth it.

## :octicons-plug-16: Third-party plugins

- [:simple-nvidia: **NvFBC (`obs-nvfbc` patched for high FPS)**](nvfbc.md)
    - Requires NVIDIA, OBS 27 and X.Org
    - Screen capture
- [:octicons-screen-full-16: **OBS VkCapture (`obs-vkcapture`)**](obs-vkcapture.md)
    - Game capture