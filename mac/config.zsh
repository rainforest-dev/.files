DIR=$(dirname "$0")

# reset
export LDFLAGS=""
export CPPFLAGS=""

source $DIR/config.utils.zsh
source $DIR/config.dependencies.zsh
source $HOME/.files/config.k8s.zsh

# Config where to link apps installed by Homebrew
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"