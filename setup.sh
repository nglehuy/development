#!/usr/bin/env sh

go get github.com/mattn/efm-langserver

echo "Installing nvm ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Installing vim-plug ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.swap-files

npm install -g spaceship-prompt neovim bash-language-server dockerfile-language-server-nodejs eslint eslint-plugin-vue vls sql-language-server
gem install neovim solargraph

echo "Setting up zsh ..."
# Oh my zsh
export ZSH="$HOME/.zsh/oh-my-zsh"
[ ! -d "$HOME/.zsh/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Zsh auto suggestion
[ ! -d "$HOME/.zsh/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
# Zsh syntax highlighting
[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting

echo "Setting up configurations ..."
cp -l -f -T -r $PWD/home $HOME
cp -l -f -T -r $PWD/config $HOME/.config
nvim -E -s -u "$HOME/.config/nvim/init.vim" +PlugInstall +qa

echo "Done installation."
