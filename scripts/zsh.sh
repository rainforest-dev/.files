#!/bin/bash
# Install zsh (Linux only — macOS ships with zsh) and set as default shell
if [ "$(uname)" != "Darwin" ]; then
  if ! command -v zsh > /dev/null; then
    echo "Zsh is not installed! Installing zsh..."
    sudo apt update
    sudo apt install zsh -y
  else
    echo "Zsh is already installed!"
  fi
fi
sudo chsh -s "$(which zsh)" "$USER"
