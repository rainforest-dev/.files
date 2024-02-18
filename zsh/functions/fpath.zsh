local zfunctions=$(pwd)/zsh/functions
echo "Adding zsh functions in $zfunctions to fpath..."
fpath=(
  $zfunctions
  $fpath
)