# Homebrew Shell Completion
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
