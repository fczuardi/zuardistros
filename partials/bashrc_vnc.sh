# setup vnc server auto-launch
# ------------------------------
read -p "Extra arguments for the vnc server (ex -geometry 2560x1080): " vnc_extra_args
tee <<< "tigervncserver -useold -localhost no ${vnc_extra_args}" >> ~/.bashrc

