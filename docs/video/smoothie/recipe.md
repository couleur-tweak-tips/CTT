---
description: Explanation of Smoothie's recipe (config file)
icon: simple/googlesearchconsole
---

# Smoothie recipe

The recipe (config file) is the hardest part of Smoothie's learning curve, reading this and messing around with short clips is the best way to familiarize yourself with it. 

The values which can be turned on or off (booleans) have a bunch of aliases for convenience, I advise typing y/n or 1/0 for short

If there are features you're not interested in using, feel free to remove them from the file, it won't break a thing and act like you disabled it(1)
{ .annotate }

1. Smoothie loads `defaults.ini`, which is just like the user's `recipe.ini` but with everything disabled / max compatibility, then it overrides those value with the existing ones in `recipe.ini`.

<br>

Here's what each file is for:

* [`recipe.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/recipe.ini)

:   The default config file you're supposed to edit.

* [`defaults.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/defaults.ini)

:   Backup of all existing settings, it's loaded first then overwritten by `recipe.ini`, so you can remove unused features.


* [`encoding_presets.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini)

:   Preset config file for the [output enc args](#output) recipe setting.

    The value on the left of the equal sign is what you type in the recipe, and the value on the right is what it'll expand to when fed to FFmpeg's arguments.

    None of them are hardcoded, so you can edit them or even create your very own FFmpeg output CLI presets.

* [`jamba.vpy`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/jamba.vpy)

:   The [VapourSynth script](https://www.vapoursynth.com/doc/gettingstarted.html#example-script) Smoothie uses, you can read how each config value is used. Having it out here means nothing prevents you from installing extra plugins in `/bin/vapoursynth64/plugins/` and wiring your own recipe ingredients. Though there are some [hardcoded recipe checks](https://github.com/search?q=repo%3Acouleur-tweak-tips%2Fsmoothie-rs+path%3A*.rs+recipe.get&type=code)

---

## :material-blur-linear: frame blending { #frame-blending }

`[frame blending]` is just like blur's `- blur` config category, VEGAS' smart resampling, and FFmpeg's `tmix` filter - but much faster. It averages every frame with it's neighboring frames, that makes motion trails and if done correctly looks like realistic motion-blur.

<iframe width="688" height="387"  src="/assets/videos/video/smoothie/frameblending.mp4" frameborder=0></iframe>

On the left is a 240FPS video, and on the right a 60FPS video with frame blending, this is not a pretty example but that shows you how the frames actually end up squished in a lower FPS


!!! note "Using velocity on frame-blended footage in video-editors"

    If you like running your clips through Smoothie before editing them, you can tweak the aforementioned settings like so:

    Setting the `fps `to 120, 180 or higher depending on how so you wanna go

    Raising the `blur intensity` to 2.5 or even higher depending on your taste

    And then doing frame blending / smart resampling again in the editor

`enabled`: yes

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter.

`fps`: 60

:   Output framerate, this and `intensity` affects the number of neighboring frames (weights) to average, after blending the video is capped to such fps value.

`intensity`: 1.0

:   How intense the frame blending looks, this is identical to blur's `blur amount`.

`weighting`: equal

:   'Weights' are each blended frame, this option changes the opacity of each weight, you can make them manually `[1.0, 1.0, 1.0, 1.0, 1.0]` or choose from [the available presets](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/weighting.py):
    
    * `equal`
    * `vegas`: Matches VEGAS Pro smart resampling's weights closest (when used with 1.0 intensity)
    * `gaussian`: Ascending gaussian curve
    * `gaussian_sym`: Symmetrical gaussian curve
    * `ascending`: my personal favorite, i like to pair it with a higher intensity
    * `descending`
    * `pyramid`: Opacity peaks at the middle
    * `custom`: (VERY NERDY) any Python expression (with [restricted namespace](https://github.com/couleur-tweak-tips/smoothie-rs/blob/f04526681aecf6564d5b83f5a7c8d35edeb8bf2f/target/scripts/weighting.py#L116-L144)), e.g. `custom; func = x**2`

    (ALSO VERY NERDY) for `gaussian`, `gaussian_sym`, and `custom`, you can change the apex, bound, and standard deviation like so:
    `gaussian; apex = 2; bound = [0,2]; std_dev = 1`

    Comparison of how `equal` and `ascending` look:

    <iframe width="297" height="313" src="/assets/videos/video/smoothie/weights.mp4" frameborder=0></iframe>

`bright blend`: no

:   Makes the blending look similar to Premiere Pro's frame blending (in a good way), It's comparable to blending two images with additive mode, slower than non-bright, it's achieved bby temporarily converting the clip to RGB48 color space during blending, s/o Zaphyr


## :material-select-multiple:  interpolation { #interpolation }

<div class="annotate" markdown>* Motion-estimation tricks to create frames between existing ones, almost like magically increasing the framerate, this creates imperfect frames which inevitably have what we call artifacts, e.g smearing on static (HUD / overlay) parts and fast movement can look cursed with a low-fps input. "interpolation" in Smoothie is done with old non-DRM'd builds of [SVPFlow](https://github.com/couleurm/VSBundler/blob/main/smCi.ps1#L29). Also see their [wiki](https://www.svp-team.com/wiki/Manual:SVPflow). </div>

It's recommended to record in the highest fps possible, (**at least 120FPS** for ok results). If you're going to interpolate only with SVPFlow, lower frame rates like 60FPS [often look worse than the raw clip](https://www.youtube.com/watch?v=QihBOhLzQj8).


<iframe width="485" height="387"  src="/assets/videos/video/smoothie/interpolation.mp4" frameborder=0></iframe>


Also see [pre-interp](#pre-interp), a slower, more accurate interpolation method


`enabled`: yes

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter.

`masking`: yes

: Whether or not you wish to use artifact masking, note if artifact masking is disabled in it's category this setting won't matter.

`fps`: 960

: Frame rate you want to interpolate to.

`speed`: medium

: Defines the accuracy of the interpolation calculations, affecting the rendering speed in the process, available values:

    * `medium` (most accurate)
    * `fast`
    * `faster`
    * `fastest` (least accurate)

`tuning`: weak

:   Tunes the settings for the type of content. From [InterFrame2's docs](https://www.spirton.com/uploads/InterFrame/InterFrame2.html):

    * `animation` - I've never seen it used for gameplay.
    * `film` - This offers a good balance between the accuracy of individual moving things and the cohesiveness of the frame.
    * `smooth` - This increases the accuracy of individual moving things while decreasing the cohesiveness of the frame.
    * `weak` - This decreases the accuracy of individual moving things while increasing the cohesiveness of the frame.
        * Note: This will weaken the interpolation a lot, meaning the motion isn't as smooth.

    Most people prefer `weak`, some like `film` for low-fps input.

`algorithm`: 23

:   Sets the algorithm. Taken from same docs:



    * `1` - Not recommended. Sharp picture, no blending, but moves pixels from previous frame to next using only data from previous frames.
    * `2` - Only recommended for 2D animation. Like 1 but uses the next frame too.
    * `11` - Almost as good as 13; uses a time-weighted blend of both forward and backward vectors.
    * `13` - Best option for low framerate input. 11 but with a dynamic median. Minimal artifacting, but halos can appear around moving objects.
    * `21` - 11 but with masking, which can reduce halos.
    * `23` - "Smoothest" but can cause slight artifacts. 21 but with extra data from adjacent frames.
    
    Most people use 23 / 13.

`block size`: auto

:   Defines block sizes for block matching algorithm, either 8x8, 16x8, 16x16, 32x16 or 32x32

    Bigger is faster but creates worse frames.

    More info: <https://www.svp-team.com/wiki/Manual:SVPflow> (<kbd>CTRL+F</kbd> "`h: `" to find more info about it)

`use gpu`: no

:   Whether or not to use GPU (video card) alongside CPU to accelerate conversion and improve quality.
    This is turned off by default for compatibility but I suggest turning it on.

    Note: This mode may run slower, while it is doing calculations much faster, it is also doing more complicated calculations to improve quality.

`area`: 0

:   Sets the strength of the area mask, I recommend keeping this at `0`. Higher values will reduce artifacts, but greatly reduce smoothness.

## :material-motion: flowblur { #flowblur }

Most easily comparable to Reel Smart Motion blur (RSMB), it often creates even more artifacts than interpolation (artifact masking recommended).

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter.

`masking`: yes

: Whether or not you wish to use artifact masking, note if artifact masking is disabled in it's category this setting won't matter.

`amount`: 100

: Strength of the blur, 0 is nothing and 200 is the max.

`do blending`: after

: In which order to do frame blending and Flowblur:
    * `after`: slower, frame blending is done AFTER applying Flowblur, to use if you wish to replicate [Freeman's Mind motion blur](https://youtu.be/2Rtqm8U7CC8?t=89).
    * `before`: faster & most similar to RSMB, frame blending is done BEFORE applying Flowblur.

## :material-play-box-outline: output { #output }

If you want to see how much the encoding process slows down rendering speed, try out [`--tonull`](./cli.md)

`process`: ffmpeg

:   File path to the FFmpeg executable, it defaults to just trying to call it from PATH, if you configure it's other arguments you could use any other CLI encoder that accepts YUV4MPEG input from STDIN

`enc args`: H264 CPU

:   FFmpeg CLI encoding arguments, for convenience you can use the presets which are all stored in [encoding_presets.ini](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini).

    If you didn't understand what any of this means, I'd recommend giving [<u>Which codec should I use?</u>](../codecguide.md) a read.

    Tip: Adding `4K` at the end will expand to the arguments necessary to [upscale your video to 4K](../ffmpeg/upscaling.md)


`container`: MP4

:   Video container format, defaults to MP4.

    To contain the UTVideo codec you'll need to switch to .AVI or .MKV 
    
    You can use .MKV to read what's already been rendered before it finishes rendering.

`file format`: %FILENAME% ~ %FRUIT% %OUTPUT_FPS%

:   Output filename formatting, not used if `-o` / `--output` is already specified

    * %FILENAME% is the output file base name (without the extension)

    * %FRUIT% will expand to a random fruit from [this list](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/video.rs#L92-L101) 😋

    * Other values of the recipe can be used, see how it's implemented [here](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/video.rs#L140)

## :material-monitor-eye: preview window { #preview-window }

Makes FFmpeg output the rendered video live to ffplay, a video player which is almost always shipped alongside FFmpeg.

Press <kbd>F</kbd> to toggle fullscreen, <kbd>SPACE</kbd> to pause, <kbd>ESC</kbd> or <kbd>q</kbd> to quit

It can be closed without crashing, sometimes an error will show, but it doesn't affect if your video is rendered or not.

It has a few other miscellaneous [keyboard shortcuts](https://ffmpeg.org/ffplay.html#While-playing)

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter.

`process`: ffplay

:   File path of executable to pipe to, if you use mpv render speed will max out at real-time (1.0x). 

`output args`: -f yuv4mpegpipe -

:   Additional arguments to append to ffmpeg's arguments to create a second output stream, you can find modify the ffplay arguments in [[miscellaneous]](#miscellaneous)

## :fontawesome-regular-object-ungroup: artifact masking { #artifact-masking }

When using interpolation, flowblur, or pre-interpolation, you have the choice to not apply any of these effects on specific regions of the video with artifact masks, they're images with black and white regions. The black regions revert the effect it's applied on (remember all these `masking: yes` values? That's how you individually toggle masking).

They're resolution specific, Smoothie will crash if you pair 1280x720 videos with 1920x1080 masks.

<iframe width="688" height="387" src="https://www.youtube.com/embed/5GW2TUx78WY?start=20&color=white" frameborder=0 allowfullscreen></iframe>


`enabled`: no

:   Globally toggle artifact masking, if disabled the rest of this category does not matter.

`feathering`: yes

:   If you have colors between white and black (e.g doing grey gradients) turn this on to support this, the darker the pixel color the lower the effect's opacity.

`folder path`: empty by default, example: D:\smrs\masks\

:   Path to the folder where you wish to store your artifact masking images, you can easily get it by shift-right clicking that folder -> Copy as path.

`file name`: empty by default, example: overwatch.png

:   The name of the mask image file to use.

## :material-dots-horizontal: miscellaneous { #miscellaneous }

`source plugin`: lsmash

:   Which VapourSynth source plugin to use, either [`ffms2`](https://github.com/FFMS/ffms2), [`lsmash`](https://github.com/AkarinVS/L-SMASH-Works) or [`bestsource`](https://github.com/vapoursynth/bestsource), the latter may work better with AV1, but is much slower to index, if you lsmash works and you mind the long bestsource indexing times, switch to lsmash

`play ding`: no

:   Supposed to play `C:\Windows\Media\ding.wav` with ffplay once Smoothie is done rendering, not yet implemented from smoothie-py.

`always verbose`: no

:   Equivalent to if you always passed `--verbose` to the arguments (though prefer actually using the argument as it activates verbose logging earlier, logs even more data).

`dedup threshold`: 0.0

:   Rarely used because heard to measure, it's [a plugin](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/filldrops.py) which tries to guess which frames are duplicated due to encoding lag and replaces them by interpolated ones.

`global output folder`:

:   By default Smoothie outputs to the same directory as the input file with `[output] file format:`.

`source indexing`: no

:   Index the input clips, making a cache in %TEMP%, this is useful to enable if you are rendering a clip multiple times.

`ffmpeg options`: -loglevel error -i - -hide_banner -stats -stats_period 0.15

:   Arguments first passed to ffmpeg.

`ffplay options`: -loglevel quiet -i - -autoexit -window_title smoothie.preview

:   Arguments passed to ffplay when the [preview window](#preview-window) is enabled, see [ffplay.html#Main-options](https://ffmpeg.org/ffplay.html#Main-options)

## :material-console: console { #console }

On Windows you can customize the terminal window's behavior (Meant to be used with `conhost.exe`, they switched to the default to the fancier Windows Terminal on Windows 11).

Windows Terminal does not behave well with this.

`stay on top`: no

:   Make the window stay on top, can still be minimized.

`borderless`: yes

:   Hide the window title bar, you can't move the window but can still minimize it by clicking the window from the taskbar.

`position`: top left

:   Move the taskbar to a corner of your main display.

`width`: 900
`height`: 350

:   Dimensions of the window.

## :material-sort-clock-ascending-outline: timescale { #timescale }

`in`: 1.0

:   Input speed, e.g if your input clip was recorded at 10% of it's speed you can speed it 10x by typing 0.1.
`out`: 1.0

:   Output speed, e.g if you wanna speed it up a bit you can do a lil' 1.03. 😼

## :material-eyedropper-plus: color grading { #color-grading }

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter.


`brightness` / `saturation` / `contrast` / `hue`: 1.0

:   Very self-explanatory, controls the color settings of the output video.

## :material-invert-colors: LUT { #LUT }

[Look up table](https://en.wikipedia.org/wiki/Lookup_table#Lookup_tables_in_image_processing) filter, they're kinda like color filters to make colors exactly accurate to a standard, but we nerds mostly use it for cool color grades :)

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter.

`path`: <empty by default>

:   Full file path to the LUT filter (.cube).

`opacity`: 0.20

:   Opacity of the filter.

## :material-chart-timeline: pre-interp { #pre-interp }

Pre-interpolation uses [RIFE NCNN Vulkan](https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan) to do interpolation, in the filter chain it's applied before [interpolation](#interpolation) hence the term "pre-".

It's very slow to use, see how to install the models [here](./installation.md#installing-rife-models)

NCNN is used instead of RIFE for the much smaller dependencies (CUDA is like 5GB °O°).

!!! danger "Some color formats fail to convert and make pre-interp crash"

    Depending on how you configure your colors in :obs-logo: [OBS' Advanced settings tab](../obs/advanced.md),
    
    Pre-interp may not work with them, it's currently [an open issue on the repository](https://github.com/couleur-tweak-tips/smoothie-rs/issues/36)

    I invite you to try fiddling around until you see what works, sRGB space & Limited range works for me

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter.

`masking`: n

: Whether or not you wish to use artifact masking, note if artifact masking is disabled in it's category this setting won't matter.

`factor`: 3x

:   How much you wish to multiply the input FPS by and interpolate to that, e.g. if the video's input fps is 60 and the factor is 3: 60 x 3 = it'll interpolate 180fps

`model`: rife-v4.4

:   Path to the RIFE model folder, they do not ship with Smoothie, see [installation instructions](./installation.md#installing-rife-models)


## Using multiple recipe files

1. Make a copy of `recipe.ini` and name it something else
2. Make a copy of the shortcut you use Smoothie with
3. Add `--recipe name.ini` to the arguments (for [Send To shortcuts](./installation.md#making-a-send-to-shortcut) make sure it's before `-i`, that one must be the last).
