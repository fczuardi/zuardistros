## Burn the sd card
- follow https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3 
  - there is an alternative tar with the mainline kernel and U-Boot
- more complete tutorial:
  - https://www.reddit.com/r/raspberry_pi/comments/4sibog/arch_linux_arm_on_the_raspberry_pi_2_tutorial/
  - https://www.reddit.com/r/raspberry_pi/comments/4skwiq/arch_linux_arm_tutorial_part_2_installing_sudo/

## First boot
- find the IP of the raspi and ssh to that machine with the user `alarm`
  - default user password is alarm
  - default root password is root
  - change passwords
  - `su`
  - `pacman-key --init`
  - `pacman-key --populate archlinuxarm`

## Update packages
  - `pacman -Syu`

## Install essentials

Packages:
```
sudo
vim
git
python
postgresql
```

### sudo 
```
su
pacman -s sudo
gpasswd -a alarm wheel
visudo
```
Uncomment lines about wheel group

### postgresql

The main wiki page for postgresql installation on Arch Linux is https://wiki.archlinux.org/index.php/PostgreSQL

#### Prevent unexpected major upgrades
After installing the package, edit pacman config to prevent automatic postgresql upgrades

```
sudo vim /etc/pacman.conf
```
Uncomment the line starting with `#IgnorePkg =` and edit it to be
```
IgnorePkg = postgresql*
```

This is important because major postgresql upgrades can change the db schema and break existing
apps that uses postgress to manage thei dbs.

#### Generate locales
Arch for ARM comes pretty raw, if you list the locales with the command `locale -a` the list will
be something like
```
C
POSIX
```

Following the instructions of https://wiki.archlinux.org/index.php/locale you can generate the 
en_US.UTF-8 locale (and maybe the pt_BR while there) by uncommenting the wanted locales on the 
`/etc/locale.gen` file and then running the `sudo locale-gen` command 

#### Initial database cluster

You will need to initialize a cluster before enabling the postgresql service, to make this, use an
user posgres (`sudo -u postgres -i`) to execute this command:

```
initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
```

Return to your user.

#### start and enable the postgresql service
```
sudo systemctl start postgresql
sudo systemctl status postgresql
sudo systemctl enable postgresql
```




-----

#### setting up a swapfile to help compilations that fails with insuficient memory

For example, python package lxml failed with this message when installing stoq-desktop:

    cc1: out of memory allocating 6670160 bytes after a total of 51933184 bytes
    Compile failed: command 'gcc' failed with exit status 1
    creating tmp
    cc -I/usr/include/libxml2 -I/usr/include/libxml2 -c /tmp/xmlXPathInitnxw1f8s3.c -o tmp/xmlXPathInitnxw1f8s3.o
    /tmp/xmlXPathInitnxw1f8s3.c:2:1: warning: return type defaults to 'int' [-Wimplicit-int]
     main (int argc, char **argv) {
     ^~~~
    cc tmp/xmlXPathInitnxw1f8s3.o -L/usr/lib -lxml2 -o a.out
    error: command 'gcc' failed with exit status 1

On cases like that, setting up a swapfile might increase the available memory beyond RAM, by swapping
with the file system.

The official arch Linux wiki page about how to create a swapfile is: https://wiki.archlinux.org/index.php/swap#Swap_file

```
free -h
sudo fallocate -l 512M /swapfile
chmod 600 /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
free -h
```
