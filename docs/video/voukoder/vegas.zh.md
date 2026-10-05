---
icon: custom/vegas-pro-18
---
# VEGAS Pro {#vegas-pro }
剪辑完成后，进入 `File`（文件） -> `Render As...`（渲染为）导出项目：

![](../../assets/images/video/voukoder/vegas-renderas.png)

<hr>

你会看到渲染格式面板（左侧栏），每种格式自带一批编解码器。

=== ":package: MAGIX (H264|H265)/AAC MP4"

    该选 H.264、H.265，还是 CPU/硬件编码，读一读[编解码器指南](../codecguide.md)再定。

    ![](../../assets/images/video/voukoder/vegas-magix-format.png)

    你可以按项目原生分辨率渲染，再用[超分](../ffmpeg/upscaling.md)里的脚本处理。

    或者把项目缩放设为 3840x2160——但注意，这样你就无法控制缩放滤镜（如果我没记错，VEGAS 用的是 bicubic，不够锐利）。

    ![](../../assets/images/video/voukoder/vegas-magix.png)


=== ":custom-voukoder: 用 Voukoder 导出"

    !!! bug "在项目属性里设好目标输出 FPS"

        Voukoder 的行为与 MAGIX 不同。
        
        它的输出分辨率和帧率取自<u>项目属性</u>，而不是渲染模板（注意：根本没有任何地方让你填分辨率/帧率）。

        提示：按 <kbd>CTRL+ENTER</kbd> 打开 VEGAS 项目属性。

    Voukoder 的不同之处在于所有东西都藏在 `Voukoder` 里，全部编解码器都在 <b>Voukoder 对话框</b>中。

    如果装了 Core 和对应 Connector，`Voukoder` 应该会出现在可用格式列表里。

    选 `Video project default (4:2:0 8 bit), Audio: project default`，99% 的情况都够用。

    ![](../../assets/images/video/voukoder/vegas-render-templates.png)

    <hr>

    点击 `Show Voukoder dialog`（显示 Voukoder 对话框）按钮。

    如何按需配置见[:octicons-gear-16: 配置](./configuration.md)。


    ![](../../assets/images/video/voukoder/vegas-show-voukoder-dialog.png)

<hr>

别忘了在底部选项卡调整 `Project`（项目）页：

1. 把视频渲染质量设为 `Best`（最佳）
1. 按需调整色彩空间与范围
1. 起个好记的名字方便以后复用
1. 点右上角的保存图标

![]../../assets/images/video/voukoder/vegas-finishtemplate.png)
