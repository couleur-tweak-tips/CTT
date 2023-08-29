---
description: OBS configuration for NVIDIA GPUs
icon: simple/nvidia
---

<!-- dsiable table of contents on sidebar -->
<style>
	.md-nav--primary .md-nav__link[for=__toc] ~ .md-nav {
		display: none;
	}
</style>

# :simple-nvidia: NVENC OBS Configuration

<div class="annotate" markdown>

=== "Maximum Performance"
    :material-information-slab-circle: These settings maximize recording performance at high FPS.

    ### Recording Settings  

    ??? image "Screenshot"

        ![Maximum performance recording settings](/CTT/assets/images/video-and-renders/obs/nvenc/recording_performance.png){ width="600" }

    - **Video Encoder:** Use **NVIDIA NVENC H.264**. (1)  

    - **Audio Track:** Only enable 1 track when recording high FPS. (2)  

    ### Encoder Settings

    ??? image "Screenshot"

        ![Maximum performance encoder settings](/CTT/assets/images/video-and-renders/obs/nvenc/encoder_performance.png){ width="600" }

    - **CQ Level:** Use **15-18**. (7)

    - **Keyframe Interval:** Leave at **0 (auto)** for best performance.

    - **Preset:** Use **P1: Fastest (Lowest Quality)** for highest FPS. (3)  

    - **Tuning:** Leave on **High Quality**.

    - **Profile:** Use **baseline**. (5)  

    - **Look Ahead & Psycho Visual Tuning:** Leave **off** for max performance. 

    - **GPU & Max B-Frames:** Leave GPU at 0 if single GPU. Leave B-Frames at 0.

=== "Best Filesize"
    :material-information-slab-circle: These settings optimize for smallest files without quality loss. 

    ### Recording Settings

    - **Video Encoder:** Use **NVIDIA NVENC HEVC** (or **AV1** if you have a 40 series GPU).

    ### Encoder Settings

    - **CQ Level:** Use **18-20**. (8)  

    - **Preset:** Use **P7**. (4)  

    - **Profile:** Use **high**. (6)  

</div>
1. ### :material-account-question: Why should you use H.264?  
HEVC is more efficient but harder to encode, leading to worse performance. The same applies to AV1 on the RTX 40 series GPUs.
2. ### :material-account-question: Why should I only use 1?  
Enabling multiple Audio Tracks can significantly impact performance, and may occasionally cause the "Stopping Recording..." message to display indefinitely.
3. ### :material-account-question: Why this preset?  
Despite the name it doesn't affect your video quality. Our testing showed that "P1: Fastest (Lowest Quality)" results in the least encoding lag, but produces a bigger filesize. While "P7: Slowest (Best Quality)" significantly reduces the FPS you can record at, but results in a smaller filesize.
3. ### :material-account-question: Why this preset?  
Despite the name it doesn't affect your video quality. Our testing showed that "P1: Fastest (Lowest Quality)" results in the least encoding lag, but produces a bigger filesize. While "P7: Slowest (Best Quality)" significantly reduces the FPS you can record at, but results in a smaller filesize.
5. ### :material-account-question: Why this profile?  
On newer GPUs, "baseline" may reduce encoding lag when recording at high FPS at the cost of the bigger file size. This won't affect your video quality.
6. ### :material-account-question: Why this profile?    
Using "high" profile on newer GPUs may limit the fps you can record at, but it effectively reduces the file size. This won't affect your video quality.
7. ### :material-account-question: Why these particular values?  
The CQ Level ranges from **1** (lossless, resulting in huge files) to **30** (very lossy, resulting in small files).  
Our testing has shown a certain sweet spot within this range:

    !!! image "Quality vs CQ Level Graph"
        ![Quality vs CQP Level Graph](/CTT/assets/images/video-and-renders/obs/nvenc/quality_vs_cqp.png)

8. ### :material-account-question: Why these particular values?  
The CQ Level ranges from **1** (lossless, resulting in huge files) to **30** (very lossy, resulting in small files).  
Our testing has shown a certain sweet spot within this range:

    !!! image "Quality vs CQ Level Graph"
        ![Quality vs CQP Level Graph](/CTT/assets/images/video-and-renders/obs/nvenc/quality_vs_cqp.png)
