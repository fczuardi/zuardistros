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

--- 

# Desktop

## Xorg

```
sudo apt install xorg
```

## i3wm 
```
sudo apt install i3 stterm suckless-tools i3status dunst
vim .xinitrc
```

```
#!/bin/sh
i3
```

## Browsers
- firefox
- chromium-browser

## Wayland + Weston

https://wiki.archlinux.org/index.php/wayland

```
apt install weston
weston-launch
#ctr+alt+backspace
apt install xwayland
```


