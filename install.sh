curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
exec $SHELL
mv $HOME/.dir_colors $HOME/.dir_colors.backup
mv $HOME/.zprofile $HOME/.zprofile.backup
mv $HOME/.zshrc $HOME/.zshrc.backup
mv $HOME/.zimrc $HOME/.zimrc.backup
mv $HOME/.p10k.zsh $HOME/.p10k.zsh.backup
ln -s $HOME/.files/nord-dircolors/src/dir_colors $HOME/.dir_colors
ln -s $HOME/.files/.zprofile $HOME
ln -s $HOME/.files/.zshrc $HOME
ln -s $HOME/.files/.zimrc $HOME
ln -s $HOME/.files/.p10k.zsh $HOME
zimfw install
source $HOME/.zshrc
sudo apt install ripgrep neovim
mkdir -p $(dirname $NVIM_CONFIG)
ln -s $HOME/.files/nvim $(dirname $NVIM_CONFIG)
