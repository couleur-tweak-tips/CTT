---
icon: material/youtube
---

# yt-dlp
## :material-package-down: Installation

=== "Windows"

    * WinGet: `winget install -e --id yt-dlp.yt-dlp`
    * Scoop: `scoop install yt-dlp`
    * Chocolatey: `choco install yt-dlp`

=== "Linux"

    * Binary install (recommended): 
    ```bash
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable
    ```
    You can also use your distro's manager to install the [package](https://github.com/yt-dlp/yt-dlp/wiki/Installation#third-party-package-managers). Some common ones are listed below:
    * Arch-based distros: `sudo pacman -Syu yt-dlp`
    * Ubuntu-based distros (copied from OBS download page):
    ```bash
    sudo add-apt-repository ppa:tomtomtom/yt-dlp    # Add ppa repo to apt
    sudo apt update                                 # Update package list
    sudo apt install yt-dlp                         # Install yt-dlp      
    ```

=== "macOS"

    Homebrew: `brew install yt-dlp`

## :material-lightbulb-on: Usage

Get your desired Youtube video or playlist you want to rip audio from, and then execute

`yt-dlp -f 251 -x [playlist or video]`

Where instead of the brackets, you insert your link. Here is a breakdown of the options:

+ `-f 251` selects the 251 option, which is the Opus codec for Youtube
+ `-x` specifies to only extract the audio from the link, not the video

!!! warning "Itunes"
    If you are planning on importing audio to your Iphone through Itunes, "Opus" is not supported. You must convert the file into mp3 or AAC for it to be imported correctly.

