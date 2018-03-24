# Base

## Base Image
- https://github.com/ayufan-rock64/linux-build/releases/tag/0.6.25
  - https://github.com/ayufan-rock64/linux-build/releases/download/0.6.25/bionic-minimal-rock64-0.6.25-193-arm64.img.xz

## Image burner (MacoOSX)
- Etcher 1.3.1
  - https://etcher.io/

## first boot
```
passwd
```

## another sudo user
```
sudo adduser <username>
sudo visudo
```

    username     ALL=(ALL:ALL) NOPASSWD:ALL


## Fish shell
```
sudo apt install fish
fish
```

## Video Acceleration
- https://github.com/ayufan-rock64/linux-build/blob/master/recipes/video-playback.md
- https://kodi.wiki/view/Samples

```
sudo apt install libmali-rk-utgard-450-r7p0 libmali-rk-utgard-450-r7p0-gbm libdrm-rockchip1 gstreamer1.0-rockchip1
sudo apt install ffmpeg mpv
rkmpv video1.mkv
```

# Desktop

## Xorg

```
sudo apt install xorg mesa-utils-extra
# commented while the invisible mouse is happening
# see https://github.com/rockchip-linux/xserver/issues/6
# sudo apt install xserver-xorg-video-armsoc7p0
```

## i3wm 
```
sudo apt install i3 stterm suckless-tools i3status
```
- .xinitrc
```
#!/bin/sh
i3
```

- .config/i3/config
```
bindsym $mod+Return exec "stterm -e fish"
bindsym $mod+Shift+e exec "i3-msg exit"
```

## time zone
```
sudo dpkg-reconfigure tzdata
```
## keyboard compose key (for accents)
``
sudo dpkg-reconfigure keyboard-configuration
``

## Browsers
### firefox
```
sudo apt install firefox
```

- about:config
```
security.webauth.u2f;true
```

#### Audio on Firefox Youtube (Pulseaudio)
```
sudo apt install pulseaudio
sudo sed -i 's/load-module module-udev-detect$/& tsched=0/g' /etc/pulse/default.pa
pulsemixer 
# F3 Cards, Stereo Output on the card with input+ output 
```

### chromium-browser
- chrome:flags
```
```

## Password Manager
- keepassxc
  - https://launchpad.net/~phoerious/+archive/ubuntu/keepassxc
  - https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/
  - https://chrome.google.com/webstore/detail/keepassxc-browser/oboonakemofpalcgghocfoadofidjkkk
  
```
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update
sudo apt install keepassxc
```

## Cloud Storage
- https://github.com/astrada/google-drive-ocamlfuse

```
sudo apt install fuse
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt update
sudo apt install google-drive-ocamlfuse
google-drive-ocamlfuse
mkdir gdrive
google-drive-ocamlfuse gdrive
```

# Dev

## vim

# Others

## Wayland + Weston

https://wiki.archlinux.org/index.php/wayland

```
apt install weston
weston-launch
#ctr+alt+backspace
apt install xwayland
```



------

## Github

- https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
exit



```
