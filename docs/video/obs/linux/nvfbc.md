---
description: OBS NvFBC source setup for NVIDIA GPUs on Linux
icon: simple/nvidia
---

# :simple-nvidia: NvFBC

## :material-information-box: Information

For NVIDIA users, NvFBC is avaliable after some driver patching. NvFBC is a feature like NVENC, except from that it captures your screen directly from the framebuffer very efficiently.

Overall, this works very well for high FPS recording, and is on a par with Windows' default **Display Capture** source, if not better.

However, unfortunately, this has some issues:

- The NvFBC plugin is currently **incompatible with OBS 28+**
    - Maybe this could be fixed [in the future](https://gitlab.com/fzwoch/obs-nvfbc/-/issues/10)
- You need to be on the proprietary NVIDIA drivers
- You need to use X.Org (not Wayland)
    - See this with `echo $XDG_SESSION_TYPE`

## :material-package-down: Installation

1. Install `nvidia-utils-nvlax` from the AUR, which will replace `nvidia-utils` with a patched version. It does 2 patches, all automatically:
    - **NVENC patch:** removes restriction on maximum number of simultaneous NVENC video encoding sessions imposed by Nvidia to consumer-grade GPUs
    - **NvFBC patch (required):** allows to use NvFBC on consumer-grade GPUs
2. Install `downgrade` from the AUR
3. Run `sudo downgrade --ala-only obs-studio`, install the latest version of OBS 27 (which is `27.2.4 2`)
4. Install `obs-nvfbc-high-fps-git` from the AUR, which is the 'NvFBC Source' OBS plugin, patched for high FPS values
5. Open OBS, and add the 'NvFBC Source'
6. Configure the NvFBC source (test out settings), make the FPS the same as the OBS recording FPS

### :material-lightbulb-on: Tips

- Enable **Smooth FPS** in Minecraft or cap your FPS, just so that OBS doesn't lag
- Toggle/disable compositing in your window manager/desktop environment
- You can use `teres` in the AUR to frame blend and interpolate

### :octicons-cross-reference-16: References

- [Patched OBS NvFBC plugin](https://aur.archlinux.org/packages/obs-nvfbc-high-fps-git)
- [Downgrade Pacman packages](https://aur.archlinux.org/packages/downgrade)
- [Patched `nvidia-utils`](https://aur.archlinux.org/packages/nvidia-utils-nvlax)
- [OBS NvFBC plugin page](https://gitlab.com/fzwoch/obs-nvfbc/-/tree/master#obs-nvfbc)