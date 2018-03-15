
## Base Image

- https://github.com/ayufan-rock64/linux-build/releases/tag/0.6.25
  - https://github.com/ayufan-rock64/linux-build/releases/download/0.6.25/stretch-minimal-rock64-0.6.25-193-arm64.img.xz

## Image burner (mac OSX)
- https://github.com/pine64dev/PINE64-Installer/blob/master/README.md

## Missing Basics
- ``sudo apt install man less``

## First boot
 - ``passwd``
 - connected to ethernet cable
 - ``sudo apt update -y``
 - ``sudo apt install linux-rock64``
 - ``sudo apt upgrade``

## Fish shell
 - ``sudo apt install fish``
 - ``sudo ln -s /usr/bin/python3 /usr/local/bin/python``
 - ``fish``
 
## XServer
 - ``sudo apt install xorg xserver-xorg xserver-xorg-video-armsoc xinit``
 - duvida: ``xcompmgr``???
 
## Firefox
  - ``sudo apt install firefox-esr``

### Launch firefox without window manager
  - ``startx firefox && reset``
 
#### Increase firefox window dimensions
- ``vim .mozilla/firefox/786..default/xulstore.json``
```
{"chrome://browser/content/browser.xul": {"main-window": {"width": 1920, "height": 1080}}
```

## i3-wm
  - ``sudo apt install i3``

### i3 config
  - ``vim ~/.config/i3/config``
  - remove exit confirmation
  - ``vim ~/.xinitrc``
```
#!/bin/sh
i3
```

#### use i3 to autolaunch a firefox browser in fullscreen 
- ``vim ~/.config/i3/config``
```
for_window [class="Firefox"] fullscreen enable

exec "firefox --private-window https://get.webgl.org"
```

### hide i3 bar
```
bar {
mode hide
}
```

### startx without cursor

``startx -- -nocursor``


 
 
