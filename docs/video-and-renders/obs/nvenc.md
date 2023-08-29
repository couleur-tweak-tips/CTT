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

## General Settings
:material-information-slab-circle: These settings apply to everyone regardless of the specific use case.  

### Recording Settings

- **Recording Format**

	- Replay buffer: Use **MPEG-4 (.mp4)**.  (1)
	- Recording: Use **Matroska Video (.mkv)**.

		??? info "Remux a video to .mp4"
			Remux a video from a different container to .mp4 (don't bother if the programs you use don't require it).  

			![How to remux](/CTT/assets/images/video-and-renders/obs/nvenc/how_to_remux.gif){ width="600" }

- **Audio Encoder:** Use **FFmpeg AAC**.

- **Rescale Output:** Keep disabled. Rescale later with FFmpeg if needed.

## Maximum Performance  

:material-information-slab-circle: These settings maximize recording performance at high FPS.

### Recording Settings  

??? image "Screenshot"

	![Maximum performance recording settings](/CTT/assets/images/video-and-renders/obs/nvenc/recording_performance.png){ width="600" }

- **Video Encoder:** Use **NVIDIA NVENC H.264**. (2)

- **Audio Track:** Only enable 1 track when recording high FPS. (3)

### Encoder Settings

??? image "Screenshot"

	![Maximum performance encoder settings](/CTT/assets/images/video-and-renders/obs/nvenc/encoder_performance.png){ width="600" }

- **Rate Control:** Use **CQP** for efficiency. It adapts bitrate per frame.

- **CQ Level:** Ranges 1 (lossless, huge files) to 30 (very lossy, small).  
From testing it was found that sweet spot is **15-18**.

	??? info "Quality vs CQ Level Graph"
		![Quality vs CQP Level Graph](/CTT/assets/images/video-and-renders/obs/nvenc/quality_vs_cqp.png)

- **Keyframe Interval:** Leave at **0 (auto)** for best performance.

- **Preset:** Use **P1: Fastest** for highest FPS.

	- P1-P3 prioritize FPS over efficiency  
	- P4-P7 prioritize smaller files over FPS

- **Tuning:** Leave on **High Quality**.

- **Profile:** On newer cards, **baseline** can reduce lag at 1080p500+FPS but increases filesize. Does not affect quality.

- **Look Ahead & Psycho Visual Tuning:** Leave **off** for max performance. 

- **GPU & Max B-Frames:** Leave GPU at 0 if single GPU. Leave B-Frames at 0.

## Best Filesize

:material-information-slab-circle: These settings optimize for smallest files without quality loss. 

### Recording Settings

- **Video Encoder:** Use **NVIDIA NVENC HEVC** (or **AV1** if 40 series GPU).

### Encoder Settings

- **CQ Level:** Use **18-20**.

</div>
1. :material-account-question: Why not Fragmented MP4/MKV?  
.mkv and fragmented .mp4 may require remuxing to work in certain programs, adding unnecessary steps to your workflow. (In the event of a power outage or similar, you'll only lose footage that was being saved at that moment.)
2. :material-account-question: Why should you use H.264?  
HEVC is more efficient but harder to encode, leading to worse performance. The same applies to AV1 on the RTX 40 series GPUs.
3. :material-account-question: Why should I only use 1?  
Enabling multiple Audio Tracks can significantly impact performance, and may occasionally cause the "Stopping Recording..." message to display indefinitely.