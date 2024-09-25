#!/usr/bin/env sh

echo "Removing previous vim plugs ..."
rm -rf $HOME/.vim/plugged

echo "Install python neovim ..."
python3 -m pip config set global.break-system-packages true
python3 -m pip install --user neovim

echo "Install nvim as editor for git ..."
git config --global core.editor "nvim"

echo "Setting up configurations ..."
cp $PWD/home/.vimrc $HOME/.vimrc
mkdir -p $HOME/.config/nvim && yes | cp -r $PWD/config/nvim/* $HOME/.config/nvim
nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qa
