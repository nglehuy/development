#!/usr/bin/env sh

echo "Updating..."

cp -rf $HOME/.vimrc $PWD/home/.vimrc

cp -rf $HOME/.config/nvim/* $PWD/config/nvim/* 

cp -rf $HOME/.zshrc $PWD/home/.zshrc 

cp -rf $HOME/.config/starship.toml $PWD/config/starship.toml

echo "Updated development configurations"
