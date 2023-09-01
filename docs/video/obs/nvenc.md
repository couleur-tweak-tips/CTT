---
description: OBS configuration for NVIDIA GPUs
icon: simple/nvidia
---

<div class="annotate" markdown>

# :simple-nvidia: NVENC OBS Configuration

## :material-information-box: Information

??? warning "Support"
    NVENC is NVIDIA's on-chip encoder for their desktop graphics cards, with 1000 series GPUs and above considered ideal for high FPS recording.
    
    Check which NVENC features your NVIDIA GPU supports on NVIDIA's [video encode and decode GPU support matrix page](https://developer.nvidia.com/video-encode-and-decode-gpu-support-matrix-new).
    
    If your NVIDIA GPU doesn't support NVENC, try seeing if your iGPU has a hardware encoder or use [CPU x264](/video/obs/x264/) as a last resort.

Before following this, make sure that you've followed the [initial configuration](/video/obs/) first. **Make sure that you test your settings!** See [Replay Buffer](/video/obs/#replay-buffer).

## :material-cog: Configuration

=== "Maximum Performance"
    :material-information-slab-circle: These settings maximize recording performance at high FPS.

    ??? image "Recording Settings"
        <center>
            ![Maximum performance recording settings](/assets/images/video/obs/nvenc/recording_performance.png){ width="600" }
        </center>

    ??? image "Encoder Settings"
        <center>
            ![Maximum performance encoder settings](/assets/images/video/obs/nvenc/encoder_performance.png){ width="600" }
        </center>

    <h3>Recording Settings</h3>

    - **Video Encoder:** Use **NVIDIA NVENC H.264**. (5)  

    <h3>Encoder Settings</h3>

    - **Rate Control:** CQP (6)

    - **CQ Level:** Use **15-18**, with higher being lower quality and lower being better quality. (7)

    - **Keyframe Interval:** Leave at **0 (auto)** for best performance.

    - **Preset:** Use **P1: Fastest (Lowest Quality)** for highest FPS. (9)

    - **Tuning:** Leave on **High Quality**.

    - **Profile:** Use **baseline**. (8)

    - **Look Ahead & Psycho Visual Tuning:** Leave **Off** for max performance. 

    - **GPU & Max B-Frames:** Leave GPU at 0 if single GPU. Leave B-Frames at 0.

=== "Best Filesize"
    :material-information-slab-circle: These settings optimize for smallest files without quality loss.
    
    <h3>Recording Settings</h3>

    - **Video Encoder:** Use **NVIDIA NVENC HEVC** (or **AV1** if you have a 40 series GPU).
        - If you want the best compatibility (including embeds on Discord), use **NVIDIA NVENC H264** at the cost of extra file size.

    <h3>Encoder Settings</h3>

    - **Rate Control:** CQP (3)

    - **CQ Level:** Use **18-23**, with higher being lower quality and lower being better quality. (4)

    - **Preset:** Use **P7: Slowest (Best Quality)**. (1)

    - **Profile:** Use **high**. (2)

</div>

<!-- some things are duplicated as seemingly you can't use an annotation twice -->

1. <font size="3">**:material-account-question: Why this preset?**</font>  
Despite the name, it doesn't affect your video quality when the correct settings are used. Although P1 isn't as efficient (resulting in larger files), it's the fastest preset, resulting in the highest performance.

2. <font size="3">**:material-account-question: Why this profile?**</font>  
Baseline is the simplist profile, lacking some of the more complex/advanced features which we don't need for this type of recording. This results in better performance.

3. <font size="3">**:material-account-question: Why CQP over CBR and VBR?**</font>  
With CQP, bitrate is adjusted for each macroblock in a frame, meaning it requires very little fine-tuning. This is compared to CBR and VBR, which use predefined values for bitrate, which isn't good for gameplay recording.

4. <font size="3">**:material-account-question: Why these particular values?**</font>  
The CQ Level ranges from **0** (lossless, resulting in incredibly huge files) to **30** (very lossy, resulting in small files). Values between 15 and 18 provide both visually lossless quality without the super huge file sizes.

    !!! example ""
        <h4>[:material-arrow-right: Click here to see the Quality vs CQP Level Graph](/assets/images/video/obs/nvenc/quality_vs_cqp.png)</h4>

5. <font size="3">**:material-account-question: Why should you use H.264?**</font>  
Although HEVC is more efficient, meaning it produces smaller files, it's more demanding to encode, so the performance is worse. The same applies to AV1 on the RTX 40 series GPUs.

6. <font size="3">**:material-account-question: Why CQP over CBR and VBR?**</font>  
With CQP, bitrate is adjusted for each macroblock in a frame, meaning it requires very little fine-tuning. This is compared to CBR and VBR, which use predefined values for bitrate, which isn't good for gameplay recording.

7. <font size="3">**:material-account-question: Why these particular values?**</font>  
The CQ Level ranges from **0** (lossless, resulting in incredibly huge files) to **30** (very lossy, resulting in small files). Values between 15 and 18 provide both visually lossless quality without the super huge file sizes.

    !!! example ""
        <h4>[:material-arrow-right: Click here to see the Quality vs CQP Level Graph](/assets/images/video/obs/nvenc/quality_vs_cqp.png)</h4>

8. <font size="3">**:material-account-question: Why this profile?**</font>  
Baseline is the simplist profile, lacking some of the more complex/advanced features which we don't need for this type of recording. This results in better performance.

9. <font size="3">**:material-account-question: Why this preset?**</font>  
Despite the name, it doesn't affect your video quality when the correct settings are used. Although P1 isn't as efficient (resulting in larger files), it's the fastest preset, resulting in the highest performance.

