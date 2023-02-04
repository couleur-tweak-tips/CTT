> **Warning**
> 
> This is a prototype repository for managing the [CTT discord server](http://dsc.gg/CTT)'s documentation, not a ready-to-use product for server owners (though for the curious ones reading this feel free to poke around with it and [come have a chat!](https://discord.gg/SQjE9qUmcD)).

There's always been a dilemma for hosting my documentation: stay on Discord or build a website, this repository hopes to fix that by making both possible at once

### 🗺️ **How it works**
Each embeds (stored as a .JSON, could also be YAML) in the [/webbooks/](https://github.com/couleur-tweak-tips/CTT/tree/main/webhooks) are used for two things:
- **Format markdown docs**:  It's converted via [./ci.ps1](https://github.com/couleur-tweak-tips/CTT/blob/main/ci.ps1) into a Markdown file, "mirrored" in [/docs/](https://github.com/couleur-tweak-tips/CTT/tree/main/docs)
- **Update webhooks over on [CTT](https://discord.com/invite/aPVMJy78Pa)**: Mentions are stripped, and the keys `secret`, `message_link` and `channel` are taken from the Hashtable (deserialized object from JSON/YAML) to update the webhook on Discord

#### Details

* The webhook's token are stored in this repository's secrets, and are [loaded](https://github.com/couleur-tweak-tips/CTT/blob/main/.github/workflows/main.yml#L16) in GitHub's VM to be used in the script that is being ran (ci.ps1). Note that even if the token were printed it would get filtered off the [logs](https://github.com/couleur-tweak-tips/CTT/actions)
* Inputting Discord's JSON embed format could change if ways are found to convert Markdown to embeds, though because of how embeds are formatted (and limited compared to MD) it would have strict guidelines to stay faithful to how it would look on Discord
* Don't let PowerShell disinterest you from this project, if this gets enough interest it could easily be rewrote in Python or even if parts of the code stayed in PowerShell nothing prevents interactivity between different languages.