> **Warning**
> 
> This is a repository for managing the [CTT discord server](http://dsc.gg/CTT) more than it is a pre-baked solution like my other projects such as [Smoothie](https://github.com/couleur-tweak-tips/Smoothie) or [TweakList](https://github.com/couleur-tweak-tips/TweakList), though feel free to fork and fiddle around with it π


### πΊοΈ **The plan**
*probably easier said than done lmao*
- Each markdown file (.md) is converted via a script (wrote in Powershell) into a discord embed, formatted as a JSON file (which exists temporarily in the CI)
- The webhook URLs are decrypted via the GPG key that's stored in the repo's secrets, then pushed to the channel.