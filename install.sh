#!/usr/bin/env bash
WD=$(pwd)
echo "Setup dotfiles"
ln -svf "$WD"/alias/alias ~/.alias

if [ -r "~/.config/nvim" ];then
    rm -rf " ~/.config/nvim"
fi
ln -svf "$WD"/nvim/ ~/.config/
#ln -svf "$WD"/zsh/zshrc ~/.zshr
