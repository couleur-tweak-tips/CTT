---
icon: custom/optifine
---

* <https://optifine.net/downloads>
* <https://optifine.net/adloadx?f=preview_OptiFine_1.8.9_HD_U_M6_pre2.jar>
* <https://optifine.net/adloadx?f=OptiFine_1.7.10_HD_U_E7.jar>

You can overclock and tweak your PC all you want, the simplest and most important things to check are in-game settings:

* Make sure `Fast Render` turned on if you struggle with your FPS, this is the most impactful setting for performance,
* If you don't mind, disabling `Custom Sky` will help a bit. 
* Putting `Render distance` to 4 is enough for practice in [my](/contact#couleur) opinion.
* If you don't have a good GPU, consider playing in `1280x720`, it can significantly increase performance.
* You can turn on Smooth FPS to lower Minecraft's GPU utilization (e.g to leave more for OBS' NVENC usage)

### Go to ESC > Options > Video Settings.

* Video Settings
    * `Graphics`: Fast
    * `Render Distance`: 4-8
    * `Use VBOs`: ON
        * In newer versions of the game, VBOs are on by default and cannot be toggled off.
* Performance
    * `Smooth FPS`: OFF
        * Turning this on will lower framerates can help with OBS performance issues if Minecraft is taking too much resources. (todo: see if this improves frametimes)
    * `Fast Render`: ON :bangbang:
        * Having Fast Render on will disable shaders on 1.7 to 1.12. This includes  Motion Blur, Menu Blur, and Color Saturation.
    * `Fast Math`: ON
    * `Render Regions`: ON 
        * OFF if you are on an integrated graphics card, including Apple silicon.
    * `Smooth Animations`: ON
* Quality
    * `Antialiasing`: OFF
    * `Anisotropic Filtering`: OFF


Partly taken from [Lunar Client's FPS Issue solution article](https://support.lunarclient.com/support/solutions/articles/60000764858-fps-issues)