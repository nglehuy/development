#!/usr/bin/env sh

echo "Updating..."

cp -Rf $HOME/.vimrc $PWD/home/.vimrc

cp -Rf $HOME/.config/nvim/* $PWD/config/nvim/

cp -Rf $HOME/.zshrc $PWD/home/.zshrc 

cp -Rf $HOME/.tmux.conf $PWD/home/.tmux.conf 

cp -Rf $HOME/.config/starship.toml $PWD/config/starship.toml

echo "Updated development configurations"
