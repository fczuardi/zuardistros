# Stoq

[Stoq](https://stoq.com.br) is a company that develops open source software and provide solutions
for store owners and managers.

This document have instrructions to download, and setup the local database, used by the other 
Stoq products, like the [desktop app](https://gerrit.async.com.br/plugins/gitiles/stoq),
the point of sale app and the conector for syncronizing with Stoq's SASS premium service
[Stoq.link](https://demo.stoq.link/) (an online web dashboard to check stats of all stores in all
branches of a chain).  

## Dependencies

### postgresql

See my [Arch / Raspberry Pi document](./README.md) or the
[Arch wiki for Postgresql](https://wiki.archlinux.org/index.php/PostgreSQL)
 for initial installation and setup.

Dont forget to include `postgresql*` in your Pacman's config after the installation to prevent
potentially breaking changes when a new major postgres version rolls out.

#### create a stoq postgres role with superuser privileges
```
sudo -u postgres -i
create user --interactive
```
Use the name stoq.


### python

#### python libs available on pacman (can save on compiling time)
```
python-aniso8601
python-attrs
python-automat
python-cairocffi
python-cairosvg
python-click
python-constantly
python-cryptography
python-cssselect
python-dateutil
python-defusedxml
python-flask
python-flask-restful
python-future
python-gobject
python-hyperlink
python-incremental
python-itsdangerous
python-jinja
python-lxml
python-mako
python-netifaces
python-pillow
python-psycopg2
python-pyhamcrest
python-pyinotify
python-pyopenssl
python-pyphen
python-pyserial
python-pytz
python-pyusb
python-qrcode
python-raven
python-reportlab
python-twisted
python-werkzeug
python-xlwt
python-zope-interface
```

#### but if you want to get everything from pip, you might need those (to compile)
```
base-devel
nss
libjpeg
swig
libxslt
```

## stoq user

### create stoq user and log with her
```
sudo useradd --create-home stoq
sudo su stoq -l
```

## logged as stoq user

### shallow clone the repos and their submodules
```
git clone https://gerrit.async.com.br/stoq --depth 1 --recurse-submodules
git clone https://gerrit.async.com.br/stoq-utils --depth 1 --recurse-submodules
git clone https://gerrit.async.com.br/kiwi --depth 1 --recurse-submodules
git clone https://gerrit.async.com.br/stoqdrivers --depth 1 --recurse-submodules
git clone https://gerrit.async.com.br/stoq-server --depth 1 --recurse-submodules
```

### create a Python3 virtuaalenv
```
python -m venv --system-site-packages .venv
```

#### to enter the python3 virtualenv
```
source .venv/bin/activate
```
To exit type `deactivate`


### install unlisted dependencies

Inside the python3 virtualenv do:

```
pip install --upgrade pip
pip install future
pip install https://launchpad.net/~stoq-maintainers/+archive/ubuntu/unstable/+sourcefiles/storm/0.20.0.100-2~py3-1bionic/storm_0.20.0.100-2~py3-1bionic.tar.gz
```

To understand what this long URL is, read the section below.
Otherwise, skip to "install projects dependencies"

#### [Async](https://launchpad.net/async)'s fork of [Storm](https://storm.canonical.com/)
The latest version of the storm package published by canonical was version 0.19 in 2011, https://launchpad.net/~storm/+archive/ubuntu/ppa/+packages

That version is not compatible with Python 3.

The [Stoq Maintainers](https://launchpad.net/~stoq-maintainers) team have forked the project, ported
to Python 3 and publish this version on their [Stoq | Unstable](https://launchpad.net/~stoq-maintainers/+archive/ubuntu/unstable/+packages) PPA 

So, in order to use this fork, we need to get the storm tar.gz from the "Stoq | Unstable" and install
it to our python3 environment:



### install projects dependencies

Inside the python3 virtualenv install each project remaining dependencies using `pip install -r requirements.txt`

```
cd kiwi
pip install -r requirements.txt
cd ../stoqdrivers
pip install -r requirements.txt
cd ../stoq
pip install -r requirements.txt
cd ..
```

### initialize a stoq database
```
stoqdbadmin init --help
stoqdbadmin -ev
```



