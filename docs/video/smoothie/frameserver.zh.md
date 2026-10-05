---
description: 安装与配置 DebugMode frameserver，供 blur/Smoothie 使用
icon: material/server-network
---

# 从 NLE 导出到 Smoothie


!!! warning "不适合大多数人"

    因为它可能非常慢，我不推荐大家用这条路——如果你有非常特殊的需求，可以试试看。

DebugMode FrameServer 让你的视频编辑器把项目导出为一个虚拟的未压缩 AVI 文件，blur 和 Smoothie 可以把它当作输入，等于变相地直接导出给它们。

它支持大多数 VEGAS 版本和 Premiere Pro。

:material-plus: 带来一个小众的便利：导入的素材不需要预先渲染

:material-minus: 用它渲染可能慢得令人发指

## 下载

到 [DebugMode 官网](https://www.debugmode.com/frameserver.html)下载。

# 安装

### 1. 接受[许可协议](https://www.gnu.org/licenses/gpl-3.0.html)
![许可协议](../../assets/images/video/smoothie/debugmode_license.png)

### 2. 勾选你拥有的视频编辑器

![许可协议](../../assets/images/video/smoothie/debugmode_plugins.png)

### 3. 填写 <u>DebugMode FrameServer</u> 的安装目录，保持默认即可：

![许可协议](../../assets/images/video/smoothie/debugmode_installdir.png)

!!! warning "请仔细阅读以下步骤"
    一路狂点“下一步”会把插件装进错误的目录。你**必须**手动复制你视频编辑器的安装路径。

### 4. 填写 <u>VEGAS Pro</u> 的安装目录，查找方法如下：

![](../../assets/images/video/smoothie/debugmode_vegasinstalldirprompt.png)


在搜索菜单里搜 VEGAS，右键它 -> `打开文件所在的位置`
![](../../assets/images/video/smoothie/debugmode_filelocation.png)

多半会先进到开始菜单的快捷方式目录——那就再右键那个被选中的快捷方式，再点一次`打开文件所在的位置`。

如果打开的文件夹里有 `vegasXX0.exe`，复制该文件夹路径(1)粘贴过去。
{ .annotate }

1. 如果对不上号，来 [Discord](https://discord.gg/CTT) 求助。

![](../../assets/images/video/smoothie/debugmode_vegasdir.png)

### 5. 填写 <u>Adobe Premiere Pro</u> 的安装目录：

同上，对 Premiere Pro 做同样的操作。

### 6. 安装 Dokan

它会安装用于生成虚拟文件的 Dokan 库，<u>你不需要安装</u>可选的开发插件。

![](../../assets/images/video/smoothie/debugmode_dokandep.png)

### 7. 选择渲染模板

在 VEGAS 里你需要选一个音频码率。

![](../../assets/images/video/smoothie/debugmode_template.png)

VEGAS 默认是 48kHz（按 <kbd>CTRL+ENTER</kbd> 打开 Project Settings -> Audio 选项卡）。

### 8. 配置 Debugmode Frameserver

你需要拼一条命令，下面是拼装所需的全部知识。

如果你希望 Smoothie 跑完后窗口保持打开（比如崩溃时能来得及看报错），命令开头加上 `cmd /k `。

粘贴 smoothie-rs.exe 的路径：进入 Smoothie 的 `/bin/` 文件夹，<kbd>SHIFT+右键</kbd> `smoothie-rs.exe`，点 `Copy as path（复制路径）`。

如果终端一闪而过、出错也来不及看，或者这是你第一次配置，可以考虑在命令开头加上：
```
cmd /k
```

你需要进入 Smoothie 的 `/bin/` 文件夹，shift+右键 `smoothie-rs.exe` -> Copy as path（复制路径）并粘贴。

用 blur 的话，应该能在 `C:\Program files (x86)\blur` 找到 `blur-cli.exe`（旧版本叫 `blur.exe`）。


然后补上以下参数：

```
-i "%~1"
```

输出文件会出现在 `C:\CCFS\virtual`，建议在桌面/开始菜单放个快捷方式。


![](../../assets/images/video/smoothie/debugmode_gui.png)


几个示例：

```
cmd /k "D:\smrs\bin\smoothie-rs.exe" -i "%~1"
```
```
"C:\Program Files (x86)\blur\blur-cli.exe" -i "%~1"
```
