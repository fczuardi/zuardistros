# setup vnc server auto-launch
# ------------------------------
read -p "Extra arguments for the vnc server (ex -localhost no -geometry 2560x1080): " vnc_extra_args
tee <<< "tigervncserver -useold ${vnc_extra_args}" >> ~/.profile
tee <<< "echo Remote desktop running, use ${bold}ssh $(whoami)@$(hostname) -L 5901:localhost:5901${normal} to connect or ${bold}vncserver -kill${normal} to stop it" >> ~/.profile

