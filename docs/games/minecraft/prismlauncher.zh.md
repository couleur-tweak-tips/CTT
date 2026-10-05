---
icon: custom/prismlauncher
---

# PrismLauncher {#prismlauncher }
这个启动器可以管理多个“实例”，相当于同时拥有多个 `.minecraft` 文件夹：

* Minecraft 账号全局管理，启动某个实例前再选择用哪个
    * 截至目前没有能在游戏内切换账号的模组，[这些原因](https://github.com/The-Fireplace-Minecraft-Mods/In-Game-Account-Switcher/issues/162#issuecomment-2495917557)或许能解释为什么
* 可以为每个实例单独指定 Java 运行环境、内存占用和 JVM 参数
    * 从 [9.0](https://github.com/PrismLauncher/PrismLauncher/releases/tag/9.0) 起新增了 Automatic Java Management（自动 Java 管理）选项，可以轻松下载 JRE
* assets、libraries、日志、模组、存档、截图、资源包、配置文件……全部分开

* :octicons-download-16: <https://prismlauncher.org/download>
* :material-web: <https://prismlauncher.org>
* :simple-github: <https://github.com/PrismLauncher/PrismLauncher>

## 整合包 {#modpacks }
可以从 :simple-modrinth:{.mr} [Modrinth](https://modrinth.com/) 和 :simple-curseforge: [CurseForge](https://www.curseforge.com/) 安装、更新单个模组、资源包、光影和整合包。

如果你在找 1.21.4 Fabric 整合包，推荐看看我的 [simple-mod-pack](https://modrinth.com/project/simple-mod-pack)：我把能找到的每个性能向整合包里的模组和配置项都揉了进来，再加上若干改善生活质量的模组，过于主观的默认项则保持关闭（你可以在模组列表里自行重新开启）。


## 在多个实例之间共享子文件夹 {#sharing-instance-subfolders-across-multiple-instances }
假设你有多个实例、但只有一个 resourcepacks 文件夹，怎么让这些实例不复制文件就共用同一个文件夹？

符号链接（symbolic link）可以做到——你可以把它理解成一个指向别处文件夹的快捷方式。

先找到实例的文件夹路径：右键实例，点“folder”，它会在系统资源管理器中打开；再进入 `.minecraft` 文件夹和要想改造成符号链接的子文件夹，复制路径（`CTRL+L` + `CTRL+C`），把里面的文件备份/挪到别处，返回上一级删掉这个文件夹，然后用同名创建一个符号链接。

可以用下面的 PowerShell 命令创建符号链接——第一个路径是子文件夹的实际位置，第二个是符号链接的放置位置：

```ps1
New-Item -ItemType SymbolicLink "$env:APPDATA\.minecraft\resourcepacks" "$env:APPDATA\PrismLauncher\instances\1.21.4\.minecraft\resourcepacks"
```

`$env:APPDATA` 就是 PowerShell 里的 `%APPDATA%`
