---
icon: fontawesome/solid/file-pen
---

这里列出我写私人文档/CTT 相关资料时用到的工具，外加几个管理 Discord 的小玩意。

* [odie.us](https://odie.us/)：极简 Google 文档查看器，可白嫖 foo.odie.us 域名
* [rentry](https://rentry.co/)：markdown 粘贴板，可白嫖 rentry.co/foo 域名
* [cryptpad](http://cryptpad.fr/)：可[自托管](https://docs.cryptpad.org/en/)、有文档的 Google 全家桶替代品：[表格](https://cryptpad.fr/sheet)、[文档/office](https://cryptpad.fr/pad)、[看板/trello](https://cryptpad.fr/kanban)、[白板](https://cryptpad.fr/whiteboard)、[表单](https://cryptpad.fr/form)、[云盘 (1gb)](https://cryptpad.fr/file)
* [obsidian.md](https://obsidian.md/)：个人 markdown 笔记，配合 [syncthing](https://syncthing.net) 同步
* [tldraw](https://www.tldraw.com/) 与 [excalidraw](https://excalidraw.com/)：思维导图
## Discord 外部资源 {#external-discord-resources }
:link: [markdown-text-101.md](https://gist.github.com/matthewzring/9f7bbfd102003963f9be7dbcf7d40e51)
:link: [Thread-Watcher](https://threadwatcher.xyz/)：让话题不被自动归档的 [FOSS](https://github.com/ffamilyfriendly/Thread-Watcher) Discord 机器人



## 在 Discord 屏蔽 @ 提及 {#bock-pings-on-discord }
!!! warning "只对直接 @ 提及有效"

    挡不住别人引用回复你时带上提及。


如果你 Discord 上老被无谓的 @ 骚扰，可以建一条 AutoMod 规则，屏蔽对你用户 ID 的提及。

进入 `Server Settings`（服务器设置） -> `Safety Setup`（安全设置） -> `AutoMod` -> 往下滚，点 `Create Block Custom Words`（创建自定义屏蔽词）。

在 `Choose your words`（选词）处填入以下内容（[换成你自己的 ID](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID)）：

```
*<@352830597778898944>*
```
想加多少用户都行（用逗号分隔）。

在 `Choose a response`（选择处理动作）里选择屏蔽该消息，并把提醒发到一个你能看到被提及内容的频道。

如果还想让管理员等重要身份组能 @ 你，再加一条 `Allow certain roles or channels`（允许特定身份组或频道）。

### 在 Discord 搜东西 {#searching-stuff-on-discord }
* 手机端可以搜索你的全部私信
* 桌面端支持按最旧排序
* YouTube 视频简介也会进搜索结果
* 查询 `<#频道ID>` / `<@用户ID>` 可搜索对某个频道/用户的提及


* `has:` `from:` `during:` 这些过滤标签都可用，文档在[这里](<https://support.discord.com/hc/en-us/articles/115000468588-Using-Search>)
* 上述标签可以叠加使用
* `@me` 是你自己账号 id 的简写，比如试试 `from:@me`
* 不想要任何过滤条件、只要全站近期消息流水？直接 `after:2015`

### 碰到失效的 `cdn.discordapp.com` 链接？ {#found-a-dead-cdndiscordappcom-link }
在 Discord 外部引用 Discord CDN 的文件链接会过期。只要文件还没被删，把链接发到任意聊天里就能复活它。拿这个试试：

<https://cdn.discordapp.com/attachments/824297395801554974/980799991201271858/cian.mp4>


### 搜网站 {#searching-websites }
* DuckDuckGo 有 [!bangs 快捷指令，值得学](https://duckduckgo.com/bangs)。

* 谷歌有个顺手的 `before:年份` 搜索运算符——比如查一个话题在它火起来之前的资料。

* Chromium 浏览器支持在地址栏输入网站名后按 TAB 直接站内搜索，例如：开新标签页按 Y，自动提示 youtube.com，按 TAB，然后输入搜索词。
