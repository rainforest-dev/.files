DIR=$(dirname "$0")

# reset
export LDFLAGS=""
export CPPFLAGS=""

source $DIR/config.utils.zsh
source $DIR/config.dependencies.zsh

# Config where to link apps installed by Homebrew
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"