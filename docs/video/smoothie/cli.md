---
description: Explanations for each of smoothie's CLI arguments
icon: octicons/terminal-16
---

# Command line arguments


`-i/--input`: file path(s)

:   Specify input video file paths, use quotes if they contain spaces.

`-o/--output`: file path

:   Specify a <u>single</u> output video's path (do not use if multiple paths are supplied in `--input`, consider `--outdir`).

`-t/--tui`: bool

:   Makes Smoothie behave like an app instead of a CLI tool (e.g pause before exiting on an error).

`--outdir`: folder path

:   Specify output directory for all queued files, overrides [`[miscellaneous] global output folder:`](./recipe.md#miscellaneous).

`--peek`: int

:   Render out frame number specified as an image file, useful when peeking to see what a frame will look like with a very slow recipe. This is passed to both `--start` and `--end` to VSPipe and does not mess up any temporal filters afaik.

`--vpy`: file path

:   Override the default vapoursynth python script to use (default: jamba.vpy).


`--stripaudio`: bool

:   No audio tracks will be added back when encoding the output video.


`--tonull`: bool

:   Makes VSPipe output to null (just adds `.` to arguments instead of piping Y4M to ffmpeg).


`--tompv`: bool

:   Redirects Y4M output to mpv, simple implementation: [it tries to grab it from PATH](https://github.com/couleur-tweak-tips/smoothie-rs/blob/5bedf4ff231fd56832deacf4e32c5eb9f640c004/src/cmd.rs#L26).

`--json`: string

:   Trimming timecodes payload for [suckless-cut](https://github.com/couleur-tweak-tips/suckless-cut), not fully ported from smoothie-py yet.


`--trim`, `--padding`: bool

:   Trimming behavior, not fully ported from smoothie-py yet.


`--rerun / -!!`: bool

:   Each time Smoothie runs, it dumps all arguments to `last_args.txt`, if smoothie crashes and you had given it a bunch of arguments that you lost, use this argument to grab them back, inspired from bash syntax e.g `sudo !!`.

`--encargs`: string

:   Overrides [`[output] enc args:`](./recipe.md#output).

`-v/--verbose`: bool

:   Prints verbose information, useful for debugging / curious folk.

<!-- --debug         Prints all the nerdy stuff to find bugs.NOT IMPLEMENTED YET -->


`-r/--recipe`: file path

:   Specify a recipe path, defaults to recipe.ini.


`--override`: string

:   Override any recipe settings, e.g. `--override "flowblur;amount;40"`, can be used multiple times.
