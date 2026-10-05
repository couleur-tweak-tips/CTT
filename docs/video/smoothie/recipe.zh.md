---
description: Smoothie 配方（配置文件）说明
icon: simple/googlesearchconsole
---

# Smoothie 配方 {#smoothie-recipe }
配方（配置文件）是 Smoothie 学习曲线上最陡的部分——读完这篇，再拿几段短素材瞎折腾一下，是最好的上手方式。

开关型取值（布尔值）为了方便准备了一堆别名，建议直接简写 y/n 或 1/0。

如果有你用不到的功能，直接从文件里删掉对应节就行，不会弄坏任何东西，效果等同于禁用(1)。
{ .annotate }

1. Smoothie 会先加载 `defaults.ini`（和用户的 `recipe.ini` 结构相同，但所有功能都禁用 / 最大兼容），再用 `recipe.ini` 里已有的值覆盖它。

<br>

各文件的作用：

* [`recipe.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/recipe.ini)

:   默认配置文件，你要编辑的就是它。

* [`defaults.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/defaults.ini)

:   全部现有设置的备份，先被加载、再被 `recipe.ini` 覆盖，所以你可以删掉用不到的功能。


* [`encoding_presets.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini)

:   [output enc args](#output) 配方设置的预设配置文件。

    等号左边是你在配方里写的内容，等号右边是它传给 FFmpeg 参数时展开成的内容。

    没有任何硬编码，所以你可以修改这些预设，甚至创建自己的 FFmpeg 输出 CLI 预设。

* [`jamba.vpy`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/jamba.vpy)

:   Smoothie 使用的 [VapourSynth 脚本](https://www.vapoursynth.com/doc/gettingstarted.html#example-script)，你能读到每个配置值是如何被使用的。它摆在这里，意味着你完全可以往 `/bin/vapoursynth64/plugins/` 里装额外插件、自己接线配方原料。不过确实有一些[写死的配方校验](https://github.com/search?q=repo%3Acouleur-tweak-tips%2Fsmoothie-rs+path%3A*.rs+recipe.get&type=code)。

---

## :material-blur-linear: frame blending {#frame-blending }

`[frame blending]` 与 blur 的 `- blur` 配置分类、VEGAS 的 smart resampling、FFmpeg 的 `tmix` 滤镜是同类——但快得多。它把每一帧与相邻帧做平均，从而产生运动拖影，设置得当的话看起来就像真实的动态模糊。

<iframe width="688" height="387"  src="/assets/videos/video/smoothie/frameblending.mp4" frameborder=0></iframe>

左边是 240 FPS 视频，右边是帧混合后的 60 FPS 视频。这个例子不算好看，但能让你看清那些帧实际上是如何被压进更低 FPS 里的。


!!! note "在视频编辑器里对帧混合过的素材做 velocity"

    如果你习惯先把素材过一遍 Smoothie 再剪，可以把上面提到的设置这样调：

    把 `fps` 设为 120、180 或更高，看你想慢到什么程度

    按口味把 `blur intensity` 提到 2.5 甚至更高

    然后在编辑器里再做一次帧混合 / smart resampling

`enabled`：yes

:   是否启用本设置，禁用后本分类的其余设置都无所谓。

`fps`：60

:   输出帧率。它和 `intensity` 共同决定参与平均的相邻帧数量（权重），混合完成后视频会被限制到该帧率。

`intensity`：1.0

:   帧混合效果的强烈程度，等同于 blur 的 `blur amount`。

`weighting`：equal

:   “权重”指参与混合的每一帧，本选项改变各权重的不透明度。你可以手动写成 `[1.0, 1.0, 1.0, 1.0, 1.0]`，或者从[可用预设](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/weighting.py)中选：
    
    * `equal`
    * `vegas`：最接近 VEGAS Pro smart resampling 的权重（配合 1.0 intensity 时）
    * `gaussian`：上升高斯曲线
    * `gaussian_sym`：对称高斯曲线
    * `ascending`：我个人的最爱，喜欢配更高的 intensity
    * `descending`
    * `pyramid`：不透明度在中间达到峰值
    * `custom`：（极客向）任意 Python 表达式（[受限命名空间](https://github.com/couleur-tweak-tips/smoothie-rs/blob/f04526681aecf6564d5b83f5a7c8d35edeb8bf2f/target/scripts/weighting.py#L116-L144)），如 `custom; func = x**2`

    （同样是极客向）对 `gaussian`、`gaussian_sym` 和 `custom`，可以这样改 apex、bound 和标准差：
    `gaussian; apex = 2; bound = [0,2]; std_dev = 1`

    `equal` 与 `ascending` 的效果对比：

    <iframe width="297" height="313" src="/assets/videos/video/smoothie/weights.mp4" frameborder=0></iframe>

`bright blend`：no

:   让混合效果类似 Premiere Pro 的帧混合（褒义），相当于用叠加模式混合两张图片，比非 bright 模式慢。实现方式是在混合期间临时把素材转为 RGB48 色彩空间，鸣谢 Zaphyr。


## :material-select-multiple:  interpolation {#interpolation }

<div class="annotate" markdown>* 用运动估计的技巧在现有帧之间创造新帧，简直像魔法一样提升帧率。这样生成的帧并不完美，不可避免会产生我们所说的伪影——比如静态部分（HUD / 叠加层）的涂抹，低帧率输入下的快速运动也可能看起来一言难尽。Smoothie 中的“interpolation”由旧的免 DRM 版 [SVPFlow](https://github.com/couleurm/VSBundler/blob/main/smCi.ps1#L29) 完成，另见其 [wiki](https://www.svp-team.com/wiki/Manual:SVPflow)。</div>

建议以尽可能高的帧率录制（**至少 120 FPS** 才能拿到尚可的效果）。如果只用 SVPFlow 补帧，60 FPS 这类较低的帧率[往往比原始素材还难看](https://www.youtube.com/watch?v=QihBOhLzQj8)。


<iframe width="485" height="387"  src="/assets/videos/video/smoothie/interpolation.mp4" frameborder=0></iframe>


另见 [pre-interp](#pre-interp)——一种更慢但更准的补帧方式。


`enabled`：yes

:   是否启用本设置，禁用后本分类的其余设置都无所谓。

`masking`：yes

:   是否使用伪影遮罩。注意：如果伪影遮罩在它自己的分类中被禁用，本设置就不起作用。

`fps`：960

:   想补到的帧率。

`speed`：medium

:   决定补帧计算的精度，同时影响渲染速度。可用值：

    * `medium`（最准）
    * `fast`
    * `faster`
    * `fastest`（最不准）

`tuning`：weak

:   针对内容类型调整设置。引自 [InterFrame2 的文档](https://www.spirton.com/uploads/InterFrame/InterFrame2.html)：

    * `animation`——从没见有人在游戏画面上用过。
    * `film`——在单个运动物体的准确性与整帧的连贯性之间取得不错的平衡。
    * `smooth`——提升单个运动物体的准确性，降低整帧的连贯性。
    * `weak`——降低单个运动物体的准确性，提升整帧的连贯性。
        * 注意：这会大幅弱化补帧，即运动没那么顺滑了。

    多数人喜欢 `weak`，低帧率输入时有人偏爱 `film`。

`algorithm`：23

:   设置算法。同样引自上述文档：

    * `2`——预测激进，可能对卡通有用，但也容易留下大片伪影。
    * `13`——最聪明的算法，能遮掉许多伪影，但不如 23 顺滑。
    * `23`——最顺滑的算法，但没有 13 那样的伪影遮蔽。
    
    多数人用 23 / 13。

`block size`：auto

:   定义块匹配算法的块尺寸，可选 8x8、16x8、16x16、32x16 或 32x32。

    越大越快，但生成的帧越差。

    更多信息：<https://www.svp-team.com/wiki/Manual:SVPflow>（<kbd>CTRL+F</kbd> 搜 "`h: `" 查看相关说明）

`use gpu`：no

:   是否在使用 CPU 的同时使用 GPU（显卡）来加速转换并提升质量。
    出于兼容性默认关闭，但我建议打开。

    注意：这个模式可能跑得更慢——它算得更快的同时，也在做更复杂的计算来提升质量。

`area`：0

:   设置区域遮罩的强度，我建议保持 `0`。更高的值会减少伪影，但会大幅降低顺滑度。

## :material-motion: flowblur {#flowblur }

最容易拿来对比的是 Reel Smart Motion Blur（RSMB）。它产生的伪影往往比补帧还多（建议开伪影遮罩）。

`enabled`：no

:   是否启用本设置，禁用后本分类的其余设置都无所谓。

`masking`：yes

:   是否使用伪影遮罩。注意：如果伪影遮罩在它自己的分类中被禁用，本设置就不起作用。

`amount`：100

:   模糊强度，0 为无，200 为最大。

`do blending`：after

:   帧混合和 flowblur 的执行顺序：
    * `after`：更慢，先应用 flowblur 再做帧混合，想复刻 [Freeman's Mind 那种动态模糊](https://youtu.be/2Rtqm8U7CC8?t=89)就用它。
    * `before`：更快，最接近 RSMB，先帧混合再应用 flowblur。

## :material-play-box-outline: output {#output }

想知道编码过程会把渲染速度拖慢多少？试试 [`--tonull`](./cli.md)。

`process`：ffmpeg

:   FFmpeg 可执行文件的路径，默认直接尝试从 PATH 调用。如果配置了它的其他参数，你也可以换成任何能接受 STDIN 输入 YUV4MPEG 的 CLI 编码器。

`enc args`：H264 CPU

:   FFmpeg CLI 编码参数。为了方便你可以使用预设，全部存放在 [encoding_presets.ini](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini)。

    如果这些你一句都没看懂，建议读一读[<u>我该选哪种编解码器？</u>](../codecguide.md)。

    提示：在末尾加 `4K` 会展开成[把视频超分到 4K](../ffmpeg/upscaling.md)所需的参数。


`container`：MP4

:   视频容器格式，默认 MP4。

    要装 UTVideo 编解码器需要换成 .AVI 或 .MKV。
    
    用 .MKV 可以在渲染完成前就读取已渲染的部分。

`file format`：%FILENAME% ~ %FRUIT% %OUTPUT_FPS%

:   输出文件名格式，已指定 `-o` / `--output` 时不生效。

    * %FILENAME% 是输出文件的基础名（不含扩展名）

    * %FRUIT% 会展开成[这份清单](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/video.rs#L92-L101)里的随机水果名 😋

    * 配方的其他值也可以用，实现方式见[这里](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/video.rs#L140)

## :material-monitor-eye: preview window {#preview-window }

让 FFmpeg 把渲染好的视频实时输出给 ffplay——一个几乎总是随 FFmpeg 一起附带的视频播放器。

按 <kbd>F</kbd> 切换全屏，<kbd>空格</kbd> 暂停，<kbd>ESC</kbd> 或 <kbd>q</kbd> 退出。

关掉它不会导致崩溃，有时会弹个错误，但不影响视频渲染。

它还有一些杂项[键盘快捷键](https://ffmpeg.org/ffplay.html#While-playing)。

`enabled`：no

:   是否启用本设置，禁用后本分类的其余设置都无所谓。

`process`：ffplay

:   要管道输出的可执行文件路径。如果改用 mpv，渲染速度会被顶到实时上限（1.0x）。

`output args`：-f yuv4mpegpipe -

:   追加到 ffmpeg 参数中的额外参数，用于创建第二条输出流。ffplay 的参数可以在 [[miscellaneous]](#miscellaneous) 中修改。

## :fontawesome-regular-object-ungroup: artifact masking {#artifact-masking }

使用补帧、flowblur 或预补帧时，你可以选择用伪影遮罩让视频的特定区域不受这些效果影响。遮罩是黑白图像，黑色区域会回退掉施加的效果（还记得那些 `masking: yes` 吗？它们就是用来单独开关遮罩的）。

遮罩与分辨率绑定：1280x720 的视频配 1920x1080 的遮罩会让 Smoothie 崩溃。

<iframe width="688" height="387" src="https://www.youtube.com/embed/5GW2TUx78WY?start=20&color=white" frameborder=0 allowfullscreen></iframe>


`enabled`：no

:   伪影遮罩的全局开关，禁用后本分类的其余设置都无所谓。

`feathering`：yes

:   如果遮罩里有黑白之间的颜色（比如灰色渐变），打开它以支持：像素颜色越深，效果的不透明度越低。

`folder path`：默认为空，示例：D:\smrs\masks\

:   存放伪影遮罩图片的文件夹路径，对文件夹 shift+右键 -> Copy as path（复制路径）即可轻松获取。

`file name`：默认为空，示例：overwatch.png

:   要使用的遮罩图片文件名。

## :material-dots-horizontal: miscellaneous {#miscellaneous }

`source plugin`：lsmash

:   使用哪个 VapourSynth 源插件：[`ffms2`](https://github.com/FFMS/ffms2)、[`lsmash`](https://github.com/AkarinVS/L-SMASH-Works) 或 [`bestsource`](https://github.com/vapoursynth/bestsource)。后者对 AV1 可能表现更好，但索引慢得多；如果 lsmash 工作正常、而你又嫌 bestsource 索引太久，就换回 lsmash。

`play ding`：no

:   本意是在 Smoothie 渲染完成后用 ffplay 播放 `C:\Windows\Media\ding.wav`，尚未从 smoothie-py 移植过来。

`always verbose`：no

:   等同于每次都传 `--verbose` 参数（不过还是建议直接用参数——它更早激活详细日志，记录的数据也更多）。

`dedup threshold`：0.0

:   很少用到，因为难以衡量。这是[一个插件](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/filldrops.py)，会猜测哪些帧因编码卡顿而重复，并用补出来的帧替换它们。

`global output folder`：

:   默认情况下 Smoothie 按 `[output] file format:` 输出到与输入文件相同的目录。

`source indexing`：no

:   为输入素材建索引，在 %TEMP% 中生成缓存。同一段素材要渲染多次时，建议开启。

`ffmpeg options`：-loglevel error -i - -hide_banner -stats -stats_period 0.15

:   首先传给 ffmpeg 的参数。

`ffplay options`：-loglevel quiet -i - -autoexit -window_title smoothie.preview

:   启用[预览窗口](#preview-window)时传给 ffplay 的参数，见 [ffplay.html#Main-options](https://ffmpeg.org/ffplay.html#Main-options)。

## :material-console: console {#console }

在 Windows 上可以自定义终端窗口的行为（本功能针对 `conhost.exe`；Windows 11 上默认已换成更花哨的 Windows Terminal）。

Windows Terminal 与本功能配合不佳。

`stay on top`：no

:   让窗口置顶，仍可最小化。

`borderless`：yes

:   隐藏窗口标题栏。无法移动窗口，但仍可以从任务栏点它来最小化。

`position`：top left

:   把窗口移到主显示器的某个角落。

`width`：900
`height`：350

:   窗口尺寸。

## :material-sort-clock-ascending-outline: timescale {#timescale }

`in`：1.0

:   输入速度。比如素材是以 10% 速度录制的，填 0.1 就能把它加速 10 倍。
`out`：1.0

:   输出速度。想稍微快一点的话，来个小小的 1.03 就好 😼

## :material-eyedropper-plus: color grading {#color-grading }

`enabled`：no

:   是否启用本设置，禁用后本分类的其余设置都无所谓。


`brightness` / `saturation` / `contrast` / `hue`：1.0

:   顾名思义，控制输出视频的色彩设置。

## :material-invert-colors: LUT {#LUT }

[查找表](https://en.wikipedia.org/wiki/Lookup_table#Lookup_tables_in_image_processing)滤镜，有点像把颜色精确对齐到某个标准的色彩滤镜，但我们这些极客主要是拿它来玩酷炫的调色 :)

`enabled`：no

:   是否启用本设置，禁用后本分类的其余设置都无所谓。

`path`：<默认为空>

:   LUT 滤镜（.cube）的完整文件路径。

`opacity`：0.20

:   滤镜的不透明度。

## :material-chart-timeline: pre-interp {#pre-interp }

预补帧使用 [RIFE NCNN Vulkan](https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan) 进行补帧。在滤镜链上它位于[补帧](#interpolation)之前，故称“pre-”。

用起来非常慢，模型安装方法见[这里](./installation.md#installing-rife-models)。

用 NCNN 而不是原版 RIFE，是为了小得多的依赖（CUDA 可是 5GB 起步 °O°）。

!!! danger "某些色彩格式转换失败会导致预补帧崩溃"

    取决于你在 :obs-logo: [OBS 的 Advanced（高级）设置页](../obs/advanced.md)里如何配置色彩，
    
    预补帧可能无法与之配合，仓库里目前有个 [open issue](https://github.com/couleur-tweak-tips/smoothie-rs/issues/36)。

    欢迎多试几组组合找到能用的——我这边 sRGB 色彩空间 + Limited 范围是好的。

`enabled`：no

:   是否启用本设置，禁用后本分类的其余设置都无所谓。

`masking`：n

:   是否使用伪影遮罩。注意：如果伪影遮罩在它自己的分类中被禁用，本设置就不起作用。

`factor`：3x

:   想把输入 FPS 乘以几倍来补帧。比如视频输入 60 fps、factor 为 3：60 x 3 = 补到 180fps。

`model`：rife-v4.4

:   RIFE 模型文件夹的路径，不随 Smoothie 附带，见[安装说明](./installation.md#installing-rife-models)。


## 使用多个配方文件 {#using-multiple-recipe-files }
1. 复制一份 `recipe.ini`，改成别的名字
2. 复制一份你日常用来启动 Smoothie 的快捷方式
3. 在参数中加 `--recipe name.ini`（对 [Send To 快捷方式](./installation.md#making-a-send-to-shortcut)，确保它在 `-i` 之前——`-i` 必须是最后一个参数）。
