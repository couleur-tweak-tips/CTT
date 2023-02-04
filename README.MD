> **Warning**
> 
> This is a repository for managing the [CTT discord server](http://dsc.gg/CTT)'s documentation more than it is a pre-baked solution like my other projects such as [Smoothie](https://github.com/couleur-tweak-tips/Smoothie) or [TweakList](https://github.com/couleur-tweak-tips/TweakList).

### 🗺️ **How it works**
- **Format markdown docs**: Each embed (stored as a .JSON, could also be YAML) in [/wehbooks/](https://github.com/couleur-tweak-tips/CTT/tree/main/webhooks) is converted via [ci.ps1](https://github.com/couleur-tweak-tips/CTT/blob/main/ci.ps1) into a Markdown file, mirrored in [/docs/](https://github.com/couleur-tweak-tips/CTT/tree/main/docs)
- **Update webhooks over on [CTT](https://discord.com/invite/aPVMJy78Pa)**: Mentions are stripped, and the keys `secret`, `message_link` and `channel` are taken from the Hashtable (deserialized object from JSON/YAML) to update the webhook on Discord
