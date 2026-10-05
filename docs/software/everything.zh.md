---
description: voidtools Everything 的调教与技巧
icon: custom/everything-alpha
---

# :custom-everything-alpha: Everything {#everything }
voidtools Everything 是一款免费软件，为磁盘上每一个文件和文件夹建立索引，找东西快得跟上你的打字速度。

它的过滤能力极强——按文件大小、按修改日期、按视频帧率，也可以按过滤器组（例如所有视频扩展名的文件）。

![](../assets/images/software/everything/everything-hero.png)

# 安装 {#installation }
在这里获取持续更新的 Everything 1.5a：

<https://www.voidtools.com/everything-1.5a>

（往下滚动可以看到与 1.4 相比的新特性）

也可用 [Scoop](https://github.com/ScoopInstaller/Versions/blob/master/bucket/everything-alpha.json) 安装：

```PowerShell
scoop.cmd bucket add versions
scoop install versions/everything-alpha
```

以及 [winget](https://github.com/microsoft/winget-pkgs/tree/master/manifests/v/voidtools/Everything/Alpha)：

```PowerShell
winget install -e --id voidtools.Everything.Alpha
```

Linux 用户可以看看替代品 [FSearch](https://alternativeto.net/software/fsearch/about)。

## 搜索示例 {#search-examples }
本世纪你截的所有 Minecraft 截图：
```
20??-??-??_??.??.??.png
```

某个文件夹下的全部 MP4（递归）：
```
path:D:/Vids *.mp4
```

`*` 是匹配任意字符的通配符，`*.mp4` 指所有以 .mp4 结尾的文件。

`?` 是匹配单个字符的通配符，如 `?.png` 指文件名只有一个字符的 png，如 `a.png`。

练熟了之后，你可以毫不费力地找到系统上的任何东西。

更多参考：<https://www.voidtools.com/support/everything/searching>

## 配置界面 {#setting-up-the-ui }
每次想搜索都要手动打开一个第三方应用很不方便——

1. 在 `Tools -> Options... (CTRL+P)` 的 `General -> Keyboard` 里可以设置一个名为 `Toggle Window Hotkey` 的快捷键。我多年用 <kbd>CTRL+SHIFT+E</kbd>——它真的能把 Everything 从“花架子”变成“必需品”。

2. 按 `ALT+P` 可开关当前选中文件的预览。

3. 在 `View` 里可以启用 `Filters`，它会显示文件类型列表（图片、音频、视频、文档等），本质上是搜索预设——按住 <kbd>CTRL</kbd> 可以多选，和选文件一样。

    我自己做了一个叫 `Dev` 的过滤器，搜索值为 `ext:ps1;cmd;rs;json;js`，用来框住 git 仓库里我打交道的所有文件。

4. 右键任意列名可以添加更多列来扩展排序选项：

    ![](../assets/images/software/everything/metadata-sort.png)
