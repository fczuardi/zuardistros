- armbian stretch dev rk3328
- kernels: 
  - 4.4.128-rk3328
  - 4.16.0-rc6-rk3328

## packages
```
#multicast dns daemon (to have your machine accessible via hostname.local)
avahi-daemon

#i3wm
i3 i3status i3lock suckless-tools

#terminal
stterm

#vnc server
tigervnc-standalone-server

#browsers
surf
firefox-esr
chromium-browser
```

## other

### locale
```
sudo dpkg-reconfigure locales
echo 'export LC_ALL="en_US"' >> ~/.profile
sudo reboot
```

## autologin
### /etc/systemd/system/getty.target.wants/getty@tty1.service

```
ExecStart=-/sbin/agetty --autologin <username --noclear %I $TERM
```
