---
description: OBS configuration for NVIDIA GPUs
icon: simple/nvidia
---

# :simple-nvidia: NVENC OBS Configuration

:material-information-slab-circle-outline: These settings are intended for maximum recording performance at high FPS.

### Steps

1. Open **Settings :material-arrow-right: Output**
2. Switch to the **Recording** tab, and change your video encoder to **NVIDIA NVENC H.264**
3. Scroll down to the encoder settings and chage these settings:  
  
    - **Rate Control**  
    	It's preferable to use **CQP** for best efficiency, as it will adapt the bitrate per frame.  

    - **CQ Level**  
    	The CQ Level ranges from 1 (practically lossless, huge file) to 30 (very lossy, small)  
    	From testing, it was found that the sweet spot was between **15-18**.  
    
    	??? info "Quality vs CQ Level Graph"
    		![NVENC Settings](/CTT/assets/images/video-and-renders/obs/nvenc/quality_vs_cqp.png)

    - **Keyframe Interval**  
    	Leave to **0 (auto)** for the best performance.  

    - **Preset**  
    	Use **P1: Fastest (Lowest Quality)** for the best performance.

		- P1-P3 prioritize higher FPS over file size efficiency  
		- P4-P7 prioritize smaller files over high FPS 

		Lower presets are not necessarily lower quality.  

	- **Tuning**  
		Leave this on **High Quality**.

    - **Profile**  
    	On newer cards, setting this option to **baseline** can help with encoding lag when recording in 1080p500+FPS, but will significantly increase filesize.  
    	This won't affect your video's visual quality.  

    - **Look ahead & Psycho Visual Tuning**  
    	Leave **off**, these settings were not intended for max performance and fps.

    - **GPU & Max-B-frames**  
    	Leave GPU to 0 if you only have one GPU.  
		Leave Max-B-frames to 0 in this context.