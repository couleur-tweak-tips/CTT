---
icon: custom/optifine
---

* <https://optifine.net/downloads>
* <https://optifine.net/adloadx?f=preview_OptiFine_1.8.9_HD_U_M6_pre2.jar>
* <https://optifine.net/adloadx?f=OptiFine_1.7.10_HD_U_E7.jar>

电脑再怎么超频折腾，最简单也最重要的还是游戏内设置：

* 如果 FPS 吃紧，确保打开 `Fast Render`（快速渲染），这是对性能影响最大的设置；
* 不介意的话，关掉 `Custom Sky`（自定义天空）也有点帮助；
* 依[我](/contact#couleur)看，练习时把 `Render Distance`（渲染距离）调到 4 就够了；
* 如果 GPU 不好，可以考虑用 `1280x720` 分辨率玩，能显著提升性能；
* 可以打开 Smooth FPS（平滑帧率）来压低 Minecraft 的 GPU 占用（比如给 OBS 的 NVENC 编码腾资源）。

### 进入 ESC > 选项 > 视频设置（Video Settings）。 {#go-to-esc-options-video-settings }
* 视频设置（Video Settings）
    * `Graphics`（图像）：流畅
    * `Render Distance`（渲染距离）：4-8
    * `Use VBOs`（使用顶点缓冲对象）：开
        * 在较新版本的游戏中，VBO 默认开启且无法关闭。
* 性能（Performance）
    * `Smooth FPS`（平滑帧率）：关
        * 打开它会降低帧率——当 Minecraft 吃掉太多资源时，可以缓解 OBS 的性能问题。（todo：看看能否改善帧生成时间）
    * `Fast Render`（快速渲染）：开 :bangbang:
        * 打开它会禁用 1.7 到 1.12 的光影，包括动态模糊、菜单模糊和色彩饱和度。
    * `Fast Math`（快速数学运算）：开
    * `Render Regions`（区域渲染）：开 
        * 如果你的显卡是核显（包括 Apple silicon），则关掉。
    * `Smooth Animations`（平滑动画）：开
* 品质（Quality）
    * `Antialiasing`（抗锯齿）：关
    * `Anisotropic Filtering`（各向异性过滤）：关


部分内容取自 [Lunar Client 的 FPS 问题解答文章](https://support.lunarclient.com/support/solutions/articles/60000764858-fps-issues)
