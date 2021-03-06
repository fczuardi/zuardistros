#!/bin/bash

set -e

# autologin
# ----------------------------------------
cp /lib/systemd/system/getty@.service /lib/systemd/system/getty@.service.`date --iso`.bk
read -p "Username for autologin: " username
sed -i -e "s/agetty -.*/agetty --autologin ${username} %I \$TERM/" /lib/systemd/system/getty@.service

PACKAGES=()


# mdns / hostname.local discoverability
# ----------------------------------------
PACKAGES+=(
  avahi-daemon
  libnss-mdns
)


# remote desktop
# ----------------------------------------
PACKAGES+=(
  tigervnc-standalone-server
)
# suggested: xfonts-100dpi xfonts-scalable
# recommended: xfonts-base x11-xserver-utils


# window manager
# ----------------------------------------
PACKAGES+=(
  i3
  i3status
  i3lock
  suckless-tools
)

# suggested: mesa-utils pulseaudio stterm surf
# recommended: dunst xfonts-base libanyevent-i3-perl libjson-xs-perl rxvt-unicode


# Install.
apt -y update
apt -y install ${PACKAGES[@]}
