# reset
export LDFLAGS=""
export CPPFLAGS=""

source $HOME/.files/config.utils.zsh
source $HOME/.files/config.dependencies.zsh

NVIM_CONFIG=$HOME/.config/nvim

# activate [nord-dircolors](https://github.com/arcticicestudio/nord-dircolors)
test -r "$HOME/.dir_colors" && eval $(dircolors $HOME/.dir_colors)

# Config where to link apps installed by Homebrew
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

