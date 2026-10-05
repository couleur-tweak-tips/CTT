---
icon: material/map-plus
---

## EarTrumpet {#eartrumpet }
<!-- YES im full aware the link and emotes are all over the place -->

一键唤出的 Windows 音量混音器

* :simple-github: [File-New-Project/EarTrumpet](https://github.com/File-New-Project/EarTrumpet)（安装器选 .msixbundle）
* [:bucket:](https://github.com/ScoopInstaller/Extras/blob/master/bucket/eartrumpet.json) [Scoop](https://scoop.sh)：`scoop install extras/eartrumpet`
* [:package:](https://github.com/microsoft/winget-pkgs/tree/master/manifests/f/File-New-Project/EarTrumpet) [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)：`winget install File-New-Project.EarTrumpet`
* :custom-chocolatey: [Choco](https://community.chocolatey.org/packages/eartrumpet/)：`choco install eartrumpet -y`


你可以在任务栏设置 -> “打开或关闭系统图标”里关掉旧的音量控件

![](/assets/images/software/eartrumpet.gif)


## PowerToys {#powertoys }
把[一大串小而美的实用工具](https://learn.microsoft.com/en-us/windows/powertoys/#current-powertoy-utilities)打包在一起的程序，值得一提的有：

* Always On Top（置顶）：<kbd>Win+Ctrl+T</kbd> 让当前窗口置顶
* FancyZones：为每个显示器预设窗口布局，开始拖动窗口、按住 SHIFT，把它放进想要的区域即可
* Color Picker（取色器）：Win+Shift+C，光标秒变取色器
* File Locksmith：文件被占用、不知道是谁干的？右键文件选 File Locksmith 一查便知


* :package: ``winget install Microsoft PowerToys``
* :custom-chocolatey: [Chocolatey](https://community.chocolatey.org/packages/powertoys)：`choco install powertoys -y`

![](/assets/images/software/powertoys.webp)

## OpenRGB {#openrgb }
在一个不臃肿、不用登录的程序里统一管理你 PC 上所有硬件的 RGB（我只在开机时用它加载一套全灭配色）。

* :memo: [兼容组件/外设列表](https://gitlab.com/CalcProgrammer1/OpenRGB/-/wikis/Supported-Devices)
* :material-web: [openrgb.org](https://openrgb.org/index.html)
* :bucket: `scoop.cmd install extras/openrgb`
* :simple-archlinux:{ .archblue } AUR 里的 [openrgb-bin](https://aur.archlinux.org/packages/openrgb-bin)
* :package: ``winget install CalcProgrammer1.OpenRGB``
* :custom-chocolatey: [Chocolatey](https://community.chocolatey.org/packages/openrgb)：`choco install openrgb -y`


![](/assets/images/software/openrgb.webp)

## :simple-sharex: ShareX {#sharex }
录屏/截屏（全屏、窗口、区域任选），加批注、打码、贴表情，然后复制到剪贴板/上传/存到指定位置。

* :material-web: [getsharex.com](https://getsharex.com/)
* :bucket: `scoop install sharex`
* :package: `winget install ShareX.ShareX`
* :custom-chocolatey: [Chocolatey](https://community.chocolatey.org/packages/sharex)：`choco install sharex -y`

![](/assets/images/software/sharex.png)

## Notepad Replacer {#notepad-replacer }
把所有试图启动 notepad.exe 的程序或文件关联重定向到你指定的编辑器。

* :material-web: [binaryfortress.com/NotepadReplacer](https://www.binaryfortress.com/NotepadReplacer/)

## Hotkey Resolution Changer {#hotkey-resolution-changer }
用 GUI 调分辨率，支持设置快捷键，也可以安静待在系统托盘。

* :material-web: [funk.eu/hrc](https://funk.eu/hrc)

![](/assets/images/software/hrc.jpg)

## AltSnap {#altsnap }
按住 ALT 就能在窗口上的任意位置拖动窗口，不必去够标题栏。

ALT+右键则从光标最近的边角方向缩放窗口。

* :simple-github: [RamomUnch/AltSnap](https://github.com/RamonUnch/AltSnap/releases)
* :bucket: `scoop.cmd install extras/altsnap`

## LittleBigMouse {#littlebigmouse }
* :octicons-desktop-download-16: 安装器 <https://github.com/mgth/LittleBigMouse/releases>
* :simple-github: 无许可证 <https://github.com/mgth/LittleBigMouse>
* 📚 Wiki <https://github.com/mgth/LittleBigMouse/wiki>
* :simple-youtube: 教程 <https://youtu.be/6D46stJMP68 >

修复分辨率、物理尺寸或对齐不一致的多显示器支持。

你应该懂那种感觉——光标从一台显示器移到另一台分辨率不同的显示器时，水平位置突然“错位”。

![](/assets/images/software/littlebigmouse.webp)
