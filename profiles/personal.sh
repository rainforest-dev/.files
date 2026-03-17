#!/bin/bash
set -e
DIR="$(cd "$(dirname "$0")/.." && pwd)"

bash "$DIR/scripts/zsh.sh"
zsh "$DIR/scripts/zim.zsh"

# Install Homebrew + bundle (synchronous — must finish before tools that need brew)
BREWFILE="${BREWFILE:-$DIR/Brewfile.personal}" zsh "$DIR/scripts/homebrew.zsh"

# Source brew into this bash session so subsequent scripts can use it
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

zsh "$DIR/scripts/neovim.zsh"
zsh "$DIR/scripts/lazygit.zsh"

[ -t 1 ] && exec "$(which zsh)"
