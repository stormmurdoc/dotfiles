#!/usr/bin/env bash
WD=$(pwd)
echo "+++ Setup dotfiles +++"
ln -svf "$WD"/alias/alias ~/.alias
ln -svf "$WD"/zsh/zshrc ~/.zshrc
ln -svf "$WD"/git/config ~/.gitconfig
ln -svf "$WD"/lf/ ~/.config/
ln -svf "$WD"/tmux/ ~/.config/
ln -svf "$WD"/lazygit / ~/.config/
echo "+++ Setup dotfiles - done +++"
