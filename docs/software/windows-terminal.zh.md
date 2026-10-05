---
icon: custom/windowsterminal
---
# :custom-windowsterminal: Windows Terminal {#windows-terminal }
Windows 命令提示符 / 控制台宿主（conhost.exe）的现代继任者。

主要新特性：

* [多标签页](https://learn.microsoft.com/en-us/windows/terminal/tips-and-tricks#color-a-tab)
* [Quake 模式](https://learn.microsoft.com/en-us/windows/terminal/tips-and-tricks#quake-mode)：一个快捷键就能让 wt 唤出/收起

多标签页对折腾脚本的人特友好——不然桌面总会散落一堆 conhost 窗口。


## :octicons-download-16: 下载 {#download }
* :simple-github: [microsoft/terminal](https://github.com/microsoft/terminal/releases)（安装器选 .msixbundle）
* [:bucket:](https://github.com/ScoopInstaller/Extras/blob/master/bucket/windows-terminal.json) [Scoop](https://scoop.sh)：`scoop install extras/windows-terminal`
* [:package:](https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/Microsoft/WindowsTerminal) [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)：`winget install Microsoft.WindowsTerminal`

![](/assets/images/software/windows-terminal/wt-preview.png)

## 其他技巧 {#miscellaneous-tips }
* 想甩掉版权信息（新 shell 顶部永远那一两行）？在你的配置文件命令行参数里加 `-NoLogo` 即可，[更多 PowerShell 参数](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameters)。
