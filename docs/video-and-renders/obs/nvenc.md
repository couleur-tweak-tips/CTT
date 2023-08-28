---
description: OBS configuration for NVIDIA GPUs
icon: simple/nvidia
---

<!-- enable table of contents on sidebar -->
<style>
	.md-nav--primary .md-nav__link[for=__toc] ~ .md-nav {
		display: block !important;
	}
</style>

# :simple-nvidia: NVENC OBS Configuration

<div class="annotate" markdown>

## Recording Settings

- **Recording Format**  

	- Replay buffer  
	Use **MPEG-4 (.mp4)**.  (1)
	- Recording  
	Use **Matroska Video (.mkv)**.
	??? info "Remux a video to .mp4"
		**Remux a video from a different container to .mp4 (don't bother if the programs you use don't require it).**
		 ![NVENC Settings](/CTT/assets/images/video-and-renders/obs/nvenc/how_to_remux.gif)

- **Video Encoder**

	- High FPS:  
	Use **NVIDIA NVENC H.264**. (2)  
	  
	- Smallest filesize:  
	Use **NVIDIA NVENC HEVC** (**NVIDIA NVENC AV1** If you have a 40 series GPU.)

- **Audio Encoder**  
Use **FFmpeg AAC**.

- **Audio Track**  
When recording in high FPS, make sure to only have 1 checked. (3)

- **Rescale Output**  
Keep this disabled, if you want to rescale then do it later using FFmpeg.

## Encoder Settings


### Maximum performance (FPS)

:material-information-slab-circle-outline: These settings are intended for maximum recording performance at high FPS.  


  
- **Rate Control**  
It's preferable to use **CQP** for best efficiency, as it will adapt the bitrate per frame.  

-  **CQ Level**  
The CQ Level ranges from 1 (practically lossless, huge file) to 30 (very lossy, small)  
From testing, it was found that the sweet spot was between **15-18**.  
    
	??? info "Quality vs CQ Level Graph"
    	![NVENC Settings](/CTT/assets/images/video-and-renders/obs/nvenc/quality_vs_cqp.png)

-  **Keyframe Interval**  
Leave to **0 (auto)** for the best performance.  

-  **Preset**  
Use **P1: Fastest (Lowest Quality)** for the best performance.

	- P1-P3 prioritize higher FPS over file size efficiency  
	- P4-P7 prioritize smaller files over high FPS 

	Lower presets are not necessarily lower quality.  

-  **Tuning**  
Leave this on **High Quality**.

-  **Profile**    
On newer cards, setting this option to **baseline** can help with encoding lag when recording in 1080p500+FPS, but will significantly increase filesize.  
This won't affect your video's visual quality.  

-  **Look ahead & Psycho Visual Tuning**  
Leave **off**, these settings were not intended for max performance and fps.

- **GPU & Max-B-frames**  
Leave GPU to 0 if you only have one GPU.  
Leave Max-B-frames to 0 in this context.

</div>
1. :material-account-question: Why not Fragmented MP4/MKV?  
.mkv and fragmented .mp4 will require remuxing to work in certain programs, there's no point in adding more steps to your workflow.
(If a power outage or similar happens, you'll only lose footage that was being saved aas it happened.)
2. :material-account-question: Why should you use H.264?  
HEVC is more efficient and harder to encode. (worse performance!)
Same goes for AV1 on the RTX 40 series.
3. :material-account-question: Why should I only use 1?  
Having multiple Audio Tracks enabled will impact performance quite a bit, and sometimes it'll say "Stopping Recording..." forever.



### Smallest filesize
