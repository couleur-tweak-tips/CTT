---
icon: custom/voukoder
---

# Voukoder 是什么？ {#what-is-voukoder }
!!! danger "重要：Voukoder 已停止获取"

    Vouk 删除了 Voukoder 的全部发布包，转而推广[它的图形化后继者](https://www.voukoder.org/)：售价 69 欧元，有 14 天功能受限的试用许可。

    如果你已经装了 Core 和 Connector，它们还能用，但 Vouk 没有留下任何可获取的存档。

    * Core 以 GPL 许可证开源，理论上谁都可以用更新的 ffmpeg 依赖让它复活（注意商标问题——Vouk 在 Discord 上明确表态过）
    * Connector 一直是专有软件

    除非 Vouk 明确许可（我怀疑永远不会有这一天），Connector 不得再分发。

Voukoder 是 NLE 插件，让你可以使用 ffmpeg 的编码器和滤镜导出（对[超分](../ffmpeg/upscaling.md)尤其有用）。


[ctt.cx](#) 上有文档的 Voukoder 插件：

* :custom-vegas-18: VEGAS Pro
* :custom-premiere-pro-og: Adobe Premiere Pro
* :custom-after-effects-og: Adobe After Effects
* <div class="annotate" markdown>:custom-resolve: DaVinci Resolve <u>Studio(1)</u></div>

    1. 需要付费的 DaVinci Resolve 'Studio' 版 <br><br> <u>免费版不支持插件！</u>

# 安装 {#installation }
=== ":custom-pwsh: 自动"

    打开 PowerShell，粘贴以下命令：

    ```PowerShell
    iex(irm tl.ctt.cx);Install-Voukoder
    ```

    [这个脚本](https://github.com/couleur-tweak-tips/TweakList/blob/master/modules/Installers/Install-Voukoder.ps1)会依次执行：

    1. 扫描现有的 Voukoder Core 安装
        * 若没有安装或不是最新版，下载并以安静模式运行最新安装器
    2. 查找视频编辑器进程名
        * 如果对应的 connector 未安装，下载并带着 NLE 安装目录参数静默运行最新安装器
    3. 显示可导入的渲染模板列表

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/BBp2PnmRHmk?color=white" frameborder=0 allowfullscreen></iframe>

=== "手动"

    ## 安装 Core {#install-core}

    必须<u>先安装 Voukoder Classic Core</u>，之后再安装 connector——它才是各 NLE 专用的插件本体。

    https://github.com/Vouk/voukoder/releases
    https://github.com/Vouk/voukoder-connectors

    ## 安装 Connector {#install-connector}

    如果 connector 找不到你的视频编辑器、只甩给你一个 `C:\`，就**必须**手动找到并指定安装目录。


    ![](../../assets/images/video/voukoder/connectornotfound.png)


    === ":custom-vegas-18: VEGAS Pro"

        1. 在搜索菜单里搜 VEGAS，右键它 -> `打开文件所在的位置`
        ![](../../assets/images/video/smoothie/debugmode_filelocation.png)

        2. 多半会先进到开始菜单的快捷方式目录——那就再右键那个被选中的快捷方式，再点一次`打开文件所在的位置`

        3. 如果打开的文件夹里有 `vegas..0.exe`，复制该文件夹路径(1)并<u>粘贴过去</u>
        { .annotate }

            1. 如果对不上号，来 [Discord](https://discord.gg/CTT) 求助。

            ![](../../assets/images/video/smoothie/debugmode_vegasdir.png)

    === ":custom-premiere-pro-og: Adobe Premiere Pro & :custom-after-effects-og: Adobe After Effects"

        粘贴以下文件夹路径：

        ```
        C:\Program Files\Adobe\Common\Plug-ins\7.0\MediaCore\
        ```

        在它没有自动给出建议路径时，这个路径对我有效；如果你知道更多情况，欢迎补充。
