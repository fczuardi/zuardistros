## base image (debian stretch desktop)
- https://www.armbian.com/rock64/
  - https://dl.armbian.com/rock64/Ubuntu_xenial_default.7z <-- this one

## wifi
- https://docs.armbian.com/User-Guide_Getting-Started/#how-to-connect-to-wireless
```
nmtui-connect SSID
```

## python pip
```
sudo apt install python3-dev python3-pip python3-setuptools
```

## nodeenv
```
sudo -H pip3 install -e git+https://github.com/ekalinin/nodeenv.git#egg=nodeenv
```
