source /opt/homebrew/share/antigen/antigen.zsh

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

antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle r08521610/history-sync

# Theme
# antigen theme denysdovhan/spaceship-prompt
antigen theme dracula/zsh

antigen apply

# reset
export LDFLAGS=""
export CPPFLAGS=""

source $HOME/.files/config.zsh
source $HOME/.files/config.homebrew.zsh $ARCH
source $HOME/.files/config.functions.zsh
source $HOME/.files/config.dependencies.zsh
source $HOME/.files/config.python.zsh
source $HOME/.files/config.java.zsh
source $HOME/.files/config.go.zsh
source $HOME/.files/config.k8s.zsh

# activate [nord-dircolors](https://github.com/arcticicestudio/nord-dircolors)
test -r "$HOME/.dir_colors" && eval $(dircolors $HOME/.dir_colors)

# Created by `pipx` on 2021-04-28 13:15:39
export PATH="$PATH:/Users/rainforest/.local/bin"

# pipx
if command -v pipx &> /dev/null; then
  autoload -U bashcompinit                                                        
  bashcompinit                                                                    
  eval "$(register-python-argcomplete pipx)"
fi
# Config where to link apps installed by Homebrew
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

# Bind Key
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

cat $HOME/.files/anscii-headers/rainforest.ansi-shadow | lolcat
