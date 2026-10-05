---
icon: material/file-eye
---

# 使用场景示例 {#use-case-examples }
掌握了 Smoothie 的全部技巧后，它就是一把真正的瑞士军刀。以下列出我亲眼见过的、Smoothie 表现优异的所有实际场景。

## 高 FPS 的 VEGAS Pro 剪辑 {#high-fps-vegas-pro-editing }
（这也适用于 Premiere Pro——它的预渲染/代理能力快得多，但帧混合效果客观上更差。）

假设我以 480 FPS 录制，并想做帧混合、以 60 FPS 导出：

与其：

* 把素材导入 VEGAS Pro
* 顶着预览卡顿剪辑，预览最多跑 5~15 FPS
* 用 smart resampling（智能重采样）导出（很慢）
* 哪里出错了要重导？那所有东西还得再重采样一遍

不如：

* 用 Smoothie 对所有素材先跑帧混合
* 再导入 VEGAS Pro
* 剪辑时预览几乎不卡
* 按与素材相同的帧率导出（无需 smart resampling，所以很快）

唯一的缺点是做 velocity / 慢放之类的效果时会显得不连贯——但没什么能阻止你把那一段换回原始 480 FPS 素材。

## 替代 Flowframes（先补帧到 60+fps 再帧混合） {#flowframes-for-60fps-interp-then-frame-blending }
以录制 [Apex Legends 游戏集锦](https://youtu.be/tItOJFwILOc)这种高 GPU 负载场景为例：

假设我们以 180fps 录制：

与其：

* 用 [Flowframes](https://nmkd.itch.io/flowframes) 逐个补帧每个视频文件，并导出为 PNG 序列
* 计算把视频拆成原始帧要占多少临时存储
* 打开 VEGAS 导入 PNG 序列
* 用 smart resampling 导出


不如：

* 把所有视频排进 Smoothie 队列，配置好[预补帧（RIFE）](./recipe.md#pre-interp)和[帧混合](./recipe.md#frame-blending)
* ……就这。

享受丝滑的击杀镜头吧 [:)](https://youtu.be/3cbfKyQktRY)

## 做渲染测试 {#doing-render-tests }
献给 [`#video-dicussion`](https://discord.gg/CTT) 频道的各位 :)

与其：

* 把素材导入 VEGAS Pro
* 加上你的色彩分级设置和 LUT 文件
* 用 MAGIX 以 240M 码率导出
* 把导出的视频移到超分文件夹
* 重命名为 input.mp4
* 收拾超分文件夹里上次留下的旧文件
* 运行 upscale.bat
* 上传到 YouTube

不如：

* 这样配置 Smoothie：
    * 加上你喜欢的 [LUT](./recipe.md#LUT) / 配置[色彩分级](./recipe.md#color-grading)
    * 开启[帧混合](./recipe.md#frame-blending)
    <!-- * In the [output enc args](./recipe.md#output) add `4K` to (up)scale to 4K -->
* 运行 Smoothie
* 直接分享到 Discord 或 [fileditch.com](https://fileditch.com)
