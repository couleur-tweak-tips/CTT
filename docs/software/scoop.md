# [Scoop](https://scoop.sh/)

A command-line program installer for Windows

* unlike Chocolatey it does not require you to run it as admin.
* unlike Winget you can install your own programs
* All apps are contained in `%USERPROFILE%\Scoop`{ data-clipboard-text="%USERPROFILE%\Scoop" } folder (per default, I recommend [installing on a non-windows drive](https://github.com/ScoopInstaller/Install#advanced-installation))
* All software you install is in a portable factor (except the ones that end in -np, **n**on **p**ortable)

Installing it is as easy as pasting this in PowerShell:
```PowerShell
irm get.scoop.sh | iex
```
This makes a request to load a link which redirects to the latest version of [Scoop's installation script](https://raw.githubusercontent.com/scoopinstaller/install/master/install.ps1) hosted on GitHub and `| iex` executes it. 

You're free to save the file on your disk and run it normally.

## Git-based manifests

Each manifest contains information to download and install the latest version of a program, it's stored as a [JSON file](https://github.com/ScoopInstaller/Main/blob/master/bucket/curl.json) in [Git repositories](https://github.com/ScoopInstaller/Extras/tree/master/bucket) (called "buckets") and you can look through them on [Scoop's website](https://scoop.sh/#/apps?q=curl)

It's an open standard, which means you can make your own buckets, e.g to add mine:

#### (you'll need git to clone the repo and pull new updates)
```PowerShell
scoop install git
```
"utils" is the name of how it's gonna be called on your computer
```PowerShell
scoop bucket add utils https://github.com/couleur-tweak-tips/utils
```
If you want to be sure you install from the right bucket and avoid duplicates is to specify the bucket name like so:
```PowerShell
scoop install utils/utvideo
```

`scoop update`{ data-clipboard-text="scoop update" } will `git pull`{ data-clipboard-text="git pull" } through all bucket and log you the changes

`scoop update <app> <app2>`{ data-clipboard-text="scoop update " } will update specified app(s), and `scoop update *`{ data-clipboard-text=scoop update" } will check for every app


## Auto-updating apps

The following apps auto-update and mess with Scoop's update system:

* All chromium-based apps & browsers
    * Discord
    * Visual Studio Code
* Heroic Games Launcher
* Telegram (not chromium but it also has auto updates)

You can use `scoop hold <app>`{ data-clipboard-text="scoop hold " } to *"hold an app to disable updates"*
