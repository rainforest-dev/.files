#!/bin/zsh
source ./zsh/functions/fpath.zsh
autoload -Uz backup

# check whether zimfw is available
local zim_home=${ZIM_HOME:-$HOME/.zim}
if [[ ! -e $zim_home/zimfw.zsh ]]; then
  echo "Zimfw is not installed! Installing zimfw..."
  # check if .zim directory or .zshrc file exists, if does, remove it
  if [ -d "$zim_home/.zim" ]; then
    echo "Removing .zim directory..."
    rm -rf $zim_home/.zim
  fi
  if [ -f "$HOME/.zshrc" ]; then
    echo "Removing .zshrc file..."
    rm $HOME/.zshrc
  fi
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
else
  echo "Zimfw is already installed!"
fi

source $HOME/.zshrc

# link files under symlinks folder to home directory
for file in $(ls -A symlinks); do
  if [ -f "$HOME/$file" ]; then
    backup $HOME/$file
  fi
  echo "Linking $file to $HOME..."
  ln -s $(pwd)/symlinks/$file $HOME/$file
done
backup $ZIM_HOME/modules/custom
ln -s $(pwd)/modules $ZIM_HOME/modules/custom

zimfw install
exec $SHELL