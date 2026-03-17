#!/usr/bin/env bats

@test "zsh is installed" {
  command -v zsh
}

@test "zimfw is installed" {
  [ -f "$HOME/.zim/zimfw.zsh" ]
}

@test "dotfile symlinks are created" {
  [ -L "$HOME/.zimrc" ]
  [ -L "$HOME/.zprofile" ]
}

@test "neovim is installed" {
  command -v nvim
}

@test "neovim config is linked" {
  [ -L "$HOME/.config/nvim" ]
}
