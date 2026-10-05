---
icon: simple/linux
---

更多调教技巧见 [CTT](https://discord.gg/CTT) 的 [`#🐧 linux-dump`](https://discord.com/channels/774315187183288411/941026388201320508) 频道。

* :star: [explainshell.com](https://explainshell.com/)：逐命令、逐参数讲解
* [comfig 的 Linux 性能指南](https://docs.comfig.app/latest/os/linux/)
* [dec05eba 的 gpu-screen-recorder](https://git.dec05eba.com/gpu-screen-recorder/about/)：高性能录屏
* [areweanticheatyet](https://areweanticheatyet.com)：哪些游戏在 Linux 上能玩、哪些不能的清单
* [linuxatemyram](https://www.linuxatemyram.com)：澄清“Linux 吃光我内存”的误解
* [nvidia-patch](https://github.com/keylase/nvidia-patch)：解除 NVIDIA 对消费级显卡 NVENC 同时编码会话数的限制
* [ntfs-3g](https://wiki.archlinux.org/title/NTFS-3G) 和 [ntfs-3g-compression-git](https://aur.archlinux.org/packages?O=0&K=ntfs-3g-system-compression-git)：读取压缩 NTFS 磁盘上的文件有困难时用
* 自托管教程 <https://landchad.net>
* <https://docs.comfig.app/latest/os/linux>——一些 Linux 优化


## 关闭双击防抖（he3als 提供） {#disabling-double-click-prevention-by-he3als }
在 libinput 中禁用（对所有鼠标生效，但仍受鼠标固件限制）：
```sh
sudo mkdir /etc/libinput/; sudo nano /etc/libinput/local-overrides.quirks
```
然后在 `nano` 中写入以下内容，保存，关闭终端，重新登录：
```ini
[Never Debounce]
MatchUdevType=mouse
ModelBouncingKeys=1
```
## 外设相关资源 {#peripherals-related-resources }
* [OpenRazer](https://openrazer.github.io/)：Linux 上的雷蛇 Synapse 替代品
* [Glorious 有线鼠标工具](https://github.com/enkore/gloriousctl)：（跑 `make` 简单编译，可设防抖毫秒数）
* [Glorious 无线鼠标工具](https://github.com/korkje/mow)：（编译说明在 `README.md`，可设防抖毫秒数）
