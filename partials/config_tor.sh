gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

sudo add-apt-repository "deb https://deb.torproject.org/torproject.org bionic main"
sudo add-apt-repository "deb-src https://deb.torproject.org/torproject.org bionic main"
