---
description: Differences between Smoothie and blur
icon: custom/blur
---


Related: You can use the [converter](./converter/index.html) to convert ``.blur-config.cfg`` files to smoothie `recipe.ini` files

## Which is better/should I use?

blur and Smoothie are very similar under the hood, both use VapourSynth with very similar plugins, this page lists all the differences you'll encounter so you can make up your mind.

!!! warning "This page is intended for existing blur users"

    This explains the design choices I've taken while inspiring myself from blur during Smoothie's development, if you've never got familiar with it before there's little use in reading the rest of this page (except if you're trying to make a recipe look identical to a blur config)

## Smoothie pros

* Smoothie [recipe values are optional](./recipe.md#smoothie-recipe)

* Smoothie has a much smoother [preview window](./recipe.md#preview-window) using ffplay.

* Smoothie has [artifact masking](./recipe.md#artifact-masking)

* Smoothie has [flowblur](./recipe.md#artifact-masking)

* Smoothie has [RIFE pre-interpolation](./recipe.md#pre-interp), it's not in blur since [beta v1.92](https://github.com/f0e/blur/releases)

* A plethora of [CLI arguments](./cli.md)

## blur pros

* Percentage progress and a drag-and drop queue system, I prefered making a file picker for Smoothie

* Global / per folder config system

## Terms used

* blur's config has a category named `- blur` which I consider to be redundant, it's been renamed to a more comprehensive `[frame blending]`

* the `blur amount` value in previously mentioned category has also been renamed to `intensity`, I'm looking for a better term than that, [lmk 👁👁](../../contact.md#couleur)

### Features now back ported to blur

since [beta v1.92](https://github.com/f0e/blur/releases) a lot of the features that made smoothie different are now included in blur:

* ~~Frame blending is faster on Smoothie~~  [tekno copied over the code](https://github.com/f0e/blur/blob/master/plugins/blending.py)

* ~~Smoothie has a non-hardcoded vpy script to modify, blur appends hard coded python code to a temp file~~

* ~~Smoothie has one global config, blur looks if there's a config in the same dir as the input files~~ in blur v1.92 tekno added a global config option if none were found in dir, I should copy that too 😋

## Internals

[blur](https://f0e.github.io/blur), [Smoothie](./index.md) & [teres](https://github.com/animafps/teres) all make use of these two programs:

* VapourSynth is a video filtering library with a Python scripting front-end
* FFmpeg is used to package VSPipe's uncompressed Y4M stream into encoded videos

## Timeline

* June 2020: blur got created on GitHub

* January 2022: blur was dormant since v1.8, I made a fork of blur named smoothie in Python  

* February 2022: another developer named Anima made teres, a rewrite of blur in Rust

* January 2023: Seeing teres I made smoothie-rs, deprecating the original Smoothie, renamed to smoothie-py

* April 2024: First egui source code was pushed in the smoothie-rs repository

* January 2025: Hqzki/hybridkernel made smoothie-go because « he felt like it »

Today blur's new beta makes it's internals more similar to Smoothie than teres was to blur.

~~teres' main advantage is that it's available in the [Arch user repository](https://repology.org/project/teres/versions).~~  [smoothie-rs now also is](https://aur.archlinux.org/packages?K=smoothie-rs)
