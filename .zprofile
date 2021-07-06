# setup arm64 version homebrew 
ARCH=$(uname -m)
if [[ $ARCH = "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew Shell Completion
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# export PYENV_ROOT="$(brew --prefix pyenv)"
# export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
