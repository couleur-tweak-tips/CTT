---
description: OBS configuration for Intel GPUs
icon: simple/intel
---

# :simple-intel: QuickSync OBS Configuration

## :material-cog: Configuration

=== "Medium Quality & Low FPS"
    :material-information-slab-circle: These settings maximize recording performance at high FPS.

    <h3>Recording Settings</h3>

    - **Video Encoder:** Use **QuickSync H.264**.

    <h3>Encoder Settings</h3>

    - **Target Usage:** There is no visual difference between speed, balanced and quality as far as Shanki can tell.

    - **Profile:** Keep at high or baseline, there is no measurable performance difference between them in Shanki's testing on both Minecraft Bedrock (1.16.100-1.17.34) and Java editions (1.7.10)

    - **Keyframe Interval:** Leave to **0 (auto)** for the best performance, doing this will set the keyframe interval to 3 on the latest OBS version... so 3 is the actual best keyframe interval for recording at 60fps.

    - **Rate Control:** It's preferable to use **ICQ** for best efficiency, it will adapt the bitrate per frame.

    - **ICQ Quality:** Forget about size in bytes, quality ranges from 1 (practically lossless, huge file), to 30 (very lossy, small), the higher you go, the smaller the file. From Shanki's Testing he found that the sweet 
      spot is around 14-16 depending on how much RAM and what your laptop's power throttling limit is (to achieve the same visual acuity as NVENC).

    - **Latency:** Set this to normal, as you aren't streaming. This setting is useful for getting the delay as low as possible during live streams but since this is a recording, you will not be needing it to be set lower 
      than normal.

    - **Max-B-frames:** Leave Max-B-frames to 0 in this context.
