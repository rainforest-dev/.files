# .files

![image](https://user-images.githubusercontent.com/55678466/136655528-d583a267-877a-4282-bdda-9d2fcde4a3fd.png)

## Setup
```bash
git clone https://github.com/r08521610/.files.git --branch zim --single-branch --recurse-submodules -j8
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
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
```
### Neovim
```bash
sudo pacman -S neovim
mkdir -p $(dirname $NVIM_CONFIG)
ln -s $HOME/.files/nvim $(dirname $NVIM_CONFIG)
```
