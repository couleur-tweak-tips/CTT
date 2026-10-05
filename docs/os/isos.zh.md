---
icon: material/harddisk-plus
---

# ISO 镜像 {#isos }
## 0. 备份数据 {#0-backing-up-data }
如果你准备装系统、打算抹掉磁盘，先去这些地方翻翻有没有落下的东西：

* .minecraft 文件夹和 Prism/MultiMC 实例——里面有截图、日志、资源包……
* 浏览器历史记录、书签、扩展列表
* 你深度调教过的程序的配置文件


## 1. 获取 ISO {#1-obtaining-an-iso }
=== "Windows"

    * [Fido](https://github.com/pbatard/Fido)
    * [AveYo/MediaCreationTool.bat](https://github.com/AveYo/MediaCreationTool.bat)

    * [msdl.gravesoft.dev](https://msdl.gravesoft.dev/)
    * [massgrave.dev/windows_10_links](https://massgrave.dev/windows_10_links)
    * [massgrave.dev/windows_11_links](https://massgrave.dev/windows_11_links)

    * [微软官网的 Win10](https://www.microsoft.com/en-us/software-download/windows10)
    * [微软官网的 Win11](https://www.microsoft.com/en-us/software-download/windows11)

    * [Atlas Docs 的 ISO 下载器](https://docs.atlasos.net/getting-started/installation/#1-download-an-iso)

    * [files.rg-adguard.net](https://files.rg-adguard.net/version/f0bd8307-d897-ef77-dbd6-216fefbe94c5)
    <!-- * <https://os.click/en/Windows> -->

=== "Linux"


    * <https://wiki.archlinux.org/title/Installation_guide>
        * <https://endeavouros.com/>
        * <https://cachyos.org/download/>
    * <https://fedoraproject.org/>
        * <https://bazzite.gg/>
    * <https://nixos.org/manual/nixos/stable/>
    * <https://www.debian.org/releases/stable/amd64/>
        * <https://ubuntu.com/tutorials/install-ubuntu-desktop>
    * <https://nixos.org/download/#nixos-iso>
    * <https://www.gentoo.org/get-started>

## 2. 制作安装介质 {#2-flashing-the-installation-media }
* [Rufus](https://rufus.ie/en/)——可以预调一些 Windows 安装设置
* [balenaEtcher](https://etcher.balena.io)——以[我](/contact.md#couleur)的经验，刷 Linux 镜像更稳
* [Ventoy](https://ventoy.net)——一个盘放多个 ISO（直接把文件拖进分区），开机时选择从哪个启动

## 3. 从安装介质启动 {#3-booting-the-installation-media }
见 <https://www.revi.cc/docs/playbook/installwindows/#boot-from-the-usb-drive>

## 4. 指南 {#4-guides }
* :flag_fr: <https://www.installerwindows.fr>
* <https://gravesoft.dev/clean_install_windows>——massgravel 团队出品
* <https://www.revi.cc/docs/post-install> ReviOS
* <https://docs.atlasos.net/getting-started/installation> AtlasOS
