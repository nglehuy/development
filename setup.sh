#!/usr/bin/env sh

go get github.com/mattn/efm-langserver

echo "Installing nvm ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Installing vim-plug ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.swap-files

echo "Installing starship ..."
curl -sS https://starship.rs/install.sh | sh

echo "Setting up nvm ..."
nvm install 12
nvm use 12
npm install -g yarn
yarn global add spaceship-prompt neovim bash-language-server dockerfile-language-server-nodejs eslint eslint-plugin-vue vls sql-language-server
gem install neovim solargraph

chmod a+x setup_vim.sh && ./setup_vim.sh
chmod a+x setup_zsh.sh && ./setup_zsh.sh

echo "Done installation."
