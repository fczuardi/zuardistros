# Alacritty Terminal
# ----------------------------------------
read -p "Download [B]inary or Install from [S]ource? (B/s)" installation_type
case ${installation_type:0:1} in
    s|S )
      # requires: rust/rustup
      rustup override set stable
      rustup update stable
      cargo install --git https://github.com/jwilm/alacritty
    ;;
    * )
      mkdir -p ~/.local/bin
      curl -Lo ~/.local/bin/alacritty.gz https://github.com/fczuardi/alacritty/releases/download/0.1.0/alacritty.gz
      gzip -d ~/.local/bin.alacritty.gz
    ;;
esac

