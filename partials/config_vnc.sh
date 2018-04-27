
read -p "Extra arguments for the vnc server (ex -localhost no -geometry 2560x1080): " vnc_extra_args
tee <<< "vnc_extra_args=${vnc_extra_args}" >> ~/.profile
