#!/bin/zsh
set -e
REPO="$(cd "${0:A:h}/.." && pwd)"
source "$REPO/zsh/functions/fpath.zsh"
autoload -Uz backup

# check if neovim is installed
if ! command -v nvim > /dev/null; then
  echo "Neovim is not installed! Installing neovim..."
  if [ "$(uname)" = "Linux" ]; then
    if [ "$(uname -m)" = "aarch64" ]; then
      # ARM64: build from source
      sudo env DEBIAN_FRONTEND=noninteractive apt-get update -q
      sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y cmake
      git clone https://github.com/neovim/neovim.git --branch stable --single-branch
      cd neovim
      make CMAKE_BUILD_TYPE=Release
      sudo make install
      cd .. && sudo rm -rf neovim
    else
      # x86_64 Linux
      sudo env DEBIAN_FRONTEND=noninteractive apt-get update -q
      sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y neovim
    fi
  elif [ "$(uname)" = "Darwin" ]; then
    brew install neovim
  fi
else
  echo "Neovim is already installed!"
fi

mkdir -p "$HOME/.config"
# backup handles dirs and regular files; also handle symlinks
if [ -L "$HOME/.config/nvim" ]; then
  rm "$HOME/.config/nvim"
else
  backup "$HOME/.config/nvim"
fi
ln -s "$REPO/nvim" "$HOME/.config/nvim"
