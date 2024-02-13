#!/bin/bash
# check if zsh is installed and install it with apt
# change default shell to zsh
if [ -z "$ZSH_VERSION" ]; then
  echo "Zsh is not installed! Installing zsh..."
  sudo apt update
  sudo apt install zsh -y
else
  echo "Zsh is already installed!"
fi
sudo chsh -s $(which zsh) $USER
SHELL=$(which zsh)

zsh install.zsh