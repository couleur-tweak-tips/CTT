---
icon: custom/yt-dlp
---

# yt-dlp {#yt-dlp }
## :material-package-down: 安装 {#installation }
=== "Windows"

    * WinGet：`winget install -e --id yt-dlp.yt-dlp`
    * Scoop：`scoop install yt-dlp`
    * Chocolatey：`choco install yt-dlp`

=== "Linux"

    * 二进制安装（推荐）：
    ```bash
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp  # 赋予可执行权限
    ```
    也可以用你发行版的包管理器安装这个[软件包](https://github.com/yt-dlp/yt-dlp/wiki/Installation#third-party-package-managers)，常见的有：
    * Arch 系发行版：`sudo pacman -Syu yt-dlp`
    * Ubuntu 系发行版（抄自 OBS 下载页）：
    ```bash
    sudo add-apt-repository ppa:tomtomtom/yt-dlp    # 添加 ppa 源
    sudo apt update                                 # 更新软件列表
    sudo apt install yt-dlp                         # 安装 yt-dlp      
    ```

=== "macOS"

    Homebrew：`brew install yt-dlp`

## :material-lightbulb-on: 用法 {#usage }
### 视频 {#video }
直接 `yt-dlp <url>`，它会下载它认为画质与音频最好的组合。

### 视频（从 A 点下到 B 点） {#video-from-point-a-to-b }
我只是先把这个命令扔在这儿，有更好的做法欢迎提——记得把里面的 `<url>` 换掉。

```
yt-dlp --external-downloader aria2c --external-downloader-args "-x 16 -s 16" --download-archive archive.txt <url> --no-overwrites --no-post-overwrites --no-continue --output "%(title)s.%(ext)s" --postprocessor-args "-ss 00:00:45 -to 00:03:55"
```

### 音频 {#audio }
选好你要扒音频的 YouTube 视频或播放列表，然后执行：

`yt-dlp -f 251 -x [播放列表或视频]`

把方括号处换成你的链接。参数拆解：

+ `-f 251` 选中 251 号格式，即 YouTube 的 Opus 编码
+ `-x` 表示只提取音频，不要视频

!!! warning "iTunes 用户注意"
    如果你打算通过 iTunes 把音频导入 iPhone：不支持 Opus，必须先转成 mp3 或 AAC 才能正常导入。
