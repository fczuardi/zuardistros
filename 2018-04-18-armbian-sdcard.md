## base image (debian stretch desktop)
- https://www.armbian.com/rock64/
  - https://dl.armbian.com/rock64/Ubuntu_xenial_default.7z <-- this one

## wifi
- https://docs.armbian.com/User-Guide_Getting-Started/#how-to-connect-to-wireless
```
nmtui-connect SSID
```

## python pip
```
sudo apt install python3-dev python3-pip python3-setuptools
sudo -H pip3 install --upgrade pip
```

## nodeenv
```
sudo -H pip3 install -e git+https://github.com/ekalinin/nodeenv.git#egg=nodeenv
```

## i3wm base + sakura terminal
```
sudo apt install xserver-xorg x11-xserver-utils xinit i3 i3status dmenu stterm sakura
wget https://raw.githubusercontent.com/fczuardi/dotfiles/master/.config/i3/config --output-document ~/.config/i3/config
startx
```

## ssh-key
