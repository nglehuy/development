#!/usr/bin/env sh

echo "Removing previous vim plugs ..."
rm -rf $HOME/.vim/plugged

echo "Install python neovim ..."
python3 -m pip config set global.break-system-packages true
python3 -m pip install --user neovim

echo "Install nvim as editor for git ..."
git config --global core.editor "nvim"

echo "Installing vim-plug ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Setting up configurations ..."
cp $PWD/home/.vimrc $HOME/.vimrc
mkdir -p $HOME/.config/nvim
cp -r $PWD/config/nvim/* $HOME/.config/nvim
cat $HOME/.config/nvim/init.vim | sed "s|PYTHON_PATH|$(which python3)|g" | tee $HOME/.config/nvim/init.vim
nvim --headless -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qa
