# x86_64 or arm64 homebrew
ARCH=${1:-$(uname -m)}
echo "Running on $ARCH"
export BREW_X86_ROOT=/usr/local
export BREW_ARM64_ROOT=/opt/homebrew

alias rbrew="arch -x86_64 $BREW_X86_ROOT/bin/brew"
alias abrew="arch -arm64 $BREW_ARM64_ROOT/bin/brew"

if [[ $ARCH = "x86_64" ]]; then
  export BREW_ROOT=$BREW_X86_ROOT
  alias brew=rbrew
elif [[ $ARCH = "arm64" ]]; then
  export BREW_ROOT=$BREW_ARM64_ROOT
  alias brew=abrew
else
fi