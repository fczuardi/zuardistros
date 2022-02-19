# Bitcoin Core

Examples below assumes your bitcoin user is named `bitcoin`, replace accordingly.

## Follow logs

```
sudo tail -f /home/bitcoin/.bitcoin/debug.log
```

## Stop the running daemon (or other bitcoin-cli commands)

```
sudo su bitcoin
bitcoin-cli stop
exit
```

## status start stop restart via systemd

```
systemctl status bitcoind.service
sudo systemctl restart bitcoind.servicehttps://www.hardkernel.com/shop/odroid-hc1-home-cloud-one/
```



# Update Bitcoin core

TBD something similar to https://github.com/fczuardi/zuardistros/blob/7941014a3e64f267c156a392df24f8b11ac6d1eb/raspbian-lite-sept-2017.md#build
