---
icon: custom/windowsterminal
---
# :custom-windowsterminal: Windows Terminal

Modern version of the Windows command prompt / console host (conhost.exe).

It has the main extra features:

* [Tabs](https://learn.microsoft.com/en-us/windows/terminal/tips-and-tricks#color-a-tab)
* [Quake mode](https://learn.microsoft.com/en-us/windows/terminal/tips-and-tricks#quake-mode) lets you make wt appear and disappear with a keyboard shortcut

Tabs are especially useful for people that are experimenting with scripts and end up with a bunch of conhost windows scattered around.


## :octicons-download-16: Download
* :simple-github: [microsoft/terminal](https://github.com/microsoft/terminal/releases) (get the .msixbundle for an installer)
* [:bucket:](https://github.com/ScoopInstaller/Extras/blob/master/bucket/windows-terminal.json) [Scoop](https://scoop.sh): `scoop install extras/windows-terminal`
* [:package:](https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/Microsoft/WindowsTerminal) [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/): `winget install Microsoft.WindowsTerminal`

![](/assets/images/software/windows-terminal/wt-preview.png)

## Miscellaneous tips

* You can remove the copyright notice (the one or two lines always appearing at the top of your newly-opened shell) by adding `-NoLogo` to the command line arguments of your profile settings, [see more PowerShell arguments](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameters)