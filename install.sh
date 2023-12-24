#!/usr/bin/env bash
WD=$(pwd)
echo "Setup dotfiles"
ln -svf "$WD"/alias/alias ~/.alias
rm -rf ~/.config/nvim
ln -svf "$WD"/nvim/ ~/.config/
#ln -svf "$WD"/zsh/zshrc ~/.zshr
