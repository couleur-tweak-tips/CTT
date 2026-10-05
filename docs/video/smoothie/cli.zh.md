---
description: Smoothie 各个 CLI 参数的说明
icon: octicons/terminal-16
---

# 命令行参数 {#command-line-arguments }
`-i/--input`：文件路径

:   指定输入视频文件路径，含空格时请加引号。

`-o/--output`：文件路径

:   指定<u>单个</u>输出视频的路径（`--input` 传了多个路径时不要用这个，改用 `--outdir`）。

`-t/--tui`：布尔

:   让 Smoothie 表现得像个应用程序而不是 CLI 工具（例如出错退出前会先暂停）。

`--outdir`：文件夹路径

:   为队列中的所有文件指定输出目录，会覆盖 [`[miscellaneous] global output folder:`](./recipe.md#miscellaneous)。

`--peek`：整数

:   把指定帧号渲染为图片文件——配方很慢时想先看看某一帧的效果，用它很方便。该值会同时传给 VSPipe 的 `--start` 和 `--end`，据我所知不会干扰任何时域滤镜。

`--vpy`：文件路径

:   覆盖默认使用的 VapourSynth Python 脚本（默认：jamba.vpy）。


`--stripaudio`：布尔

:   编码输出视频时不把音轨加回去。


`--tonull`：布尔

:   让 VSPipe 输出到 null（只是在参数里加 `.`，而不是把 Y4M 管道给 ffmpeg）。


`--tompv`：布尔

:   把 Y4M 输出重定向到 mpv，实现很简单：[直接尝试从 PATH 里找它](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/cmd.rs#L26)。

`--json`：字符串

:   [suckless-cut](https://github.com/couleur-tweak-tips/suckless-cut) 的裁剪时间码载荷，尚未完全从 smoothie-py 移植过来。


`--trim`、`--padding`：布尔

:   裁剪行为，尚未完全从 smoothie-py 移植过来。


`--rerun / -!!`：布尔

:   Smoothie 每次运行都会把所有参数转储到 `last_args.txt`。如果 Smoothie 崩溃了、而你之前传的一大串参数已经丢失，用这个参数把它们捞回来。灵感来自 bash 语法，如 `sudo !!`。

`--encargs`：字符串

:   覆盖 [`[output] enc args:`](./recipe.md#output)。

`-v/--verbose`：布尔

:   打印详细信息，适合调试 / 好奇宝宝。

<!-- --debug         Prints all the nerdy stuff to find bugs.NOT IMPLEMENTED YET -->


`-r/--recipe`：文件路径

:   指定配方路径，默认为 recipe.ini。


`--override`：字符串

:   覆盖任意配方设置，例如 `--override "flowblur;amount;40"`，可多次使用。
