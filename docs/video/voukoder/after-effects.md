---
icon: custom/after-effects-og
---
# After Effects

Start by opening up your Export settings by going into `File` -> `Export` -> `Add to Render Queue`

Ensure you don't have any leftover render queues by selecting everything but the lasts and pressing <kbd>DEL</kbd> to remove them

![](/assets/images/video/voukoder/ae-render-queue.png)

To make a new template, click on the Down arrow right next to `Output Module:` and select `Make Template...`

Give it a settings name and click `Edit`

![](/assets/images/video/voukoder/ae-make-template.png)

=== ":package: Lossless"

    While writing this I just realized the only video format After Effectrs let you export is lossless uncompressed AVI, look up tutorials on how to use `Adobe Media Encoder` I guess..

=== ":custom-voukoder: Exporting with Voukoder"

    Select Voukoder in the Format dropdown and [configure it](./configuration.md)
    
    ![](/assets/images/video/voukoder/premiere-output-settings.png)

<hr>

After having configured `Output Module Settings`, click `Ok` to close, and `Ok` again on the `Output Module Templates` to save your new template.