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
# prompt and colors
fish_config
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

# I am not super convinced that compositing makes
# much difference on i3, but it does look like
# some scrolling flickering on firefox gets better
# when using a compositor
# https://wiki.archlinux.org/index.php/Compton
sudo apt install compton
```

## i3wm 
```
sudo apt install i3 stterm suckless-tools i3status
```

- .config/i3/config
```
wget -O ~/.config/i3/config https://raw.githubusercontent.com/fczuardi/dotfiles/master/.i3/config
```

## xinit
```
wget -O ~/.xinitrc https://raw.githubusercontent.com/fczuardi/dotfiles/master/.xinitrc
```

## wifi
```
sudo apt install wicd wicd-curses
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
sudo apt install pulseaudio pulsemixer
sudo sed -i 's/load-module module-udev-detect$/& tsched=0/g' /etc/pulse/default.pa
pulsemixer 
# F3 Cards, Stereo Output on the card with input+ output 
```

#### Addons
- uMatrix
  - https://github.com/gorhill/uMatrix
- keepassxc
  - https://github.com/keepassxreboot/keepassxc-browser
- React dev tools
  - https://addons.mozilla.org/en-US/firefox/addon/react-devtools/
  - https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi

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
## Instant Messaging

### Telegram

```
sudo apt install telegram-desktop
```

# Dev

## Github SSH key

- https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# bash
# eval "$(ssh-agent -s)"
# fish
eval (ssh-agent -c)
ssh-add
```

## vim
```
# to use silver searcher ag instead of grep
sudo apt install silvershearcher-ag

# to have +clipboard and +xterm_clipboard
sudo apt install vim-gnome

# to have a place where to keep undo history
mkdir -p ~/.vim/undo

# load a good config
wget -O ~/.vimrc https://raw.githubusercontent.com/fczuardi/dotfiles/master/.vimrc
```

## node js

### nvm
```
bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source .bashrc
nvm ls-remote
nvm install v9.9.0
nvm use --delete-prefix v9.9.0
nvm ls
```

### fundle + bass + nvm
- https://github.com/tuvistavie/fundle
- https://github.com/edc/bass
- https://github.com/creationix/nvm/issues/303#issuecomment-121086278
```
curl -sfL https://git.io/fundle-install | fish
exit
fish
wget -O ~/.config/fish/config.fish https://raw.githubusercontent.com/fczuardi/dotfiles/master/.config/fish/config.fish
fundle install
```

### watchman for jest --watch
- https://github.com/facebook/jest/issues/3254#issuecomment-297214395

```
sudo apt install autoconf automake build-essential python-dev python3-dev libtool libssl-dev pkg-config
git clone https://github.com/facebook/watchman.git
cd watchman
./autogen.sh
./configure --enable-lenient
make
sudo make install

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

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

