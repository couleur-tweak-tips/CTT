---
icon: custom/resolve
---
# DaVinci Resolve

Start by opening the `Deliver` tab (rightmost) at the bottom

=== ":package: H.264|H.265 Master"


    Depending on the edition of Resolve you own, you may encode with either the CPU (software/native encoding) or NVIDIA NVENC (hardware-accelerated), see [Codec guide](../codecguide.md) for more info about it.

    These settings are pretty close to default, feel free to suggest improvepments

    === "Encoder: Native (CPU)"

        You're only given constant bitrate control, see YouTube's table [here](https://support.google.com/youtube/answer/2853702)

        ![](/assets/images/video/voukoder/resolve-master-software.png)


    === "Encoder: NVIDIA"

        You might want to lower the constant QP I, P & B values if you find it too compressed

        ![](/assets/images/video/voukoder/resolve-master-nvenc.png)

=== ":custom-voukoder: Exporting with Voukoder"

    ![](/assets/images/video/voukoder/resolve-voukoder-options.png)

<hr>

Don't forget to save your preset after configuring:
    
![](/assets/images/video/voukoder/resolve-save-preset.png)