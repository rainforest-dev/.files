#!/bin/zsh
REPO="$(cd "${0:A:h}/.." && pwd)"
source "$REPO/zsh/functions/fpath.zsh"
autoload -Uz backup

# check if neovim is installed
if ! command -v nvim > /dev/null; then
  echo "Neovim is not installed! Installing neovim..."
  if [ "$(uname)" = "Linux" ]; then
    if [ "$(uname -m)" = "aarch64" ]; then
      # ARM64: build from source
      sudo apt update
      sudo apt install cmake -y
      git clone https://github.com/neovim/neovim.git --branch stable --single-branch
      cd neovim
      make CMAKE_BUILD_TYPE=Release
      sudo make install
      cd .. && sudo rm -rf neovim
    else
      # x86_64 Linux
      sudo apt update && sudo apt install neovim -y
    fi
  elif [ "$(uname)" = "Darwin" ]; then
    brew install neovim
  fi
else
  echo "Neovim is already installed!"
fi

backup $HOME/.config/nvim
echo "$REPO"
ln -s "$REPO/nvim" $HOME/.config/
