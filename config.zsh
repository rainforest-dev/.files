if [[ $TERM_PROGRAM == "vscode" ]]; then
  source $HOME/.zprofile
fi

# https://electrictoolbox.com/bash-script-directory/
DIR=$(dirname "$0")

source $DIR/config.utils.zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
  source $DIR/mac/config.zsh
fi

NVIM_CONFIG=$HOME/.config/nvim
# export DOCKER_HOST=ssh://rainforest@rainforest-manjaro

# activate [nord-dircolors](https://github.com/arcticicestudio/nord-dircolors)
test -r "$HOME/.dir_colors" && eval $(dircolors $HOME/.dir_colors)
