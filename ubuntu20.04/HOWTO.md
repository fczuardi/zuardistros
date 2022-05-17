### Ubuntu stats

```
# RAM
free --giga

# disk
df -h --total
```

### Tor

- https://support.torproject.org/apt/tor-deb-repo/

```
sudo apt update
sudo apt install apt-transport-https
sudo apt install ca-certificates

dpkg --print-architecture
# amd64

lsb_release -c
# focal 

sudo vim /etc/apt/sources.list.d/tor.list
#   deb     [arch=amd64 signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org focal main
#   deb-src [arch=amd64 signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org focal main

sudo su
wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
exit

sudo apt update
sudo apt install tor deb.torproject.org-keyring
```


### SSH Onion service

- https://docs.j7k6.org/ssh-tor-onion-adress/

```
sudo vim /etc/tor/torrc
# HiddenServiceDir /var/lib/tor/ssh/
# HiddenServicePort 22 127.0.0.1:22

systemctl restart tor.service

sudo cat /var/lib/tor/ssh/hostname
# send the address to the person that needs access

sudo vim ~/.ssh/authorized_keys
# add the pubkey of the person that needs access
```

(client, other machine)
```
sudo apt install socat

sudo vim ~/.ssh/config
# Host *.onion
#    ProxyCommand /usr/bin/socat STDIO SOCKS4A:localhost:%h:%p,socksport=9050

sudo systemctl start tor
ssh username@address.onion
```


### Ideas

- https://github.com/mynodebtc/mynode/blob/master/setup/setup_device.sh
