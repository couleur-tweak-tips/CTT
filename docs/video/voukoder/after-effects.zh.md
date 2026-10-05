---
icon: custom/after-effects-og
---
# After Effects {#after-effects }
先打开导出设置：`File`（文件） -> `Export`（导出） -> `Add to Render Queue`（添加到渲染队列）。

确保没有遗留的旧渲染队列：全选（除最后一条外）后按 <kbd>DEL</kbd> 删掉。

![](../../assets/images/video/voukoder/ae-render-queue.png)

新建模板：点 `Output Module:`（输出模块）右侧的下拉箭头，选 `Make Template...`（制作模板）。

起个设置名，点 `Edit`（编辑）。

![](../../assets/images/video/voukoder/ae-make-template.png)

=== ":package: 无损"

    写到这里我才意识到，After Effects 唯一能导出的视频格式就是无损未压缩 AVI……要不你去查查 `Adobe Media Encoder` 的教程吧。

=== ":custom-voukoder: 用 Voukoder 导出"

    在格式下拉中选择 Voukoder，然后[配置它](./configuration.md)。
    
    ![](../../assets/images/video/voukoder/premiere-output-settings.png)

<hr>

配好 `Output Module Settings`（输出模块设置）后，点 `Ok` 关闭，再在 `Output Module Templates`（输出模块模板）上点一次 `Ok`，保存新模板。
