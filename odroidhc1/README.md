
![image](https://user-images.githubusercontent.com/7760/154808152-d2f7cbef-88fd-417e-a626-fc60426900ca.png)

https://www.hardkernel.com/shop/odroid-hc1-home-cloud-one/


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
- finalmente `ssh -vv <username>@XXXXXXXXXXXX.onion`


(ver o username e endereço onion no sd card da maquina)
