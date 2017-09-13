## system update
```
sudo apt-get clean
sudo apt-get dist-upgrade
sudo apt-get update
```

## keyboard layout, timezone, hostname
```
sudo raspi-config
```

## wifi
```
sudo iwlist wlan0 scan|less
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
ifconfig wlan0
sudo wpa_cli reconfigure
ifconfig wlan0
```

se nao rolar, restart

```
sudo restart
```

## another sudo user
```
sudo adduser <username>
sudo visudo
```

    username     ALL=(ALL:ALL) NOPASSWD:ALL

## i3
```
sudo apt-get install xserver-xorg xinit i3
vim .config/i3/config 
```

    bindsym $mod+Return exec "stterm -e fish"
    bindsym $mod+Shift+e exec "i3-msg exit"

## stterm
```
sudo apt-get  install stterm
```

## fish
```
sudo apt-get install fish
fish_vi_key_bindings 
echo "set -x TERMINAL /usr/bin/stterm" >> ~/.config/fish/config.fish
```

## git
```
sudo apt-get install git
```

## new ssh key
```
ssh-keygen -t rsa -b 4096 -C "fabricio@fabricio.org"
bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel ~/.ssh/id_rsa.pub
```

## vim, vim plug, mnmo nvim config
```
sudo apt-get install vim-gtk silversearcher-ag
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir mnmo; cd mnmo
git clone https://github.com/fczuardi/nvim
ln -s /home/fcz/mnmo/nvim/init.vim /home/fcz/.vimrc
```

## firefox
```
sudo apt-get install firefox-esr
```

## keepassx
```
sudo apt-get install kepassx
```

## raise swap
```
sudo vim /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
free -m
```

## node js
```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
```

## tor
```
sudo apt-get install tor
sudo vim /usr/share/tor/tor-service-defaults-torrc
```

    ControlPort 9051
    CookieAuthentication 1
    CookieAuthFileGroupReadable 1

```
sudo systemctl restart tor
sudo journalctl -f
sudo usermod -a -G debian-tor <bitcoindusername>
```

## bitcoin core

- https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md
- https://github.com/bitcoin/bitcoin/releases
- https://github.com/bitcoin/bitcoin/blob/master/doc/tor.md
- https://medium.com/@lopp/how-to-run-bitcoin-as-a-tor-hidden-service-on-ubuntu-cff52d543756


### build
```
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev 
wget https://github.com/bitcoin/bitcoin/archive/v0.15.0rc3.tar.gz
tar -xvf v0.15.0rc3.tar.gz
cd bitcoin-0.15.0rc3/
./autogen.sh
./configure --help
./configure --prefix=$HOME --disable-wallet
make -j2
make install
cd ~
./bin/bitcoind --daemon
./bin/bitcoin-cli stop
tail -f .bitcoin/debug.log
vim ./.bitcoin/bitcoin.conf
```

    daemon=1
    prune=5000

### bootstrap

    blocksonly=1
    
### run

    blocksonly=0
    debug=tor
