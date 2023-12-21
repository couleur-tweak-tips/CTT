---
icon: material/folder-download
---

<meta http-equiv="refresh" content="0; url=https://obsproject.com/download"/>

### Alternative sources

=== ":simple-windowsxp: Windows"

    Get portable builds in their [GitHub releases](https://github.com/obsproject/obs-studio/releases)

    * WinGet: `winget install -e --id OBSProject.OBSStudio`
    * Scoop: `scoop bucket add extras; scoop install extras/obs-studio`
    * Chocolatey: `choco install obs-studio -y`

=== ":simple-linux: Linux"

    See their instructions [here](https://obsproject.com/download#linux)

    * [Flathub](https://flathub.org/apps/com.obsproject.Studio): `flatpak install flathub com.obsproject.Studio`
    * Arch-based distros: `pacman -S obs-studio`
    * Ubuntu-based distros:
      ```bash
      sudo add-apt-repository ppa:obsproject/obs-studio
      sudo apt update
      sudo apt install ffmpeg obs-studio
      ```

    See [for other distros](https://github.com/obsproject/obs-studio/wiki/unofficial-linux-builds)
    

=== ":simple-apple: macOS"

    * Homebrew: `brew install --cask obs`