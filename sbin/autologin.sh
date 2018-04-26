# autologin
# ----------------------------------------
cp /lib/systemd/system/getty@.service /lib/systemd/system/getty@.service.`date +%s`.bk
read -p "Username for autologin: " username
sed -i -e "s/agetty -.*/agetty --autologin ${username} %I \$TERM/" /lib/systemd/system/getty@.service
