---
icon: fontawesome/solid/file-pen
---

Here's a list of stuff I use to write personal stuff / CTT-related resources, and a few misc things to manage the discord

* [odie.us](https://odie.us/): minimal google doc viewer, gives free foo.odie.us links
* [rentry](https://rentry.co/): markdown paste, gives free rentry.co/foo links
* [cryptpad](http://cryptpad.fr/): [self-hostable](https://docs.cryptpad.org/en/), documented, google suite alternative: [excel](https://cryptpad.fr/sheet), [docs/office](https://cryptpad.fr/pad), [kankan/trello](https://cryptpad.fr/kanban), [whiteboard](https://cryptpad.fr/whiteboard), [forms](https://cryptpad.fr/form), [drive (1gb)](https://cryptpad.fr/file)
* [obsidian.md](https://obsidian.md/): personal markdown note taking, sync with [syncthing](https://syncthing.net)
* [tldraw](https://www.tldraw.com/) & [excalidraw](https://excalidraw.com/): mind maps
## External discord resources


:link: [markdown-text-101.md](https://gist.github.com/matthewzring/9f7bbfd102003963f9be7dbcf7d40e51)
:link: [Thread-Watcher](https://threadwatcher.xyz/): [FOSS](https://github.com/ffamilyfriendly/Thread-Watcher) discord bot that keeps your threads from archiving



## Bock pings on discord

!!! warning "This only works for direct @mentions"

    This does not block people replying to your messages with mentions on


If you often get solicited on your Discord with unnecessary pings, you can block people from @ing you by making an AutoMod rule that blocks your user ID from being mentioned

Simply go in `Server Settings` -> `Safety Setup` -> `AutoMod` -> Scroll down and click `Create Block Custom Words`

In `Choose your words` add the following: ([replace your ID](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID))

```
*<@352830597778898944>*
```
you can add as many users as you want (separate them with commas,,,,,)

In `Choose a response` you should block the message, Send alert in a channel where you can read what people pinged you about

If you still want to be pinged by important roles e.g. moderators, add `Allow certain roles or channels`

### Searching stuff on Discord

* On the mobile app, you can search through all of your DMs
* On desktop, you can sort by oldest
* YouTube descriptions are included in search results
* Search for mentions of a user or channel by querying `<#channel_id>` / `<@user_id>` 


* The `has:` `from:` `during:` tags all work, they'red documented [here](<https://support.discord.com/hc/en-us/articles/115000468588-Using-Search>)
* The previously mentioned tags can be used cumulatively
* `@me` can be used as a shorthand for your own account's id, can be used try searching `from:@me`
* If you don't want ANY filter and just have a list of all recent messages across everything you can just do `after:2015`

### Found a dead `cdn.discordapp.com` link?

Discord CDN files linked outside of Discord expire, if they haven't been deleted you can send the link in any chat to revive it, try it with this:

<https://cdn.discordapp.com/attachments/824297395801554974/980799991201271858/cian.mp4>


### Searching websites

* DuckDuckGo has [!bangs, learn them.](https://duckduckgo.com/bangs)

* Google websites have a handy before:YEAR search operator, e.g. search about a subject before it becomes trendy 

* Chromium browsers let you search a website by typing it's name in the search bar and typing TAB, e.g. open new tab press Y, it auto suggests youtube.com, press TAB and type your search query