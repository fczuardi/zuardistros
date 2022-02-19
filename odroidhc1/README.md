
Serviços:

- tor
- bitcoin core


Login via ssh:

- instalar tor
  - `sudo pacman -S tor`
  - `systemctl start tor`
  - `journalctl -f`
- instalar socat
  - `sudo pacman -S socat`
- na linha com o hostname .onion da maquina no `~/.ssh/config` de quem for conectar:
  - `ProxyCommand /usr/bin/socat STDIO SOCKS4A:localhost:%h:%p,socksport=9050` 

(ver o username e endere
