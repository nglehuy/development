#!/usr/bin/env sh

echo "Removing previous vim plugs ..."
rm -rf $HOME/.vim/plugged

echo "Setting up configurations ..."
cp $PWD/home/.vimrc $HOME/.vimrc
yes | cp -r $PWD/config/nvim/* $HOME/.config/nvim
nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qa