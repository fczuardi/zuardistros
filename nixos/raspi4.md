# install

## download aarch64 generic image

  - https://nixos.wiki/wiki/NixOS_on_ARM/Raspberry_Pi_4
  - https://hydra.nixos.org/job/nixos/trunk-combined/nixos.sd_image.aarch64-linux
    - https://hydra.nixos.org/build/180049532
      - https://hydra.nixos.org/build/180049532/download/1/nixos-sd-image-22.11pre384332.7eb78c6d040-aarch64-linux.img.zst

Extract the .img and burn to an SD card.

## set a passwd for the nixos user without a screen

(thanks https://schauderbasis.de/posts/install_nixos_on_raspberry_pi_3/ )

```
passwd
ENTER
mypassword
ENTER
mypassword
ENTER
```

## check internet connection

```
host nixos.org
```

### If not wired, configure wifi

- https://nix.dev/tutorials/installing-nixos-on-a-raspberry-pi#getting-internet-connection

```
wpa_supplicant -B -i wlan0 -c <(wpa_passphrase 'SSID' 'passphrase') &
```

## update firmware
- https://nix.dev/tutorials/installing-nixos-on-a-raspberry-pi#updating-firmware

```
nix-shell -p raspberrypi-eeprom
mount /dev/disk/by-label/FIRMWARE /mnt
BOOTFS=/mnt FIRMWARE_RELEASE_STATUS=stable rpi-eeprom-update -d -a
```

## generate config

```
sudo nixos-generate-config
```

### edit config

```
sudo vim /etc/nixos/configuration.nix
```

#### uncommented/editted lines:

(a user named z with sudo privilege)

```
  users.users.z = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     openssh.authorizedKeys.keys = [
       "ssh-ed25519 AAAAC3Nz..."
     ];
  };
```
...
```
  environment.systemPackages = with pkgs; [
     vim 
  ];
```
...
```
  services.openssh.enable = true;
```

## first install

```
sudo -i
nixos-install --root /
passwd z
reboot
```

## rebuild

```
ssh z@192.168.0.25
sudo -i

vim /etc/nixos/configuration.nix
# example, change timezone
#  time.timeZone = "America/Sao_Paulo";

nixos-rebuild test # change but wont persist after boot
# test the new configuration, and when ok...

nixos-rebuild switch
```

## rollback

### list system generations

```
nix-env --list-generations --profile /nix/var/nix/profiles/system
```

### rollback one generation

```
nixos-rebuild switch --rollback
```

### delete generations after the rollback

```
[root@nixos:~]# nix-env --list-generations --profile /nix/var/nix/profiles/system
   1   1970-01-01 00:00:11   
   2   2022-06-11 08:26:05   (current)
   3   2022-06-11 13:58:05   
   4   2022-06-11 15:36:58   

[root@nixos:~]# nix-env --profile /nix/var/nix/profiles/system --delete-generations 3 4
removing profile version 3
removing profile version 4
```


-----

# enable flakes

```
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

# generate ssh key

```
ssh-keygen -t ed25519 -C "fabricio@fabricio.org"
```

