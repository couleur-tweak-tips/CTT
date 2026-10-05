---
icon: material/movie-cog
---

# 剪切工具 vs NLE {#video-cutters-vs-nles }
VEGAS、Premiere、After Effects、DaVinci Resolve……这些 NLE 导出项目时都会重新编码你的视频。

因为它们必须先解码，才能对你喂进去的素材做真正的“剪辑”。

而当你只需要剪视频、用不上视频编辑器那一堆花活时，剪切工具就是救星：

| 对比项         | NLE 重编码                                                        | 剪切工具                          |
|--------------------|------------------------------------------------------------------------|----------------------------------------|
| 渲染耗时       | 只会更慢                                                  | 快如闪电                         |
| 能剪什么 | 什么都能                                                   | 只能从 A 点剪到 B 点     |
| 画质             | 除非无损编码，否则必然折损一点画质 | 不重新编码，比特流原样未动 |

典型场景：素材里有很长的段落你知道永远不会用（比如从直播回放里剪精彩集锦存档）。

### :material-format-list-checks: 有哪些剪切工具？ {#what-video-cutters-are-there }
其实还有很多，这里只讲“顺手程度/功能比”这两头上最具代表性的两个：

* [LosslessCut](./losslesscut.md)：基于 Electron 的剪切界面，
* [Avidemux](./avidemux.md)：轻快得多，相当于 FFmpeg 命令行剪切的基础前端。

未收录进 [ctt.cx](#) 的：

* [suckless-cut](https://github.com/couleur-tweak-tips/suckless-cut)：复刻 LosslessCut 的 mpv lua 脚本，我设计它就是为了直接导出给 smoothie-rs
* [vidcutter](https://github.com/ozmartian/vidcutter)：一个用 mpv 的 Python GUI（？）todo: 补一段正经介绍，我（couleur）没怎么用过
