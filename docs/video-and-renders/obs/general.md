---
description: OBS Configuration for any encoder
icon: material/cog
---

# :material-cog: General OBS Configuration

<div class="annotate" markdown>

## General Settings
:material-information-slab-circle: These settings apply to everyone regardless of the specific use case.  

### Recording Settings

- **Recording Format**

    - Replay buffer: Use **MPEG-4 (.mp4)**. (1)  
    - Recording: Use **Matroska Video (.mkv)**.

    ??? info "Remux a video to .mp4"
        Remux a video from a different container to .mp4 (don't bother if the programs you use don't require it).  

        ![How to remux](/CTT/assets/images/video-and-renders/obs/nvenc/how_to_remux.gif){ width="600" }

- **Audio Encoder:** Use **FFmpeg AAC**.

- **Rescale Output:** Keep disabled. Rescale later with FFmpeg if needed.

### Encoder Settings

- **Rate Control:** Use **CQP**. (2)

</div>
1. ### :material-account-question: Why not Fragmented MP4/MKV?  
.mkv and fragmented .mp4 may require remuxing to work in certain programs, adding unnecessary steps to your workflow. (In the event of a power outage or similar, you'll only lose footage that was being saved at that moment.)
2. ### :material-account-question: Why CQP over CBR and VBR?  
It adapts the bitrate per frame. This results in better overall video quality and efficient file size management compared to CBR and VBR which use a fixed bitrate throughout the video.