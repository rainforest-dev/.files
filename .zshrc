source $HOME/antigen.zsh

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
if [ -f /etc/redhat-release ]; then
  source $HOME/.files/config.centos.zsh
fi
source $HOME/.files/config.python.zsh
source $HOME/.files/config.go.zsh

# pipx
if command -v pipx &> /dev/null; then
  autoload -U bashcompinit                                                        
  bashcompinit                                                                    
  eval "$(register-python-argcomplete pipx)"
fi

# Bind Key
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Created by `pipx` on 2021-07-11 08:46:20
export PATH="$PATH:$HOME/.local/bin"
