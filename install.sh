#!/usr/bin/env bash
WD=$(pwd)
echo "Setup dotfiles"
ln -svf "$WD"/alias/alias ~/.alias
ln -svf "$WD"/nvim/lua/custom ~/.config/nvim/lua

#ln -svf "$WD"/zsh/zshrc ~/.zshr
