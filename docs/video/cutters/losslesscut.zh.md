---
icon: custom/losslesscut
---
<div class="grid cards" markdown>

-   # :custom-losslesscut: LosslessCut {#losslesscut }
    基于 Electron 的视频剪切界面

    [:octicons-home-16: 官网](https://mifi.no/losslesscut/){ .md-button }
    [:material-tag-text:](https://github.com/mifi/lossless-cut/releases/latest){ .card-link title="GitHub releases"}
    [:octicons-code-16:](https://github.com/mifi/lossless-cut/tree/HEAD){ .card-link title="Source Code" }
    [:material-heart:](https://mifi.no/thanks){ .card-link title="Support" }

    === ":fontawesome-brands-windows:{ style="color: #00BCF2" } Windows"

        Mifi 把 Lossless-Cut 以便携 7-Zip 压缩包的形式分发

        [:custom-7z: 便携 .7z 压缩包](https://github.com/mifi/lossless-cut/releases/latest/download/LosslessCut-win-x64.7z)

        也可以花 $20 从 Microsoft Store 购买——抱歉普通用户没有安装器。

        [:simple-microsoftstore: Microsoft Store](https://apps.microsoft.com/detail/9P30LSR4705L)

        Winget：见 [microsoft/winget-pkgs#7204](https://github.com/microsoft/winget-pkgs/issues/72074)


    === ":custom-scoop: Scoop"

        ??? "需要 "extras" bucket"

            如果你刚装好 [Scoop](https://scoop.sh)，需要在 cmd 里执行：

            ```PowerShell
            scoop.cmd update git 7zip
            scoop.cmd bucket add extras
            ```

        `scoop install losslesscut`{data-clipboard-text="scoop.cmd install extras/losslesscut"}
        |
        [`losslesscut.json`](https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/losslesscut.json)

    === ":custom-chocolatey: Chocolatey"

        `choco install losslesscut `{data-clipboard-text="choco install lossless-cut -y"}
        |
        [软件包页面](https://community.chocolatey.org/packages/losslesscut)

    === ":simple-archlinux:{ .archblue } pacman"

        * [Snapcraft](https://snapcraft.io/losslesscut)：`losslesscut`

        * [Flathub](https://flathub.org/apps/no.mifi.losslesscut)：`no.mifi.losslesscut`

        AUR：

        * [`losslesscut-bin`](https://aur.archlinux.org/packages/losslesscut-bin)

        * [`losslesscut-git`](https://aur.archlinux.org/packages/losslesscut-git)


</div>

![](../../assets/images/video/ffmpeg/video-cutters/losslesscut/losslesscut-ui.png)

值得一提的功能：

* 拖入多个文件时可选择“批量模式”，一次跑完多个视频
* 智能剪切（实验性）：只对两端边缘关键帧重新编码，从而实现逐帧精准的剪切
* 支持 Send To / 把多个文件拖到它的快捷方式上
* 可以选择不同的输出编解码器
* 可以只导出音频或只导出视频
* 剪切片段可以合成一个输出视频，也可拆成多个

## :material-export: 导出页面 {#export-page }
![](../../assets/images/video/ffmpeg/video-cutters/losslesscut/losslesscut-export.png)

如果嫌它给导出文件起的名字太长，可以点击输出文件名（下图中蓝色下划线处），把它改成：
```
${FILENAME}-cut${EXT}
```
不过要注意：多次导出会发生文件名冲突，自己掂量。
