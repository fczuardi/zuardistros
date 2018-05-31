# new sudo user
# ----------------------------------------
sudo adduser ${username}
sudo usermod -aG sudo ${username}
