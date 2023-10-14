---
description: Presentation Model
icon: fontawesome/display-solid
---

# :fontawesome-solid-display: Presentation Model
A presentation model in any program that uses a graphics API like OpenGL, Vulkan and DirectX determines how graphics content is shown on display monitors.

## Available Presentation Models
There are multiple presentation models which include:<br>

### Presentation Models 
|Presentation Model|Description|
|-|-|
Hardware: Legacy Flip|Indicates the app took ownership of the screen, and is swapping the displayed surface every frame.|
Hardware: Legacy Copy to front buffer|Indicates the app took ownership of the screen, and is copying new contents to an already-on-screen surface every frame.|
Hardware: Independent Flip|Indicates the app does not have ownership of the screen, but is still swapping the displayed surface every frame.|
Composed: Flip|Indicates the app is windowed, is using "flip model" swapchains, and is sharing its surfaces with DWM to be composed.|
Hardware Composed: Independent Flip|Indicates the app is using "flip model" swapchains, and has been granted a hardware overlay plane.|
Composed: Copy with GPU GDI|Indicates the app is windowed, and is copying contents into a surface that's shared with GDI.|
Composed: Copy with CPU GDI|Indicates the app is windowed, and is copying contents into a dedicated DirectX window surface. GDI contents are stored separately, and are composed together with DX contents by the DWM.|

!!! note "Source"
    [https://github.com/GameTechDev/PresentMon/blob/main/README-ConsoleApplication.md](https://github.com/GameTechDev/PresentMon/blob/main/README-ConsoleApplication.md)

### Presentation Model Transfer Methods
Presentation Models may use the following to transfer content from a backbuffer to a frontbuffer:

- Bit-Block Transfer:<br>

    This involves contents from the backbuffer being copied to the frontbuffer and then presented.

- Flip:<br>
    This involves contents from the backbuffer being directly presented on the frontbuffer.

A Bit-Block Transfer involves copying contents onto a redirection surface, then presenting it which has overhead and resulting in higher latency.<br>
Flip on the other hand has the contents directly presenting which doesn't introduce overhead and thus latency, making it optimal.

!!! tip "More Information on "Presentation Model Transfer Methods""
    [https://learn.microsoft.com/en-us/windows/win32/direct3ddxgi/dxgi-flip-model](https://learn.microsoft.com/en-us/windows/win32/direct3ddxgi/dxgi-flip-model)

!!! tip "Optimizations for windowed games"
    Windows 11 introduces a feature called "[Optimizations for windowed games](https://devblogs.microsoft.com/directx/updates-in-graphics-and-gaming/)" which makes games use the Flip model instead of the Bit-Block Transfer model.<br>
    This results in lower frame latency and also the ability to use modern gaming features. 

## Optimal Presentation Models

It is optimal to avoid any presentation model that clearly uses the Bit-Block Transfer model.<br> 
So if we refer the descriptions of each presentation model from the [table](#presentation-models), we are left with the following presentation models:<br>

- Hardware: Legacy Flip
- Hardware: Independent Flip
- Composed: Flip
- Hardware Composed: Independent Flip

Composed: Flip requires Desktop Window Manager to first perform desktop composition and before an application can present a frame resulting in more latency.<br>
Essentially a Bit-Block Transfer so using Composed: Flip in that regard should be avoided.

So we are just left with:<br>

- Hardware: Legacy Flip
- Hardware: Independent Flip
- Hardware Composed: Independent Flip

Both of these presentation models essentially act the same way with the only difference that:<br>
Hardware: Legacy Flip involves an application have full ownership with the resources to the display it is presenting on.<br><br>
Hardware: Independent Flip doesn't own the resources to the display it is presenting on but still maintains equivalent performance to Hardware: Legacy Flip, this is achieved by having Desktop Window Manager taken a step back.<br><br>
Hardware Composed: Independent: Flip is the same as Independent Flip only difference being that the graphics content is being presented to a dedicated hardware plane of the GPU.

!!! note "More Information"
    If you want more information on this topic, view:<br>
    [https://wiki.special-k.info/en/SwapChain#d3d1112-swapchain-science](https://wiki.special-k.info/en/SwapChain#d3d1112-swapchain-science)

### Presentation Model Identification
If you want to see what presentation model, an application is using do the following:<br>

1. Download PresentMon from its [GitHub repository](https://github.com/GameTechDev/PresentMon/releases/latest).
2. Once you extract the `.zip` archive, open PowerShell as an administrator.
3. Navigate to the directory where the `presentmon.exe` is located.
4. Run the following command:<br>
    ```
    ./presentmon.exe -multi_csv -hotkey f9
    ```
    This will allow PresentMon to record information about graphics characteristics of an application when you press `F9` on your keyboard.
5. Open your desired graphics application, say a game.

    !!! note
        Make sure you are either using fullscreen or borderless fullscreen.
        
6. Press `F9`, wait for a few seconds and press `F9` again to stop recording.
7. Open the newly generated `.csv` file in a text editor.
    The output should look like this:<br>
    ```csv
    Application,ProcessID,SwapChainAddress,Runtime,SyncInterval,PresentFlags,Dropped,TimeInSeconds,msInPresentAPI,msBetweenPresents,AllowsTearing,PresentMode,msUntilRenderComplete,msUntilDisplayed,msBetweenDisplayChange
    dwm.exe,436,0x000002247F380F90,DXGI,1,2,0,1.68597480000000,0.07540000000000,13.33350000000000,0,Hardware: Legacy Flip,0.14380000000000,13.19100000000000,13.34680000000000
    dwm.exe,436,0x000002247F380F90,DXGI,1,0,0,1.69952550000000,0.17820000000000,13.55070000000000,0,Hardware: Legacy Flip,0.20250000000000,12.96340000000000,13.32310000000000
    dwm.exe,436,0x000002247F380F90,DXGI,1,2,0,1.71266860000000,0.09410000000000,13.14310000000000,0,Hardware: Legacy Flip,0.15030000000000,13.15500000000000,13.33470000000000
    dwm.exe,436,0x000002247F380F90,DXGI,1,2,0,1.72599030000000,0.08260000000000,13.32170000000000,0,Hardware: Legacy Flip,0.15100000000000,13.16530000000000,13.33200000000000
    dwm.exe,436,0x000002247F380F90,DXGI,1,2,0,1.75265940000000,0.08850000000000,26.66910000000000,0,Hardware: Legacy Flip,0.15250000000000,13.16120000000000,26.66500000000000
    dwm.exe,436,0x000002247F380F90,DXGI,1,2,0,1.76597710000000,0.08470000000000,13.31770000000000,0,Hardware: Legacy Flip,0.13600000000000,13.17320000000000,13.32970000000000
    ```
    Now look for anything that is listed under the [presentation model table](#presentation-models).<br>
    That will be the presentation model being used by the application that was just being recorded.

#### Presentation Model Configuration
It's possible to configure what presentation model is used by a given application, this section will cover how to do that.

##### [Disable Fullscreen Optimizations](https://devblogs.microsoft.com/directx/demystifying-full-screen-optimizations/)
!!! warning
    The following only applies to DirectX based applications.<br>

    - Disabling Fullscreen Optimizations for any DirectX 12 application is useless since DirectX 12 can only use Hardware: Independent Flip.<br>
    - The same applies for any DirectX 11 application that uses Hardware: Independent Flip by default and is not applied by Fullscreen Optimizations.

Windows by default applies so called Fullscreen Optimizations to any DirectX 11 and lower based application that uses Hardware: Legacy Flip.<br>
This results in the application using Hardware: Independent Flip instead of Hardware: Legacy Flip.<br>

To disable Fullscreen Optimizations:<br>

1. Simply find the game's executable. 
2. Go into its properties and disable fullscreen optimizations: <br>
    <center>
    ![](../../../assets/images/gaming/general-knowledge/disable-fullscreen-optimizations.png)
    </center>

3. Next, run the following commands in PowerShell as an Administrator:<br>
    ```bat
    reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
    reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
    ```

    !!! note "Source" 
        [https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#presentation-mode](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#presentation-mode)

4. Restart your game.
5. Verify if the desired presentation mode is being used.


##### [Optimizations For Windowed Games](https://devblogs.microsoft.com/directx/updates-in-graphics-and-gaming/)
This is a feature present withing Windows 11 which converts any DirectX application using the Bit-Block Transfer Model with optimal flip mode for:

- Lower Frame Latency
- Auto HDR
- Variable Refresh Rate

**Keep in mind, this feature only applies to applications running in windowed mode which also includes borderless windowed.**

To enable this option do the following:<br>

1. Open Windows Settings.
2. Go to System -> Display -> Graphics.
3. Then go to Default graphics settings.
4. Scroll down to Optimizations for windowed games and turn the setting On. 
5. Restart your game. 
6. Verify if the desired presentation mode is being used.
