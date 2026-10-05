---
icon: obs/output
---

# :obs-output: 输出（Output）

建议使用[最新版 OBS](https://github.com/obsproject/obs-studio/releases/latest)(1)——点窗口标题栏的 <kbd>Help（帮助）</kbd> -> <kbd>Check For Updates（检查更新）</kbd>查看当前版本。
{ .annotate}

1. #### 为什么？
:   因为停留在旧版 OBS（如 25.8.0）已经没有任何好处了（除非你确实需要与旧插件之类的东西保持兼容）。

    * 高帧率 + 多音轨录制在停止时不再会卡死
    * 关于高于 25.0.8 的版本高帧率录制会出重复帧的传闻从未被重现过——多半是个都市传说
    * 新的输出设置带来了更高效 / 更高帧率的编码。

    如果你确实有上面没提到的原因必须留在旧版（懒惰和拖延症不算），[告诉我](../../contact.md)。

=== ":material-record-circle-outline: 录制（Recording）"

    ##### 录制设置

    * `Recording format`（录制格式）：MPEG-4 (.mp4)

    :   除非你要录很长时间，我看不出有什么理由用那些许多 NLE 至今都支持不好的容器（或者用 OBS 的术语叫“格式”）。


    ??? "Matroska (.MKV) 和 Hybrid/Fragmented MP4 呢？"

        分片 MP4 和（尤其是）MKV 文件可能被剪辑软件读不进来/认不出，需要你手动逐个重封装。不过如果你的录制内容很重要、承受不起 OBS 或系统崩溃导致文件损坏，那就该用它们。

        分片 MP4 在 VEGAS 里出问题是出了名的，不过重封装成常规 MP4 就能修。

    一般来说，编码速度从快到慢依次是：NVENC（NVIDIA）、AMF（AMD）、QuickSync（Intel 核显），然后是 x264/5（CPU）。

    关于 `CQP` 和 `CFR` [码率控制](../codecguide.md#rate-controls)：数值方向与 CBR 相反——0 为无损，51 压得最狠。


    ##### 视频编码器设置

    === ":simple-nvidia: (NVIDIA) NVENC"

        !!! abstract "高帧率录制配置"

            想以 120+ FPS 录制的话，建议这样配置：

            * <div class="annotate" markdown>`Preset`：P1 - P4(1)</div>

                1. OBS 把低 Preset 描述为“更低质量”，那是针对<u>带宽受限场景下的 CBR 串流</u>语境的——用于录制时，它只是用更大的文件体积换更高的录制性能。

            * `Multipass Mode`（多遍模式）：Single pass（单遍）
            * `Look-ahead`（前瞻）：不勾选
            * `Psycho Visual Tuning`（心理视觉调校）：不勾选
            * `Max B-frames`（最大 B 帧）：0
            * `Keyframe Interval`（关键帧间隔）：0（auto）

            :   高帧率录制时我习惯了把它们关掉/设成 0。对于串流或高效录制，它们或许仍有意义。

        * `Rate Control`（码率控制）：<kbd>CQP</kbd> / <kbd>CQ Level</kbd> / <kbd>Constant QP</kbd>

        :   比永远吐固定码率的 CBR 自适应得多。

        * `CQ Level`：<kbd>18</kbd>

        * `Preset`（预设）：<kbd>P7: Slowest (Best Quality)</kbd>（P7：最慢（最佳质量））

        * `Multipass Mode`（多遍模式）：<kbd>Two Passes (Full Resolution)</kbd>（两遍（全分辨率））

        :   这两项设置对编码速度和效率影响很大，是最近才引入 OBS 的，我对它们了解不深。

        * `GPU`：0

        :   这是 GPU 序号，只有你有多张 GPU 时才需要折腾。

    === ":custom-amd: (AMD) AMF"

        * `Encoder`：<kbd>AMD AMF H.265</kbd>

        * `Rate control`（码率控制）：<kbd>CQP</kbd>

        * `Keyframe interval`（关键帧间隔）：<kbd>2</kbd>

        :	不打算高帧率录制的话设为 2

        * `Rate value`：<kbd>16-20</kbd>（取决于游戏）

        * `Quality preset`（质量预设）：<kbd>Quality</kbd>

        * `CQ Level`：<kbd>20</kbd>
        
        注：OBS Studio 的 GitHub wiki 上也有一些文档：

        <https://github.com/obsproject/obs-studio/wiki/AMF-HW-Encoder-Options-And-Information>

        <https://github.com/obsproject/obs-studio/wiki/AMF-Options>

    === ":simple-intel: (Intel) QSV"

        这组设置面向在 2020 年及更早的 Intel 芯片上以 30~60 FPS 录制 Minecraft；而在更新的 Iris XE 和 ARC 核显上，用同样的设置可以录 120FPS。

        * `Target Usage`：<kbd>TU7</kbd>

        :   OBS 30 更新为 QuickSync 引入了多个质量档位。TU7 是所有预设中性能最好的，代价是牺牲些许画质。如果你的游戏跑在独显上、用 QuickSync 录制，可以用 TU4 换更好的画质。

        * `Profile`：<kbd>High</kbd>

        :   OBS 30 里保持 High：性能最好、兼容性最广。

        * `Keyframe Interval`（关键帧间隔）：<kbd>3</kbd>

        :   追求极致性能就留 0（auto）——在最新版 OBS 上这恰好会把关键帧间隔设为 3……所以 3 本来就是 60fps 录制的最佳关键帧间隔。

        * `Rate Control`（码率控制）：<kbd>ICQ</kbd>

        :   追求效率首选 ICQ，它会按帧自适应码率。

        * `ICQ Quality`：<kbd>16 或 23 或 30</kbd>

        :   Ashank 简单测试后发现：体积画质比最好的是 16（UHD 核显上）。但如果你想录更高帧率、玩吃 GPU 的游戏、或遇到掉帧，就把值提到 23 以上。30 左右的画质还尚可接受，但明显更差。可以用[这个视频](https://youtu.be/2xJ8sLPC5Cg)参考 TU7 + ICQ 30 的大致观感。超过 30 客观上就已经*很糟*了——如果 QSV 在 30 ICQ 下都录不动，你该考虑上采集卡了，再怎么调也救不了帧率。

        * `Latency`（延迟）：<kbd>normal</kbd>

        :   设为 normal：你又不是在直播。这个设置用于把直播延迟压到最低，录制场景没必要调低。

        * `Max-B-frames`（最大 B 帧）：<kbd>0</kbd>

        :   B 帧通常是一种压缩手段，在游戏场景会吃掉可观的 CPU 和 GPU 资源。低动态画面的游戏可以设 3（如果你在用独显 + QSV 的组合）。但最优解还是保持 0——用 QSV 录制的人多半在用核显，每一滴算力都很宝贵。

        ##### 在 OBS 中

        [![](../../assets/images/video/obs/output/recording/quicksync-ashank.png)](../../assets/images/video/obs/output/recording/quicksync-ashank.png)

=== ":obs-stream: 串流（Streaming）"

    当今串流的通行做法是 CBR 码率控制——每秒发送固定量的数据。
    
    编码器的速度预设决定你这 X Kbps 能压缩出多好的画面。

    各平台不同分辨率该用多大码率，见它们的官方文档：

    * :simple-youtube: <https://support.google.com/youtube/answer/2853702>
    * :simple-twitch: <https://help.twitch.tv/s/article/broadcasting-guidelines>
    * :simple-kick: <https://help.kick.com/en/articles/7066931-how-to-stream-on-kick-com>

    你可以在 [speedtest.net](https://www.speedtest.net/) 或 [librespeed.org](https://librespeed.org/) 测上传速度，用 [Waveform 的 bufferbloat 测试](https://www.waveform.com/tools/bufferbloat)测稳定性。

    === ":simple-nvidia: (NVIDIA) NVENC"


        !!! danger "本节缺少设置参考"

            如果你有 NVENC 串流的经验，欢迎投稿；目前我推荐先[看看 NVIDIA 的这篇文章](https://www.nvidia.com/en-us/geforce/guides/broadcasting-guide/)。

        * `Rate Control`（码率控制）：<kbd>CBR</kbd>

        * `Bitrate`（码率）：取决于平台与你的上传带宽

        :   见上方链接。

        * `Preset`（预设）：<kbd>P7: Slowest (Best Quality)</kbd>（P7：最慢（最佳质量））

        :   在给定带宽下提供最高效的编码。

        * `Multipass Mode`（多遍模式）：<kbd>Two Passes (Full Resolution)</kbd>（两遍（全分辨率））

        :   这两项设置对编码速度和效率影响很大，是最近才引入 OBS 的，我对它们了解不深。

        <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/uAqLJ3sxudU?color=white" frameborder=0 allowfullscreen></iframe>

    === ":custom-amd: (AMD) AMF"
    
        [我](../../contact.md#couleur)没有 AMD 显卡，建议照着这个视频里的设置抄，看看效果如何：

        欢迎为这部分[贡献](../../contributing.md)经验。

        <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/DXL8_Adbob4?start=329&color=white" frameborder=0 allowfullscreen></iframe>

        视频中的设置：
        ```
        MaxNumRefFrames=4 BReferenceEnable=1 BPicturesPattern=1 MaxConsecutiveBPictures=1 HighMotionQualityBoostEnable=1
        ```

        注：它们的 GitHub wiki 上也有一些文档：

        <https://github.com/obsproject/obs-studio/wiki/AMF-HW-Encoder-Options-And-Information>
        <https://github.com/obsproject/obs-studio/wiki/AMF-Options>


    === ":custom-intel: (Intel) QSV"

        你有好用的串流设置吗？[告诉我们](../../contact.md)！

        目前我先推荐[这篇](https://www.xaymar.com/guides/obs/high-quality-streaming/qsv/)教程。

=== ":simple-buffer: 回放缓存（Replay buffer）"

    ##### 说明

    类似 [NVIDIA ShadowPlay](https://www.nvidia.com/en-us/geforce/geforce-experience/shadowplay/)：按你的[录制设置](#recording)采集画面，只在内存里保留最后 <kbd>X</kbd> 秒，任何时候按下[快捷键（默认未绑定）](./hotkeys.md#replay-buffer)即可把它存为视频文件。

    代替在几小时的录制/直播回放里疯狂拖进度条找重点的另一种活法——每次保存都会单独生成一个视频文件。

    ##### 回放缓存设置

    :fontawesome-regular-square-check: Enable Replay Buffer（启用回放缓存）

    :   启用后 Controls（控件）窗格中会出现 <kbd>Start Replay Buffer（启动回放缓存）</kbd>按钮。

    * <kbd>Maximum Replay Time</kbd>（最大回放时长）：看你

    :   每次保存想存多少秒。叫“最大”是因为：启动回放缓存后立刻按保存快捷键、还没攒够时长的话，得到的文件就不会有 X 秒那么长。

    *   <kbd>Maximum Memory</kbd>（最大内存）：取决于多种因素

    :   完全取决于你的片段文件会有多大。我存过最大的一个 1.15GB，所以我保持 2048MB。

### H.264 (AVC)、H.265 (HEVC) 还是 AV1？

见[编解码器指南](../codecguide.md#hwenc)。
