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

Update ubuntu

```
sudo apt install ca-certificates
# copied from https://support.torproject.org/relay-operators/operators-4/
curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
sudo apt update
```

Download source

```
cd bin
wget https://bitcoincore.org/bin/bitcoin-core-22.0/bitcoin-22.0.tar.gz
```

Check download

```
wget https://bitcoincore.org/bin/bitcoin-core-22.0/SHA256SUMS
wget https://bitcoincore.org/bin/bitcoin-core-22.0/SHA256SUMS.asc
sha256sum --ignore-missing --check SHA256SUMS
```

Check developers signatures

https://github.com/bitcoin/bitcoin/tree/master/contrib/builder-keys

```
wget https://raw.githubusercontent.com/bitcoin/bitcoin/master/contrib/builder-keys/keys.txt
while read fingerprint keyholder_name; do gpg --keyserver hkps://keys.openpgp.org --recv-keys ${fingerprint}; done < ./keys.txt
gpg --refresh-keys
gpg --verify SHA256SUMS.asc
```

