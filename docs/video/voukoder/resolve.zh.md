---
icon: custom/resolve
---
# DaVinci Resolve {#davinci-resolve }
先打开底部的 `Deliver`（交付）选项卡（最右侧）。

=== ":package: H.264|H.265 Master"


    取决于你手上的 Resolve 版本，你可以用 CPU（软件/原生编码）或 NVIDIA NVENC（硬件加速）编码，细节见[编解码器指南](../codecguide.md)。

    这些设置与默认值非常接近，欢迎提出改进建议。

    === "Encoder: Native (CPU)"

        只提供固定码率控制，码率参考 YouTube 的[这份表格](https://support.google.com/youtube/answer/2853702)。

        ![](../../assets/images/video/voukoder/resolve-master-software.png)


    === "Encoder: NVIDIA"

        嫌压得过分的话，可以把固定 QP I、P、B 的值调低。

        ![](../../assets/images/video/voukoder/resolve-master-nvenc.png)

=== ":custom-voukoder: 用 Voukoder 导出"

    ![](../../assets/images/video/voukoder/resolve-voukoder-options.png)

<hr>

配置完成后别忘了保存预设：
    
![](../../assets/images/video/voukoder/resolve-save-preset.png)
