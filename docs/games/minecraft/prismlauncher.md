---
icon: custom/prismlauncher
---

# PrismLauncher

This launcher lets you manage multiple "instances", which have the functionality of multiple `.minecraft` folders,

* Minecraft accounts are managed globally and can be selected before launching an instance
    * As of writing there is no in-game mods that allow you to switch accounts in game, might be because of some of [these reasons](https://github.com/The-Fireplace-Minecraft-Mods/In-Game-Account-Switcher/issues/162#issuecomment-2495917557)
* You can specify a java runtime environment, ram usage and jvm arguments per instance
    * Since [9.0](https://github.com/PrismLauncher/PrismLauncher/releases/tag/9.0) there is now an Automatic Java Management option to easily download JREs
* assets, libraries, logs, mods, saves,  screenshots, resourcepacks, assets, config files.. everything is separate

* :octicons-download-16: <https://prismlauncher.org/download>
* :material-web: <https://prismlauncher.org>
* :simple-github: <https://github.com/PrismLauncher/PrismLauncher>

## Modpacks

You can install and update individual mods, resourcepacks, shaders and modpacks from :simple-modrinth:{.mr} [Modrinth](https://modrinth.com/) and :simple-curseforge: [CurseForge](https://www.curseforge.com/)

I recommend checking out my [simple-mod-pack](https://modrinth.com/project/simple-mod-pack) if you're looking for a 1.21.4 Fabric modpack, I tried combining mods and config options from every performance modpack I could find and added various quality of life mods, whilst keeping too opinionated settings disabled (you can re-enable them in the mod list).


## Sharing instance subfolders across multiple instances

Let's say you have multiple instances and a single resourcepacks folder, how can these instances all use the same folder without making copies?

Symbolic links let you do that, you can think of them as a shortcut to a folder that's somewhere else.

You can find the instance's folder path by right clicking it and clicking "folder", which will open it in your system explorer, then you open the `.minecraft` folder, then the subfolder you want to turn into a symlink, after that copy the path (`CTRL+L` + `CTRL+C`), back up files in it/put them somewhere else, go up a directory and delete the folder so you can create a symlink with the same name.

You can create a symlink with the following PowerShell command, the first path provided is where your subfolder actually is, and the second is where to place the symlink.

```ps1
New-Item -ItemType SymbolicLink "$env:APPDATA\.minecraft\resourcepacks" "$env:APPDATA\PrismLauncher\instances\1.21.4\.minecraft\resourcepacks"
```

`$env:APPDATA` is the equivalent of `%APPDATA%` in PowerShell
