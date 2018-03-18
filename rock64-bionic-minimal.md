## Base Image
- https://github.com/ayufan-rock64/linux-build/releases/tag/0.6.25
  - https://github.com/ayufan-rock64/linux-build/releases/download/0.6.25/bionic-minimal-rock64-0.6.25-193-arm64.img.xz

## Image burner (MacoOSX)
- Etcher 1.3.1
  - https://etcher.io/

## first boot
```
passwd
sudo su
apt search libmali 3328
apt install libmali-rk-utgard-450-r7p0
```

## Video Acceleration
- https://github.com/ayufan-rock64/linux-build/blob/master/recipes/video-playback.md
- https://kodi.wiki/view/Samples

```
# wget some video files
apt edit-sources
# duplicate bionic line replacing bionic with artful, see https://github.com/ayufan-rock64/linux-build/issues/139
apt update
apt install ffmpeg mpv
rkmpv video1.mkv
```

--- 

# Desktop

```

```
