# https://wiki.archlinux.org/index.php/Avahi
# Hostname resolution
# Avahi provides local hostname resolution using a "hostname.local" naming scheme. To enable it, install the nss-mdns package and start avahi-daemon.service.
# Then, edit the file /etc/nsswitch.conf and change the hosts line to include mdns_minimal [NOTFOUND=return] before resolve and dns:
# hosts: ... mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns ...
# Note: If you experience slowdowns in resolving .local hosts try to use mdns4_minimal instead of mdns_minimal.
