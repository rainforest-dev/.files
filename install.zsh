source ./zsh/functions/fpath.zsh

autoload -Uz backup

# check whether zimfw is available
if ! command -v zimfw &> /dev/null; then
  echo "Zimfw is not installed! Installing zimfw..."
  # check if .zim directory or .zshrc file exists, if does, remove it
  if [ -d "$HOME/.zim" ]; then
    echo "Removing .zim directory..."
    rm -rf $HOME/.zim
  fi
  if [ -f "$HOME/.zshrc" ]; then
    echo "Removing .zshrc file..."
    rm $HOME/.zshrc
  fi
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  source $HOME/.zshrc
else
  echo "Zimfw is already installed!"
fi

# link files under symlinks folder to home directory
for file in $(ls -A symlinks); do
  if [ -f "$HOME/$file" ]; then
    backup $file
  fi
  echo "Linking $file to $HOME..."
  ln -s $(pwd)/symlinks/$file $HOME/$file
done

zimfw install
exec $SHELL