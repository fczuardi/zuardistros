fish
```
sudo apt update
sudo apt install fish
```

node 9 (https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions )
```
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential
```

vim 8 (https://launchpad.net/~jonathonf/+archive/ubuntu/vim)
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

vim tewaks required by my .vimrc
```
sudo apt install silversearcher-ag
mkdir -p ~/.vim/undo ~/.vim/tmp
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

python3 + python3-venv (https://github.com/CraveFood/hotsites/wiki)
```
sudo apt install python3 python3-venv python3-dev python3-pip python3-setuptools
```

