source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle brew
antigen bundle pip
antigen bundle pyenv
antigen bundle darvid/zsh-poetry
antigen bundle command-not-found
antigen bundle history-substring-search

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

# Theme
# antigen theme denysdovhan/spaceship-prompt
antigen theme dracula/zsh

antigen apply

source $HOME/.files/config.zsh
source $HOME/.files/config.python.zsh
source $HOME/.files/config.java.zsh
source $HOME/.files/config.go.zsh

# Created by `pipx` on 2021-04-28 13:15:39
export PATH="$PATH:/Users/rainforest/.local/bin"

# Bind Key
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

