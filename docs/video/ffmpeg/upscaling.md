---
icon: material/resize
---


# Why bother upscaling for YouTube? {#why}


Scaling your video to a larger resolution (e.g `1920x1080`/`1080p` :material-arrow-right: `3840x2160`/4K) tricks YouTube into giving your video more bitrate, even though you're not actually adding any detail.

==This is only useful for YouTube, it won't make your video look any better than when you're viewing it back in a media player, it'll just <u>look less worse than the original file</u>==.

**This should be done at the very last step of every project, right before uploading**. It's a waste of rendering time to edit 4K content that's been scaled.

    
## Why not just set the project scale to 4K before rendering? {#why-not-nle}

VEGAS Pro (and probably other NLEs) uses the bicubic scaling filter which makes your video a bit blurry, using FFmpeg lets you make sure you're using the right filter

## :custom-voukoder: Voukoder zscale {#why-not-voukoder}

If you're exporting from [Voukoder](../voukoder/index.md) you can also add an upscale filter. Compared to exporting and using an upscale script, it exports and upscales a single encode, which should take less time and lose less quality, learn how to do it [here](../voukoder/configuration.md#upscaling)

## :material-folder-download: Installing the CTT Upscaler {#installation}

=== "Automatic"

    Running the following command will:
    
    * Install [FFmpeg](./index.md) with [Scoop](https://scoop.sh)
    * Save the upscaling script in the [Send To folder](../sendto.md)

    Paste the following command in a PowerShell window, (it doesn't need to be as an Administrator):

    ```PowerShell title="Automatic upscaler installer"
    iex(irm tl.ctt.cx); Get Upscaler
    ```

=== "Manual"

    1. Install [FFmpeg](../ffmpeg/index.md#installation)

    2. Save [this batch file](https://github.com/couleur-tweak-tips/utils/blob/main/Miscellaneous/CTT%20Upscaler.cmd) as a .cmd file, it's recommended to save it in either:

        * Your [Send To folder](../sendto.md)
        * Or saving it wherever and then dragging video(s) onto it

    Your browser might make it a text file (e.g `CTT Upscaler.cmd.txt`), [show file extensions](https://www.howtogeek.com/205086/beginner-how-to-make-windows-show-file-extensions/) in the File Explorer if it keeps opening Notepad when double clicking it.

    Smartscreen will always warn you about the batch files you download online, Feel free to inspect the code yourself.

## Comparison

Here are two videos, one was left as is, the other one stretched to 4K, watch it in fullscreen with the <kbd>Settings</kbd> -> <kbd>Quality</kbd> option maxed out.
=== "1080p"

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/ohjz9Kff7lo?color=white" frameborder=0 allowfullscreen></iframe>

    
=== "1080p stretched to 4K"

    <iframe width="688" height="387" src="https://www.youtube-nocookie.com/embed/-FE9s_acdYw?color=white" frameborder=0 allowfullscreen></iframe>