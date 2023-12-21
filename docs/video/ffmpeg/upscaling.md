---
icon: fontawesome/solid/arrow-up-right-dots
---


# Why bother upscaling for YouTube?


Scaling your video to twice it's size (e.g 1080p -> 2160p / 4K) tricks YouTube into giving your video more bitrate. This is only useful for YouTube, 

==It won't make your video look any better better than when you're viewing it back on VLC, it'll just <u>looks less compressed/more faithful on YouTube</u>==.

**This should be done at the very last step of every project, right before uploading**, there's no need to be editing 4K content that's been scaled.

## Installation

=== "Automatic"

    Running the following command will
    
    * Install [FFmpeg](./index.md) with [Scoop](https://scoop.sh)
    * Save the upscaling script in the [Send To folder](../sendto.md)

    Paste the following command in a PowerShell window, (it doesn' need to be as an Administrator):

    ```PowerShell
    iex(irm tl.ctt.cx); Get Upscaler
    ```

=== "Manual"

    1. Install [FFmpeg](../index.md)

    2. Save [this batch file](https://github.com/couleur-tweak-tips/utils/blob/main/Miscellaneous/CTT%20Upscaler.cmd) as a .cmd file, it's recommended to save it in either:

    * Your [Send To folder](../sendto.md)
    * Or saving it wherever and dragging the video file(s) you wish to use with it

    Your browser might make it a text file e.g `.cmd.txt`, show file extensions in your if explorer if it still opens notepad when double clicking it

    Smartscreen will always warn you about the batch files you download online 

## Comparison

Here are two videos, one was left as is, the other one stretched to 4K, watch it in fullscreen with the <kbd>Settings</kbd> -> <kbd>Quality</kbd> option maxed out.
=== "1080p"

    <iframe width="688" height="387" src="https://www.youtube.com/embed/ohjz9Kff7lo" frameborder=0 allowfullscreen></iframe>

    
=== "1080p stretched to 4K"

    <iframe width="688" height="387" src="https://www.youtube.com/embed/-FE9s_acdYw?color=white" frameborder=0 allowfullscreen></iframe>

    
## **Why not just set the project scale to 4K before rendering?** {#why-not-nle}

VEGAS Pro (and probably other NLEs) uses the bicubic scaling filter which makes your video a bit blurry, using FFmpeg lets you make sure you're using the right filter

> :custom-voukoder: **Why not use Voukoder's zscale?**
__You ideally **should** use it __over the batchscript you can install in this guide, since it will export your project and upscale it all at once, which should take less time and lose less efficiency, more info @ <#1022956596768288919>