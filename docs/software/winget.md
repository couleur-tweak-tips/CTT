# [Winget](https://learn.microsoft.com/en-us/windows/package-manager/)

Microsoft' command-line package manager for Windows
- unlike scoop (and like Chocolatey), apps install in their normal location
- All available apps can be found in the `microsoft/winget-pkgs` repo on GitHub
- Supports downloading and installing straight from Microsoft store

The tool is preinstalled on all versions of Windows 11 and somewhat newer versions of Windows 10. If you are on either and don't have it, you can get it by getting [App Installer](https://www.microsoft.com/p/app-installer/9nblggh4nns1) from the Microsoft Store.

If for some reason you don't have it installed, run the following:
```powershell
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery -Scope AllUsers | Out-Null
Repair-WinGetPackageManager
```
If you uninstalled it before, you can bring it back with this:
```powershell
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
```

Updating apps can be somewhat slow due to the manual verification from the moderators. If your favourite app isn't available or hasn't been updated, you can use simple tools like [Komac](https://github.com/russellbanks/Komac) or [WingetCreate](https://github.com/microsoft/winget-create) to make updating easier for the winget moderators


!!! tip "Don't see what you want?"

    Updating apps can be somewhat slow due to the manual verification from the moderators. If your favourite app isn't available or hasn't been updated, you can use simple tools like [Komac] or [WingetCreate].

   [Komac]: https://github.com/russellbanks/Komac
   [WingetCreate]: https://github.com/microsoft/winget-create


## [winget.app](https://winstall.app/)

This noob-friendly lets you pick software to install and builds up a command for you to simply paste in cmd.

### Repos:
* [winget CLI tool](https://github.com/microsoft/winget-cli) (License: MIT)
* [winget packages (manifests)](https://github.com/microsoft/winget-pkgs) you need to drill down in /manifests/, [here's an example](https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/Microsoft/PowerShell/7.3.8.0)

For more info you can read Microsoft's documentation [here](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
