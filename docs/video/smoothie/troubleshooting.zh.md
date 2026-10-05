---
description: Smoothie 常见问题及解决方法
icon: material/lifebuoy
---

# 故障排除 {#troubleshooting }
排查问题时，请务必读完**整条报错信息**——多数时候，红字上方的那段文字才是在解释问题所在。

这里列了一些常见错误和解决办法：

#### `ffmpeg.exe is not installed/in PATH, ensure FFmpeg is installed` {#ffmpeg-not-found }

:   你需要 [ffmpeg](../ffmpeg/index.md#installation)，见 [Smoothie 的依赖](./installation.md#dependencies)


#### `*Smoothie crashing before any error can be read*` {#smoothie-instant-crash }

:   用 `launch.cmd` 启动 Smoothie 并选择视频，这样窗口会停住，你就有时间读报错。如果根本没有报错信息，那多半是你的 Send to 快捷方式有问题</ins>。

#### `Unrecognized option 'stats_period'` {#no-stats-period }

:   从 `recipe.ini` 的 `[miscellaneous] ffmpeg options:` 中删掉 `-stats_period 0.15`——你的 ffmpeg 版本太旧，不支持比默认更快地刷新统计信息（`size=     907KiB time=00:00:57.99 bitrate= 128.1kbits/s speed=68.6x` 这类输出）。

#### `Smoothie Recipe parser: setting XYZ has no parent category` {#recipe-parse-error }

:   仔细检查配方文件的语法。确认你用的不是旧版 [smoothie-py](https://github.com/couleur-tweak-tips/Smoothie) 或 [blur](https://github.com/f0e/blur) 的配置。


#### `No valid videos were passed to smoothie` {#no-valid-videos }

:   这意味着它收到的所有输入文件都不是有效的视频文件，确认它们没有损坏、不是空文件（0 字节）。

#### `'X' is not an official yuv4mpegpipe pixel format`  {#invalid-yuv4mpeg-pixel-format }

:   你的视频录制时使用的色彩格式不被 SVPFlow（补帧算法）支持。把视频转换成受支持的格式（NV12），或者干脆不用补帧（或改用预补帧）。

#### `VapourSynth Resize error 3074: no path between colorspaces (2/2/2 => 0/2/2)` {#resize-error }

:   这是 [RIFE 预补帧](./recipe.md#pre-interp)时视频色彩转换不兼容导致的，试着调整 OBS 的高级色彩设置，看看哪种组合能用。

#### `FFmpeg encoding error: Driver does not support the required nvenc API version.` {#nvenc-driver-version-error }

:   更新你的 NVIDIA 显卡驱动，或者改用其他编码参数，比如 H264/5 CPU、UTVideo。

#### `Python exception: Source: The index does not match the source file`  {#source-index-mismatch }

:   确认视频路径里没有非英文的特殊字符。问题可能就出在文件名上，试试重命名。

#### `Warning: Failed to load [...]\smoothie-rs\bin\vapoursynth64\plugins\librife.dll. GetLastError() returned 126. The file you tried to load or one of its dependencies is probably missing.` {#warning-failed-to-load-smoothie-rsbinvapoursynth64pluginslibrifedll-getlasterror-returned-126-the-file-you-tried-to-load-or-one-of-its-dependencies-is-probably-missing }
:   你在虚拟机里运行，或者没装 Vulkan 运行库。

### 错误依旧存在，或不在这份列表里 {#the-error-is-persisting-or-not-listed-here }
:   请[到我们的 Discord 发帖求助](https://discord.gg/CTT)，或[联系我](../../contact.md#couleur)

<br>

感谢 [z1xus 和 gem-storm](https://github.com/gem-storm/smrs-guide)，本页大部分内容基于他们的整理
