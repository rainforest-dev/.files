eval "$($(brew --prefix)/bin/brew shellenv)"

# Homebrew Shell Completion
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

export PYENV_ROOT="$(brew --prefix pyenv)"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
