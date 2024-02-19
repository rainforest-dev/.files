#!/bin/bash
# check if zsh is installed and install it with apt
# change default shell to zsh
if ! [ $(command -v zsh) ]; then
  echo "Zsh is not installed! Installing zsh..."
  sudo apt update
  sudo apt install zsh -y
else
  echo "Zsh is already installed!"
fi
sudo chsh -s $(which zsh) $USER
SHELL=$(which zsh)

if [ "$(uname)" = "Darwin" ]; then
  ./mac.zsh
fi

./install.zsh &
./nvim/install.zsh &
wait
exec $SHELL