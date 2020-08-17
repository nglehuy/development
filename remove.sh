#!/usr/bin/env sh

echo "Removing..."

rm -rf $HOME/.vim $HOME/.zsh $HOME/.oh-my-zsh

rm -rf $HOME/.vimrc $HOME/.zshrc

rm -rf $HOME/.config/nvim

rm -rf $HOME/.config/flake8 $HOME/.config/pep8

echo "Removed development configurations"
