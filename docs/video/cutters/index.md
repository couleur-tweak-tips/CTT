---
icon: material/movie-cog
---

# Video cutters vs NLEs

VEGAS, Premiere, After Effects, Davinci Resolve.. all these NLEs re-encode your videos upon exporting your project.

This is because they need to decode it in order to perform the actual "editing" of the video you've fed it.

In specific edgecases that do not require all the bells and whistles of a video editor, video cutters can be a life saver:

| Ops & cons         | NLE re-encoding                                                        | Video cutters                      |
|--------------------|------------------------------------------------------------------------|------------------------------------|
| Render times       | Will always be slower                                                  | Lightning fast                     |
| What can be edited | Literally everything                                                   | You can only cut from point A to B |
| Format             | Unless encoding in lossless you'll always lose a little bit of quality | Lossless!                          |

e.g you have videos with very little parts of them actually relevant (e.g archiving highlights from stream VODs)

### :material-format-list-checks: What video cutters are there?

A lot more of them exists, but I'll cover both ends of the spectrums in terms of UI-snappiness to feature ratio:

* [LosslessCut](./losslesscut.md) is an electron-based user interface for cutting videos,
* [Avidemux](./avidemux.md) is much snappier and acts as a basic front-end to cutting from the command-line with FFmpeg

not documented on [ctt.cx](#):

* [suckless-cut](https://github.com/couleur-tweak-tips/suckless-cut): mpv lua script that replicates LosslessCut, I designed it to export directly to smoothie-rs
* [vidcutter](https://github.com/ozmartian/vidcutter): python gui which uses mpv?? todo: add a proper description, i (couleur) never used it much