
Base system: Antergos Live ISO 12.18
http://mirror.umd.edu/antergos/iso/release/antergos-18.12-x86_64.iso

-----

# Packages
- git
- the_silver_searcher
- vim
- yay

-----

# git
```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

# dotfiles
```
git clone https://github.com/fczuardi/dotfiles.git
```

# Vim

```
mkdir -p ~/.vim/undo ~/.vim/tmp
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

# ssh

```
eval `ssh-agent -s`
ssh-add
```

# nodeenv
```
sudo pip install nodeenv
```
# Stoq

- https://wiki.stoq.com.br/index.php/Repo_instructions
- https://github.com/fczuardi/zuardistros/tree/master/archpi
- https://github.com/fczuardi/zuardistros/blob/master/archpi/stoq.md

---
## Packages
- repo
- python-virtualenv
- python-pip
- postgresql
- base-devel nss libjpeg swig libxslt
- poppler poppler-glib
- python-aniso8601 python-attrs python-automat python-cairocffi python-cairosvg python-click python-constantly python-cryptography python-cssselect python-dateutil python-defusedxml python-flask python-flask-restful python-future python-gobject python-hyperlink python-incremental python-itsdangerous python-jinja python-lxml python-mako python-netifaces python-pillow python-psycopg2 python-pyhamcrest python-pyinotify python-pyopenssl python-pyphen python-pyserial python-pytz python-pyusb python-qrcode python-raven python-reportlab python-twisted python-werkzeug python-xlwt python-zope-interface

### China repo
- webkitgtk

# AUR Packages
- python2-htsql python2-htsql-pgsql

---

# Stoq desktop
```
mkdir ~/stoq
cd ~/stoq
repo init -u ssh://gerrit.async.com.br:29418/stoq-manifest-private
repo sync
repo forall -c git submodule init
repo forall -c git submodule update
virtualenv --python `which python` --system-site-packages .venv37
virtualenv --python `which python2` --system-site-packages .venv27
nodeenv .nodeenv11
sudo vim /etc/pacman.conf
  # IgnorePkg = postgresql*
sudo -u postgres -i
[postgres@hostname ~]$ initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
[postgres@hostname ~]$ createuser --interactive
  # stoq (superuser yes)
[postgres@hostname ~]$ logout
sudo systemctl start postgresql
sudo systemctl status postgresql
sudo systemctl enable postgresql
pip install future service_identity
stoqdbadmin init
stoq
```

# Stoq Link

- https://gerrit.async.com.br/plugins/gitiles/stoq-link-premium/+/master/CONTRIBUTING.md

```
cd stoq-link-premium
cd portal
cp config.py localconfig.py
```
