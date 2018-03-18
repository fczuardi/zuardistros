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

## Fish shell
```
sudo apt install fish
which python
sudo ln -s /usr/bin/python3 /usr/bin/python
fish
```

## Video Acceleration
- https://github.com/ayufan-rock64/linux-build/blob/master/recipes/video-playback.md
- https://kodi.wiki/view/Samples

```
sudo apt install libmali-rk-utgard-450-r7p0
sudo apt edit-sources
# duplicate bionic line replacing bionic with artful, see https://github.com/ayufan-rock64/linux-build/issues/139
sudo apt update
sudo apt install ffmpeg mpv
rkmpv video1.mkv
```

# Desktop

## Xorg

```
sudo apt install xorg
```

## i3wm 
```
sudo apt install i3 stterm suckless-tools i3status dunst
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

## Browsers
### firefox
- about:config
```
security.webauth.u2f;true
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


