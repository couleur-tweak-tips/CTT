---
icon: simple/linux
---

* [comfig's Linux performance guide](https://docs.comfig.app/latest/os/linux/)
* [dec05eba's gpu-screen-recorder](https://git.dec05eba.com/gpu-screen-recorder/about/): high performance screen recorder
* [areweanticheatyet](https://areweanticheatyet.com): List of games that work and don't work on Linux
* [linuxatemyram](https://www.linuxatemyram.com): debunking misconceptions regarding high ram usage on linux
* [nvidia-patch](https://github.com/keylase/nvidia-patch): removes restriction on maximum number of simultaneous NVENC video encoding sessions imposed by Nvidia to consumer-grade GPUs.




## Disabling double-click prevention *by he3als*

Disable in libinput (for all mice but still limited by mouse firmware):
```sh
sudo mkdir /etc/libinput/; sudo nano /etc/libinput/local-overrides.quirks
```
Then add this in `nano`, save it, close the terminal and log in and out:
```ini
[Never Debounce]
MatchUdevType=mouse
ModelBouncingKeys=1
```
## peripherals-related resources
* [OpenRazer](https://openrazer.github.io/): A Razer Synapse alternative for Linux
* [Wired Glorious Mice Utility](https://github.com/enkore/gloriousctl): (simple build by running `make` - you can set debounce ms)
* [Wireless Glorious Mice Utility](https://github.com/korkje/mow): (build instructions in `README.md` - you can set debounce ms)
