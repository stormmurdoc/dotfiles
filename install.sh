#!/usr/bin/env bash
WD=$(pwd)
echo "Setup dotfiles"
ln -svf "$WD"/alias/alias ~/.alias
ln -svf "$WD"/nvim/ ~/.config/
#ln -svf "$WD"/zsh/zshrc ~/.zshr
