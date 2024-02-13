source ./zsh/functions/fpath.zsh

autoload -Uz backup
# link files under symlinks folder to home directory
for file in $(ls -A symlinks); do
  if [ -f "$HOME/$file" ]; then
    backup $file
  else
    echo "Linking $file to $HOME..."
    ln -s $(pwd)/symlinks/$file $HOME/$file
  fi
done

# check whether zimfw is available
# if not, install zimfw
if command -v zimfw > /dev/null; then
  echo "Zimfw is not installed! Installing zimfw..."
  # check if .zim directory exists, if does, remove it
  if [ -d "$HOME/.zim" ]; then
    echo "Removing .zim directory..."
    rm -rf $HOME/.zim
  fi
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  # reload shell
  exec $SHELL
else
  echo "Zimfw is already installed!"
fi
zimfw install