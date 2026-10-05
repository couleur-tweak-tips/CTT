---
icon: material/folder-zip
---

# 软件 {#programs }
本区是我在用且我爱的软件精选清单。

想看更多？墙裂推荐翻一翻 FMHY 的各式[工具列表](https://fmhy.net/system-tools)。


## 荣誉提名： {#honorable-mentions }
我用过，或别人向我推荐过的：

* [DeepL](https://www.deepl.com/en/translator)：精准翻译器
    * 有网页版和客户端；用客户端的话按两次 ctrl+c 就能直接唤起并自动把剪贴板送进去翻译
* 帧数基准测试：用 [PresentMon](https://github.com/GameTechDev/PresentMon) 配合 [CapFrameX](https://www.capframex.com/)，或直接用 [Frame Time Analysis](https://boringboredom.github.io/Frame-Time-Analysis/) 画图
    * 我之前用它时写的 PowerShell 脚本：
        ```ps1
        $T = Get-Date

        $CSV = "C:\PresentMon\PM-$Process $($T.Date -replace ' 00:00:00','' -replace '/','_') @ $($T.Hour).$($T.Minute).csv"

        @('javaw','r5apex','VALORANT')
        ForEach-Object {
            if (Get-Process -Name $_ -Ea Ignore){
                $script:ID = (Get-Process $_).ID
                break
            }
        }

        sudo PresentMon.exe -process_id $ID -output_file $CSV -hotkey 'ALT+SHIFT+X' -timed 15
        ```
* [Nirsoft](https://www.nirsoft.net/) 与 [Sysinternals](https://learn.microsoft.com/en-us/sysinternals/) 的 NT 软件工具箱
    * Open With View：清掉你从不用来打开文件、却把右键菜单撑得老长的程序（另见 [ContextMenuManager](https://github.com/BluePointLilac/ContextMenuManager)）
    * RegistryChangesView：创建注册表快照，对比程序（比如安装时）在你电脑上写了什么，另见 [ProcMon](https://learn.microsoft.com/en-us/sysinternals/downloads/procmon)
    * ShellExView：禁用自定义 shell 扩展（TeraCopy、QTTabBar、Visual Studio 之类）
* [linkshellextension](https://schinagl.priv.at/nt/hardlinkshellext/linkshellextension.html)：轻松创建文件系统链接（也可以用 PowerShell 的 `New-Item -ItemType SymbolicLink -Path ./original -Target ./link`）
* [Zellij](https://github.com/zellij-org/zellij)：新潮的 tmux 替代品
* [Playit.gg](https://playit.gg) / [Minekube](https://connect.minekube.com/)：不动路由器端口就能做端口转发/隧道的程序，自架 Minecraft 服务器时很有用
