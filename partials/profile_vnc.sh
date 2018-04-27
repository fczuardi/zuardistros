# setup vnc server auto-launch
# ----------------------------------------
tigervncserver -useold ${vnc_extra_args}
echo Remote desktop running, use ${bold}ssh $(whoami)@$(hostname) -L 5901:localhost:5901${normal} to connect or ${bold}vncserver -kill${normal} to stop it

