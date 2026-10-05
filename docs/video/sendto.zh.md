---
description: Send To（发送到）
icon: fontawesome/regular/share-from-square
---

# :fontawesome-regular-share-from-square: Send To（发送到） {#send-to }
Send To 是 Windows 右键（上下文）菜单里的一个功能，可以用你选中的文件来启动脚本。

![在 Windows 运行对话框（Win+R）中输入 shell:sendto](../assets/images/video/sendto/context menu example.png){ width="600" }


# 打开 Send To 文件夹 {#opening-the-send-to-folder }
在运行对话框（Win+R）中输入 `shell:sendto` 即可打开。

![在 Windows 运行对话框（Win+R）中输入 shell:sendto](../assets/images/video/sendto/winrshellsendto.png){ width="450" }

在这里可以创建、删除指向脚本和文件夹的快捷方式。


![Send To 文件夹](../assets/images/video/sendto/sendtofolder.png){ width="450" }

## 脚本参数的行为 {#script-arguments-behavior }
!!! Info
    “*可执行文件*”指以下任意一种：
    
    * 指向可执行文件或批处理文件的快捷方式
    * 可执行文件或批处理文件本身

把文件拖到某个可执行文件上，和 Send To -> 该可执行文件的效果相同：

会以每个参数为选中文件完整路径的形式启动它：

```
example.cmd "D:\vids\clip1.mp4" "D:\vids\clip2.mp4"
```

## 各程序兼容性 {#program-compabitility }
以下程序支持一次传入多个文件路径 :white_check_mark:：

* [Smoothie](./smoothie/index.md)：我原生做了支持
* LosslessCut：有“批量模式”

以下程序一次只能开一个视频 :x:：

* Avidemux：一次只能打开一个视频文件
* [FFmpeg](./ffmpeg/index.md)：每个输入媒体文件都需要单独的 `-i` 参数


## 文件夹行为 {#folder-behavior }
你也可以放文件夹的快捷方式，这样就能在资源管理器里随处把文件复制/移动到特定位置：

* 直接左键点击会<u>复制</u>文件
* 按 <kbd>SHIFT</kbd> 点击会<u>移动</u>文件
