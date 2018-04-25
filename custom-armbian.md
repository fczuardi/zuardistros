- armbian stretch dev rk3328
- kernel: 4.4.128-rk3328

## packages
```
i3 i3status i3lock suckless-tools

stterm

tigervnc-standalone-server

surf
firefox-esr
chromium-browser
```

## configs
### /etc/systemd/system/getty.target.wants/getty@tty1.service

```
--autologin <username>
```
