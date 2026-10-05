---
icon: obs/video
---

# 基础（画布）分辨率与输出（缩放）分辨率的区别 {#difference-between-base-canvas-and-output-scaled-resolutions }
顾名思义，画布分辨率就是你摆放来源的预览窗格的分辨率。

输出分辨率则以基础画布为源，缩放到你设置的值。

### 什么时候值得用不同的分辨率 {#when-using-a-different-resolution-is-worth-using }
* 串流：带宽/编码效率受限的话可以考虑降分辨率；在 YouTube 上则反过来拉高以博取更多码率（与超分同理）。

* 录制：如果你明知后期要缩放到别的分辨率，可以在录制时一步到位——不过这是实时缩放，对性能是好是坏不一定。

# 帧率 {#frame-rate }
我们所有人都用 <kbd>Fractional FPS Value</kbd>（分数帧率值），填 `想要的 fps` / `1`。
