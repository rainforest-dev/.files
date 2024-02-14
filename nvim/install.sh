#!/bin/bash
echo "Installing neovim..."
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
    cd .. && rm -rf neovim
  fi
  exit 1
fi
