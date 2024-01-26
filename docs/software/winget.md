# [Winget](https://learn.microsoft.com/en-us/windows/package-manager/)

Microsoft' command-line package manager for Windows
- unlike scoop (and like Chocolatey), apps install in their normal location
- All available apps can be found in the `microsoft/winget-pkgs` repo on GitHub
- Supports downloading and installing straight from Microsoft store

The tool is preinstalled on all versions of Windows 11 and somewhat newer versions of Windows 10. If you are on either and don't have it, you can get it by getting [App Installer](https://www.microsoft.com/p/app-installer/9nblggh4nns1) from the Microsoft Store.


I don't use it much so I'll just recommend you reading the [MS docs](https://learn.microsoft.com/en-us/windows/package-manager/winget/)

## [winget.app](https://winstall.app/)

This noob-friendly lets you pick software to install and builds up a command for you to simply paste in cmd.

### Repos:
* [winget CLI tool](https://github.com/microsoft/winget-cli) (License: MIT)
* [winget packages (manifests)](https://github.com/microsoft/winget-pkgs) you need to drill down in /manifests/, [here's an example](https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/Microsoft/PowerShell/7.3.8.0)

PR if you have relevant knowledge to add here 👍
