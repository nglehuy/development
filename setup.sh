#!/usr/bin/env sh

go install github.com/mattn/efm-langserver@latest

echo "Installing nvm ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

mkdir ~/.swap-files

echo "Setting up nvm ..."
nvm install --lts
nvm use --lts
npm install -g yarn
nvm install 20
nvm install 18
nvm alias default 20
# yarn global add spaceship-prompt neovim bash-language-server dockerfile-language-server-nodejs eslint eslint-plugin-vue vls sql-language-server

chmod a+x setup_vim.sh && ./setup_vim.sh
chmod a+x setup_zsh.sh && ./setup_zsh.sh

cp $PWD/config/starship.toml $HOME/.config/starship.toml

git config --global user.name "Huy Le Nguyen"
git config --global user.email "nlhuy.cs.16@gmail.com"
git config --global core.editor "nvim"
git config --global push.autosetupremote true
git config --global pull.rebase true

echo "Done installation."
