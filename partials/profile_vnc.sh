# setup vnc server auto-launch
# ----------------------------------------
tigervncserver -useold
echo Remote desktop running, use ${bold}ssh $(whoami)@$(hostname).local -L 5901:localhost:5901${normal} to connect or ${bold}vncserver -kill${normal} to stop it

