---
description: Halo Infinite
icon: fontawesome/ring-solid
---

# <img class="icon" src="../../../assets/images/gaming/halo-infinite/haloinf.png"> Halo Infinite

<center>
<img class="rounded-image" src="../../../assets/images/gaming/halo-infinite/haloinfbanner.png"/>
</center>

This article with cover on how to optimize Halo Infinite.

Halo Infinite is both available on:<br>

- :simple-steam: Steam
- :simple-microsoft: Microsoft Store

!!! warning
    Some optimizations might be either specific to the Steam or Microsoft Store version of the game.

## Removal of High Resolution Texture Packs
!!! info "Supported Platforms"
    - [x] :simple-steam: Steam
    - [x] :simple-microsoft: Microsoft Store

The High Resolution Texture Packs ship with the game are know to cause stuttering & performance issues.

1. On the title screen, go to the Control Panel.
2. Select "Manage Game" from the Control Panel.
3. Make sure the only thing that is select is the Campaign, if you own it.
4. Finally hit <button>**[Apply]**</button> to apply the changes.

 <img class="rounded-image" src="../../../assets/images/gaming/halo-infinite/ingame-dlc.png">

## Aggressive Dynamic Resolution Scaling

!!! info "Supported Platforms"
    - [x] :simple-steam: Steam
    - [x] Microsoft Store

!!! note
    You may refer to [Visual Quality Tweaks](#visual-quality-tweaks) to fix any quality issues caused by aggressive dynamic resolution scaling.

We may abuse the `Minimum Framerate` option for better performance.
By setting the value to `960` FPS, dynamic resolution scaling becomes insanely aggressive providing noticable performance gains.

1. Open the `SpecControlSettings.json` file depending on your platform:<br>

    |Platform|Filepath|
    |-|-|
    |Steam|`%LOCALAPPDATA%\HaloInfinite\Settings\SpecControlSettings.json`|
    |Microsoft Store|`%LOCALAPPDATA%\Packages\Microsoft.254428597CFE2_8wekyb3d8bbwe\LocalCache\Local\HaloInfinite\Settings\SpecControlSettings.json`|

2. Set the following key-value pair to the following:<br>
    ```js
    "spec_control_minimum_framerate": {
        "version": 2,
        "value": 960
    },
    "spec_control_target_framerate": {
        "version": 1,
        "value": 960
    } 
    ```

3. Here are the results for:<br>
    - 1920 x 1080
    - Low Settings (Including Settings that may be turned off.)

    !!! image "No Minimum Framerate"
        <img class="rounded-image" src="../../../assets/images/gaming/halo-infinite/No-Min-FPS.PNG">
    !!! image "Minimum Framerate"
        <img class="rounded-image" src="../../../assets/images/gaming/halo-infinite/Min-FPS.PNG">

## Visual Quality Tweaks

!!! info "Supported Platforms"
    - [x] :simple-steam: Steam
    - [x] :simple-microsoft: Microsoft Store

### :simple-nvidia: NVIDIA
If you are having an NVIDIA GPU, you may avail the following techonlogies to improve visual quality:<br>

!!! abstract "NVIDIA Image Sharpening"
    > Applies a sharpness filter to the target application to improve visual quality.
    To use image sharpening do the following:<br>

    1. Make sure NVIDIA Image Scaling is disabled for Halo Infinite.
    2. Open the Windows Registry Editor:<br>
        1. Go to the following key:<br>
            ```
            HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS
            ```
        2. Find a value called `EnableGR535` and set its value to `0`.<br>
            This will replace Image Scaling with Image Sharpening in the NVIDIA Control Panel.
    3. Open up the NVIDIA Control Panel, under Manage 3D Settings, Program Settings, select Halo Infinite.
    4. Configure the sharpness and film grain values for the game.

!!! abstract "NVIDIA Image Scaling"
    > This is a proper upscaling technology shipped by the NVIDIA Driver, suppose to be a successor to NVIDIA Image Sharpening.

    1. Open up the NVIDIA Control Panel, under Manage 3D Settings, Program Settings, select Halo Infinite.
    2. Enable NVIDIA Image Scaling and also **enable** the overlay indicator.
    3. Configure the sharpness values for the game.

    !!! note
        It's possible to even use Scaling Resolutions.<br>
        Use [ZetaLoader](#zetaloader)'s User Specified Display Mode to use Scaling Resolutions.

!!! abstract "Negative LOD Bias"
    > This option improves texture quality and **not** image quality, lower the value, the more sharper.

    This requires [NVIDIA Profile Inspector](https://github.com/Orbmu2k/nvidiaProfileInspector/releases/latest) to be downloaded.

    **Make sure, Negative LOD Bias is enabled for Halo Infinite in the NVIDIA Control Panel!**

    1. Open NVIDIA Profile Inspector.
    2. Navigate to Halo Infinite and set the following to:

        |Setting|Value|
        |-|-|
        |Antialiasing - Transparency Supersampling|2x Sparse Grid Supersampling|
        |Texture Filtering - LOD Bias (DX)| Anywhere between `0` ~ `-3`|
    3. Save the profile.


### :custom-amd: AMD
One may leverage the following technologies to improve visual quality:<br>

- AMD Radeon™ Image Sharpening
- AMD Radeon™ Super Resolution

    !!! note
        This feature requires the game to be running at a lower display resolution.<br>
        Use [ZetaLoader](#zetaloader)'s User Specified Display Mode to use RSR. 

Each feature may be enabled globally or for the game specifically.

### [ZetaLoader](https://github.com/Aetopia/Zetaloader)

!!! info "Supported Platforms"
    - [x] :simple-steam: Steam
    - [ ] :simple-microsoft: Microsoft Store

#### Features

An open source modification/patch for Halo Infinite that aims to fix and improve some aspects of the game which include:<br>

1. Borderless Fullscreen:<br>
    Fixes issues with the game's borderless fullscreen implementation not filling the screen correctly at certain resolutions.

    !!! warning 
        **Due to the way, how ZetaLoader implements Borderless Fullscreen, the following options will not work properly**:

        |Setting|
        |-|
        |Display Monitor|
        |Limit Inactive Framerate|
        |Inactive Mute|
        |V-Sync|
        |Maximum Framerate|

        Because of this, consider using alternatives for the options listed here:

        |Setting|Alternative|
        |-|-|
        |V-Sync|Driver Based V-Sync|
        |Maximum Framerate| External Framerate Limiter|
        |Limit Inactive Framerate| Background Application Max Frame Rate (**NVIDIA Only!**)|

2. Jittery Input Fix:

    Fixes jittery input when an external framerate limiter is used.

    !!! note
        Setting the game's process priority to `HIGH` will negate this fix.   
        
        Reference: [https://learn.microsoft.com/en-us/windows/win32/procthread/scheduling-priorities](https://learn.microsoft.com/en-us/windows/win32/procthread/scheduling-prioritie)

        Issue + Fix Demonstration: [https://www.youtube.com/watch?v=4pJd-dKW7WY](https://www.youtube.com/watch?v=4pJd-dKW7WY )   



3. User Specified Display Mode:

    !!! warning
        **The display mode's resolution shouldn't result in the resolution scale's lowest possible resolution being `1360` x `768` or close to `1360` x `768`, if the display resolution is**:<br>
        - Below `1024` x `768`.
        - Between `1024` x `768` ~ `1360` x `768`.

    !!! tip
        - ZetaLoader's Borderless Fullscreen implementation must be enabled to use this feature.
        - Make sure to adjust **`Text Size`** setting to adjust the HUD size, depending on the display resolution.
        - In your GPU's Driver Control Panel:<br>
            - Set the Scaling Mode to "Fullscreen" or "Stretched".
            - Use GPU Scaling for faster display mode switches.
        - User Specified Display Mode handles display modes as follows:<br>
            -  Only Landscape orientation based display modes can be used.
            -  If no display mode is specified, the default display mode or display mode stored in the Windows Registry will be used.

    User Specified Display Mode provides Halo Infinite with the facility to have the game's window run at any arbitrary display mode of the user's choice as long as it is valid.

    !!! image "1024x768 with ZetaLoader along with Aggressive Dynamic Resolution Scaling."
        <img class="rounded-image" src="../../../assets/images/gaming/halo-infinite/1024x768-Min-FPS.PNG">

    !!! image "1024x768 with Visual Quality Tweaks and ZetaLoader along with Aggressive Dynamic Resolution Scaling."
        <img class="rounded-image" src="../../../assets/images/gaming/halo-infinite/Image-Sharpening-Tweaks.PNG">

4. Multimedia Class Schedule Service Scheduling:

    Using the function `DwmEnableMMCSS` makes DWM to participate in MMCSS scheduling while the calling process is alive.

    This may help with improving performance within non-fullscreen games.
    
    !!! abstract "References"        
        - [https://github.com/djdallmann/GamingPCSetup/blob/master/CONTENT/RESEARCH/WINSERVICES/README.md#multimedia-class-scheduler-service-mmcss](https://github.com/djdallmann/GamingPCSetup/blob/master/CONTENT/RESEARCH/WINSERVICES/README.md#multimedia-class-scheduler-service-mmcss)

        - [https://www.overclock.net/threads/if-you-play-non-fullscreen-exclusive-games-you-might-get-a-boost-in-performance-with-dwmenablemmcss.1775433/](https://www.overclock.net/threads/if-you-play-non-fullscreen-exclusive-games-you-might-get-a-boost-in-performance-with-dwmenablemmcss.1775433/)

        - [https://learn.microsoft.com/en-us/windows/win32/procthread/multimedia-class-scheduler-service](https://learn.microsoft.com/en-us/windows/win32/procthread/multimedia-class-scheduler-service)


5. 0.5 ms Timer Resolution:

    Improves `0.X` lows when the framerate is capped.

    Check out ZetaLoader's [`README.md`](https://github.com/Aetopia/Zetaloader#3-05-ms-timer-resolution) for more insight on this topic.

!!! tip
    For more information on the project, view ZetaLoader's GitHub repository.<br>
    **GitHub Repository: [https://github.com/Aetopia/Zetaloader](https://github.com/Aetopia/Zetaloader)**

#### Installation 
1. Download the latest version of ZetaLoader from [GitHub Releases](https://github.com/Aetopia/ZetaLoader/releases/latest).
2. Open Halo Infinite's installation directory.
3. To install ZetaLoader for the campaign and multiplayer, place the dynamic link library in the following folders:<br>

    !!! note 
        Since Halo Infinite's campaign and multiplayer are separated both required their own copy of ZetaLoader.
    - Multiplayer: `"<Installation Directory>\game"`
    - Campaign: `"<Installation Directory>\subgames\CampaignS1"`

#### Uninstallation
Simply remove `dpapi.dll` from Halo Infinite's Installation directory for the campaign and multiplayer.

#### Configuration
To configure ZetaLoader, do the following:

!!! warning
    You must restart the game for any configuration file changes to reflect.

1. Go to the following directory: `"%LOCALAPPDATA%\HaloInfinite\Settings"`.
2. Create a new file called `ZetaLoader.ini`, this is ZetaLoader's configuration file.
3. Add the following contents into the file:<br><br>
    ```ini
    [Settings]
    WindowMode = 0 
    Width = 0
    Height = 0
    Frequency = 0
    ```

    |Key|Value|
    |-|-|
    |`WindowMode`|Toggles ZetaLoader's Borderless Fullscreen.<br><ul><li>`0` - Disabled</li> <li>`1` - Enabled</li></ol>|
    |`Width`|Display Resolution Width when ZetaLoader's Borderless Fullscreen is enabled.|
    |`Height`|Display Resolution Height when ZetaLoader's Borderless Fullscreen is enabled.|
    |`Frequency`|Display Frequency when ZetaLoader's Borderless Fullscreen is enabled.|

Example:
```ini
[Settings]
WindowMode = 1
Width = 1360
Height = 768
Frequency = 60
```
This will make Halo Infinite run `1360`x`768` @ `60` Hz with ZetaLoader's Borderless Fullscreen enabled.