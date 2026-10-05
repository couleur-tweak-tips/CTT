---
icon: custom/scoop
---
# [Scoop](https://scoop.sh/) {#scoop }
Windows 上的命令行程序安装器。

* 不像 Chocolatey，它不要求管理员权限。
* 不像 Winget，你可以安装[自己的程序仓库](https://github.com/ScoopInstaller/Scoop/wiki/Buckets)。
* 所有应用都放在 `%USERPROFILE%\Scoop`{ data-clipboard-text="%USERPROFILE%\Scoop" } 文件夹里（默认如此，我建议[装在第二块盘上](https://github.com/ScoopInstaller/Install#advanced-installation)）
* 你装的软件都是便携形态（以 -np 结尾的除外，**n**on **p**ortable）

安装只要往 PowerShell 里粘一行：
```PowerShell
irm get.scoop.sh | iex
```
这会请求一个跳转到 GitHub 上[Scoop 安装脚本](https://raw.githubusercontent.com/scoopinstaller/install/master/install.ps1)最新版的链接，`| iex` 负责执行它。

你也可以把脚本存到磁盘上再正常运行。

## 基于 Git 的软件清单 {#git-based-manifests }
每份清单记录着下载并安装某程序最新版所需的信息，以 [JSON 文件](https://github.com/ScoopInstaller/Main/blob/master/bucket/curl.json)的形式存放在 [Git 仓库](https://github.com/ScoopInstaller/Extras/tree/master/bucket)（称为 bucket）中，可以在 [Scoop 官网](https://scoop.sh/#/apps?q=curl)上浏览检索。

它是开放标准——你可以做自己的 bucket，比如添加我的：

#### （需要 git 来克隆仓库、拉取更新） {#youll-need-git-to-clone-the-repo-and-pull-new-updates }
```PowerShell
scoop install git
```
"utils" 是它在你电脑上的名字：
```PowerShell
scoop bucket add utils https://github.com/couleur-tweak-tips/utils
```
想确保从正确的 bucket 安装、避开同名包，可以指定 bucket 名：
```PowerShell
scoop install utils/utvideo
```

`scoop update`{ data-clipboard-text="scoop update" } 会对所有 bucket 执行 `git pull`{ data-clipboard-text="git pull" } 并列出变更。

`scoop update <app> <app2>`{ data-clipboard-text="scoop update " } 更新指定应用，`scoop update *`{ data-clipboard-text=scoop update" } 检查全部应用。


## 会自动更新的应用 {#auto-updating-apps }
以下应用自带自动更新，会弄乱 Scoop 的更新体系：

* 所有基于 Chromium 的应用与浏览器
    * Discord
    * Visual Studio Code
* Heroic Games Launcher
* Telegram（不是 Chromium，但也有自动更新）

可以用 `scoop hold <app>`{ data-clipboard-text="scoop hold " } 来*“锁定应用、禁用更新”*。
