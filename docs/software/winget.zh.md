---
icon: material/package-down
---

# [Winget](https://learn.microsoft.com/en-us/windows/package-manager/) {#winget }
微软的 Windows 命令行包管理器。

- 与 Scoop 不同（和 Chocolatey 类似），应用会装到它们的常规安装位置
- 全部可用应用托管在 GitHub 的 `microsoft/winget-pkgs` 仓库
- 支持从 Microsoft Store 直接下载安装

所有 Windows 11 和较新版本 Windows 10 都会预装它。如果你没有，可以从 Microsoft Store 装一个 [App Installer](https://www.microsoft.com/p/app-installer/9nblggh4nns1)。

如果出于某种原因没装上，运行：
```powershell
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery -Scope AllUsers | Out-Null
Repair-WinGetPackageManager
```
如果之前卸载过，可以用这个找回来：
```powershell
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
```

应用更新可能偏慢——要走审核人员的人工核验。如果你喜欢的应用没上架或一直没更新，可以用 [Komac](https://github.com/russellbanks/Komac) 或 [WingetCreate](https://github.com/microsoft/winget-create) 这类小工具帮维护者减负。


!!! tip "没搜到你要的？"

    应用更新可能偏慢——要走审核人员的人工核验。如果你喜欢的应用没上架或一直没更新，可以用 [Komac] 或 [WingetCreate] 这类小工具。

   [Komac]: https://github.com/russellbanks/Komac
   [WingetCreate]: https://github.com/microsoft/winget-create


## [winget.app](https://winstall.app/) {#wingetapp }
这个对新手友好的网站让你勾选想装的软件，然后给你拼好一条命令，粘进 cmd 就完事。

### 仓库： {#repos }
* [winget CLI 工具](https://github.com/microsoft/winget-cli)（许可证：MIT）
* [winget 软件包（manifests）](https://github.com/microsoft/winget-pkgs)，要到 /manifests/ 里往下钻，[这是个例子](https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/Microsoft/PowerShell/7.3.8.0)

更多信息可读微软的[官方文档](https://learn.microsoft.com/en-us/windows/package-manager/winget/)。
