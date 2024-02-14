#!/bin/zsh
source ./zsh/functions/fpath.zsh
autoload -Uz backup

# check if neovim is installed
if ! [ $(command -v nvim) ]; then
  echo "Neovim is not installed! Installing neovim..."
  # check system architecture is linux
  if [ "$(uname)" = "Linux" ]; then
    # arm64
    if [ "$(uname -m)" = "aarch64" ]; then
      sudo apt update
      sudo apt install cmake -y
      git clone https://github.com/neovim/neovim.git --branch stable --single-branch
      cd neovim
      make CMAKE_BUILD_TYPE=Release
      sudo make install
      cd .. && sudo rm -rf neovim
    fi
  fi
else
  echo "Neovim is already installed!"
fi

backup $HOME/.config/nvim
echo $(pwd)
ln -s $(pwd)/nvim $HOME/.config/