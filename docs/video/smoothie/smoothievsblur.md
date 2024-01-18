---
description: Differences between Smoothie and blur
icon: custom/blur
---

## Which is better/should I use?

Blur and Smoothie are very similar under the hood, both use VapourSynth with very similar plugins, this page lists all the differences you'll encounter so you can make up your mind.

!!! warning "This page is intended for existing blur users"

    This explains the design choices I've taken while inspiring myself from Blur during Smoothie's development, if you've never got familiar with it before there's little use in reading the rest of this page (except if you're trying to make a recipe look identical to a blur config)

## Smoothie pros

* Smoothie [recipe values are optional](./recipe.md#smoothie-recipe)

<!--
Smoothie has a much smoother [preview window](./recipe.md#preview-window) using ffplay.

doesn't matter much, ur kinda glazing ngl-->

* Smoothie has [artifact masking](./recipe.md#artifact-masking)

* Smoothie has [flowblur](./recipe.md#artifact-masking)

* Smoothie has [RIFE pre-interpolation](./recipe.md#pre-interp), it's not in blur since [beta v1.92](https://github.com/f0e/blur/releases)

* A plethora of [CLI arguments](./cli.md)

## Blur pros

* Percentage progress and a drag-and drop queue system, I prefered making a file picker for Smoothie

* Global / per folder config system

## Terms used

* Blur's config has a category named `- blur` which I consider to be redundant, it's been renamed to a more comprehensive `[frame blending]`

* the `blur amount` value in previously mentioned category has also been renamed to `intensity`, I'm looking for a better term than that, [lmk 👁👁](../../contact.md#couleur)

<!-- 
### Features back ported to blur

since [beta v1.92](https://github.com/f0e/blur/releases) a lot of the features that made smoothie different

* ~~Frame blending is faster on Smoothie~~  [Tekno copied over the code](https://github.com/f0e/blur/blob/master/plugins/blending.py)

* ~~Smoothie has a non-hardcoded vpy script to modify, blur appends hard coded python code to a temp file~~

* ~~Smoothie has one global config, blur looks if there's a config in the same dir as the input files~~ in blur v1.92 he added a global config option if none were found in dir, I should copy that too 😋


everything in here is crossed off... why even have the section anymore??-->

## Internals

[Blur](https://f0e.github.io/blur), [Smoothie](./index.md) & [Teres](https://github.com/animafps/teres) all make use of these two programs:

* VapourSynth is a video filtering library with a Python scripting front-end
* FFmpeg is used to package VSPipe's uncompressed Y4M stream into encoded videos

## Timeline

* June 2020: Blur got created on GitHub

* January 2022: Blur was dormant since v1.8, I made a fork of blur named smoothie in Python  

* February 2022: another developer named Anima made Teres, a rewrite of Blur in Rust

* January 2023: Seeing Teres I made Smoothie-RS, deprecating the original Smoothie, now called Smoothie-PY

Today Blur's new beta makes it's internals more similar to Smoothie than Teres.

Teres' main advantage is that it's available in the [Arch user repository](https://repology.org/project/teres/versions).