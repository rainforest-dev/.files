# check if homebrew is installed
if ! [ $(command -v brew) ]; then
  echo "Homebrew is not installed! Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed!"
fi

brew bundle