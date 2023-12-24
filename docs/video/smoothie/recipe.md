---
description: Explanation of Smoothie's recipe (config file)
icon: simple/googlesearchconsole
---

# Smoothie recipe

The recipe (config file) is Smoothie's hardest part of it's learning curve, reading this and messing around with short clips is the best way to familiarize yourself with it. 

The values which can be turned on or off (booleans) have a bunch of aliases for convenience, I advise typing y/n or 1/0 for short

If there are some feature you're not interested in using, feel free to remove them from the file, it won't break a thing and act like you disabled it(1)
{ .annotate }

1. Smoothie loads `defaults.ini` into a hashmap, which is just like the user's `recipe.ini` but with everything disabled / max compatibility, then it overrides the values in that hasmap that exist with `recipe.ini` / whatever specified ini file

<br>

Here's what each file is for:

* [`recipe.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/recipe.ini)

:   This is the default config file used which you are supposed to edit.

* [`defaults.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/defaults.ini)

:   Backup of all existing settings, it is loaded first then overwrote by `recipe.ini`, this makes it so you're able to remove unused.

* [`encoding_presets.ini`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini)

:   Preset=value config file for [encoding](#output)

* [`jamba.vpy`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/jamba.vpy)

:   The [VapourSynth script](https://www.vapoursynth.com/doc/gettingstarted.html#example-script) Smoothie uses, you can read how each config value is used. Having it out here means nothing prevents you from installing extra plugins in `/bin/vapoursynth64/plugins/` and wiring your own recipe ingredients. Though there are some [hardcoded recipe checks](https://github.com/search?q=repo%3Acouleur-tweak-tips%2Fsmoothie-rs+path%3A*.rs+recipe.get&type=code)

---

## :material-blur-linear: frame blending { #frame-blending }

Just like blur's "blur" config category, VEGAS' smart resampling and FFmpeg's `tmix` filter but much faster, this averages every frame with it's neighboring frames, creating trails and if done correctly looks like realistic motion-blur.

This is almost always done on only on a fourth / eight ect.. of the frames and intended to be viewed at conventional frame rates

<iframe width="688" height="387"  src="/assets/videos/video/smoothie/frameblending.mp4" frameborder=0></iframe>

On the left is a 240FPS, and on the right a 60FPS video with frame blending, this is not a pretty example but that shows you how the frames actually end up squished in a lower FPS


!!! note "Using velocity on frame-blended footage in video-editors"

    If you like running your clips through Smoothie before editing them, you can tweak the aforementioned settings like so:

    Setting the `fps `to 120, 180 or higher depending on how so you wanna go

    And most importantly raising the `blur intensity` to 2.5 or even higher depending on your taste

`enabled`: yes

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter

`fps`: 60

:   Output framerate to cap to, this does not affect how the frame blending is applied [in the code](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/target/jamba.vpy#L350)

`intensity`: 1.0

:   Multilied factor of how much frame blending weights to apply is calculated by diving the input FPS (or interpolated if configured) by the output FPS, e.g (240/60)\*<u>1.0</u> = 4, this is identical to blur's `blur amount`

`weighting`: equal

:   Opacity curve of each weight, you can make them manually `[1.0, 1.0, 1.0, 1.0, 1.0]` or choose from [the available presets](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/weighting.py):
    
    * `equal`
    * `vegas`
    * `gaussian`
    * `gaussian_sym`
    * `ascending`: my favorite, i like to pair it with a higher intensity
    * `descending`
    * `pyramid`: opacity peaks at the middle
    * `custom`: ill leave the explanation to nerd weighter atzur

    Comparison of how `equal` and `ascending` look:

    <iframe width="297" height="313" src="/assets/videos/video/smoothie/weights.mp4" frameborder=0></iframe>


`bright blend`: no

:   Enablines this slows down rendering. Converts to RGB48 color space before blending, it makes it look akin to Premiere Pro's frame blending (in a good way), I guess it's comparable to blend two images with additive mode


## :material-select-multiple:  interpolation { #interpolation }

Motion-estimation tricks to create frames between existing ones, almost if like magically increasing the framerate, this creates imperfect frames which inevitably  have what we call artifacts, e.g smearing on static (HUD / overlays) parts and fast movement can look cursed with low fps input. "interpolation" in Smoothie is done with old non-DRM'd builds of [SVPFlow](https://github.com/couleurm/VSBundler/blob/main/smCi.ps1#L29) also see their [wiki](https://www.svp-team.com/wiki/Manual:SVPflow)


<iframe width="485" height="387"  src="/assets/videos/video/smoothie/interpolation.mp4" frameborder=0></iframe>

Also see [pre-interp](#pre-interp), a different internal methodology


`enabled`: yes

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter

`masking`: yes

: Whether or not you wish to use artifact masking, note if artifact masking is disabled in it's category it'll be considered off

`fps`: 960

: Frame rate you want to interpolate to

`speed`: medium

: Defines the accuracy of the interpolation calculations, affecting the rendering speed in the process, available values:

    * `medium`
    * `fast`
    * `faster`
    * `fastest`

`tuning`: weak

:   Adapted from [InterFrame2's docs](https://www.spirton.com/uploads/InterFrame/InterFrame2.html): Tunes the settings for the type of content.

    * Film - This offers a good balance between the accuracy of individual moving things and the cohesiveness of the frame.
    * Animation - I've never seen it used for gameplay, 
    * Smooth - This increases the accuracy of individual moving things while decreasing the cohesiveness of the frame.
    * Weak - This decreases the accuracy of individual moving things while increasing the cohesiveness of the frame.
        * Note: This will weaken the interpolation a lot, meaning the motion isn't as smooth.

    Most people prefer weak, some like film for low fps input

`algorithm`: 23

:   Taken from same docs, sets the algorithm.

    * 2 - This makes strong predictions which can be useful for cartoons but can also leave big artifacts
    * 13 - This is the most intelligent algorithm since it masks many artifacts, but it is not as smooth as 23
    * 23 - This is the smoothest algorithm, but it does not have the artifact masking that 13 has
    
    Most people use 23 / 13

`use gpu`: no

: This is turned off by default for compatibility but I suggest turning it on, IF2 docs:

    Whether or not to use GPU (video card) alongside CPU to accelerate conversion and improve quality.
    
    Note: This mode may run slower. This is because while it is doing calculations much faster, it is also doing more complicated calculations to improve quality.

## :material-motion: flowblur { #flowblur }

Most easily comparable to Reel Smart Motion blur (RSMB), like interpolation it also causes artifacts.

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter

`masking`: yes

: Whether or not you wish to use artifact masking, note if artifact masking is disabled in it's category it'll be considered off

`intensity`: 100

: Strengh of the blur, 0 is nothing and 200 is the max

`do blending`: after

: In which order to do frame blending and Flowblur:
    * `after`: slower, frame blending is done AFTER applying Flowblur, to use if you wish to replicate [Freeman's Mind motion blur](https://youtu.be/2Rtqm8U7CC8?t=89)
    * `before`: faster & most similar to RSMB, frame blending is done BEFORE applying Flowblur

## :material-play-box-outline: output { #output }

If you wish to disable output to test render speed without being slowed down by encoding, use [`--tonull`](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/src/cli.rs)

`process`: ffmpeg

:   File path to the FFmpeg executable, it defaults to just trying to call it from PATH, if you configure it's other arguments you could use any other CLI encoder that accepts YUV4MPEG input from STDIN

`enc args`: H264 CPU

:   FFmpeg CLI encoding arguments, for convenience you can use the presets which are all stored in [encoding_presets.ini](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/encoding_presets.ini), 

    if you didn't understand what any of this means give [<u>Which codec should I use?</u>](../codecguide.md) a read.

    Adding `4K` will expand to the arguments necessary to (up)scale to 4K

`container`: MP4

:   Video container format, defaults to MP4

    To contain the UTVideo codec you'll need to switch to AVI or MKV. 
    
    You can use Matroska (MKV) to be able to read what's already been rendered of the video before it finished rendering

`file format`: %FILENAME% ~ %FRUIT% %OUTPUT_FPS%

:   Output filename formatting, not used if `-o` / `--output` is already specified

    * %FILENAME% is the output file base name (without the extension)

    * %FRUIT% will expand to a random fruit from [this list](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/video.rs#L92) 😋

    * Other values of the recipe can be used, see how it's implemented [here](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/video.rs#L140)

## :material-monitor-eye: preview window { #preview-window }

Makes FFmpeg output the video to a second stream, piped to ffplay, an video player which is almost always shipped alongside ffmpeg.

It can be closed off without crashing, it's just got some ignore file you can safely ignore.

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter

`process`: ffplay

:   File path of executable to pipe to, if you use mpv render speed will max out at real-time (1.0x) 

`output args`: -f yuv4mpegpipe -

:   Additional arguments to append to ffmpeg's arguments to create a second output stream

## :fontawesome-regular-object-ungroup: artifact masking { #artifact-masking }

When using pre-interpolation, interpolation or flowblur you have the choice to not apply any of these effects on specific regions of the video with artifact masks, they're images with black and white regions and the black regions revert the effect it's applied on (remember all these `masking: yes` values? That's how you individually toggle masking)

They're resolution specific, smoothie will crash if you pair 1280x720 videos with 1920x1080 masks

<iframe width="688" height="387" src="https://www.youtube.com/embed/5GW2TUx78WY?start=20&color=white" frameborder=0 allowfullscreen></iframe>


`enabled`: no

:   Globally toggle artifact masking, if disabled the rest of this category does not matter

`feathering`: yes

:   If you have colors between white and black (e.g doing grey gradients) turn this on to support this, the darker the pixel color the lower the effect's opacity.

`folder path`: empty by default, example: D:\smrs\masks\

:   Path to the folder where you wish to store your artifact masking images, you can easily get it by shift-right clicking that folder -> Copy as path

`file name`: empty by default, example: overwatch.png

:   The name of the mask image file to use

## :material-dots-horizontal: miscellaneous { #miscellaneous }

`play ding`: no

:   Supposed to play `C:\Windows\Media\ding.wav` with ffplay once Smoothie is done rendering, still not yet implemented from smoothie-py

`always verbose`: no

:   Equivalent to if you always passed `--verbose` to the arguments (though recipe parsing verbose stuff won't be logged since it hasn't reached the point to where it parses the recipe to enable verbosity)

`dedup threshold`: 0.0

:   Rarely used because heard to measure, it's [a plugin](https://github.com/couleur-tweak-tips/smoothie-rs/blob/main/target/scripts/filldrops.py) which tries to guess which frames are duplicated due to encoding lag and replaces them by interpolated ones 

`global output folder`:

:   By default Smoothie outputs to the same directory as the input file with `[output] file format:`

`source indexing`: no

:   Index the input clips, making a cache in %TEMP%, this is useful to enable if you are rendering a clip multiple times

`ffmpeg options`: -loglevel error -i - -hide_banner -stats -stats_period 0.15

:   Arguments first passed to ffmpeg 

`ffplay options`: -loglevel quiet -i - -autoexit -window_title smoothie.preview

:   Arguments first passed to ffplay when the preview window is enabled

## :material-console: console { #console }

On Windows you can customize the terminal window's behavior (Meant to be used with `conhost.exe`, they switched to the default to the fancier Windows Terminal on Windows 11)

Windows Terminal does not behave well with this

`stay on top`: no

:   Make the window stay on top, can still be minimized

`borderless`: yes

:   Hide the window title bar, you can't move the window but can still minimize it by clicking the window from the taskbanr

`position`: top left

:   Move the taskbar to a corner of your main display

`width`: 900
`height`: 350

:   Dimensions of the window

## :material-sort-clock-ascending-outline: timescale { #timescale }

`in`: 1.0

:   Input speed, e.g if your input clip was recorded at 10% of it's speed you can speed it 10x by typing 0.1
`out`: 1.0

:   Output speed, e.g if you wanna speed it up a bit you can do a lil' 1.03 😼

## :material-eyedropper-plus: color grading { #color-grading }

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter


`brightness`: 1.0
`saturation`: 1.0
`contrast`: 1.0

## :material-invert-colors: LUT { #LUT }

[Look up table](https://en.wikipedia.org/wiki/Lookup_table#Lookup_tables_in_image_processing) filter, they're kinda like color filters to make colors exactly accurate to a standard, but we nerd mostly use it for cool color grades :)

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter

`path`: <empty by default>

:   Full file path to the LUT filter, (.cube)

`opacity`: 0.20

:   Opacity of the filter

## :material-chart-timeline: pre-interp { #pre-interp }

Pre-interpolation uses [RIFE NCNN Vulkan](https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan) to do interpolation, in the filter chain it's applied before [interpolation](#interpolation) hence the term "pre-"

It's very very slow to use, see how to get them [here](./installation.md#making-a-send-to-shortcut-and-rife-models)

NCNN is used instead of RIFE for the much smaller dependencies (CUDA is like 5GB °O°, blur used to have an option for it, never managed to get it working)

!!! danger "Some color formats fail to convert and make pre-interp crash"

    Depending on how you configure your colors in [:obs-logo:  OBS' Advanced settings tab](../obs/advanced.md),
    
    Pre-interp may not work with them, it's currently [an open issue on the repository](https://github.com/couleur-tweak-tips/smoothie-rs/issues/36)

    I invite you to try fiddling around until you see what works, sRGB space & Limited range works for me

`enabled`: no

:   Whether or not you wish to enable this setting, if disabled the rest of this category does not matter

`masking`: n

: Whether or not you wish to use artifact masking, note if artifact masking is disabled in it's category it'll be considered off

`factor`: 3x

:   How much you wish to multiply the input FPS by and interpolate to that, e.g if the video's input fps is 60 and the factor is 3: 60 x 3 = it'll interpolate 180fps

`model`: rife-v4.4

:   Path to the RIFE model folder, they do not ship with Smoothie, see a video tutorial [here](https://youtu.bhe/RfPDgoMuSWg?t=72)

    You can download a pack of them here (~400MB):

    https://github.com/nihui/rife-ncnn-vulkan/releases

    And some more recent ones there, individual links (~20MB/model):

    https://github.com/hzwer/Practical-RIFE#model-list

    Then extract and move each individual foldfers in /rife models/ 

    RIFE Models don't come included with Smoothie because:
        * Licensing
        * Size, not everyone uses them
        * They're not that hard to download, unzip and place in /models/

## Using multiple recipe files

1. Make a copy of `recipe.ini` and name it something else
2. Make a copy of the shortcut you use Smoothie with
3. Add `--recipe name.ini` to the arguments (for [Send To shortcuts](./installation.md#making-a-send-to-shortcut-and-rife-models) make sure it's before `-i`, that one must be the last)