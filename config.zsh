source $HOME/.files/config.utils.zsh

NVIM_CONFIG=$HOME/.config/nvim

# activate [nord-dircolors](https://github.com/arcticicestudio/nord-dircolors)
test -r "$HOME/.dir_colors" && eval $(dircolors $HOME/.dir_colors)
