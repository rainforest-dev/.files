#!/bin/zsh
# macOS only
[ "$(uname)" != "Darwin" ] && exit 0

REPO="$(cd "${0:A:h}/.." && pwd)"
BREWFILE=${BREWFILE:-$REPO/Brewfile.personal}

if ! command -v brew > /dev/null; then
  echo "Homebrew is not installed! Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Make brew available in the current session immediately
  if [ -f /opt/homebrew/bin/brew ]; then       # Apple Silicon
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -f /usr/local/bin/brew ]; then         # Intel
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "Homebrew is already installed!"
fi

brew bundle --file="$BREWFILE"
