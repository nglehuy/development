#!/usr/bin/env sh

echo "Setting up zsh ..."
# Oh my zsh
export ZSH="$HOME/.zsh/oh-my-zsh"
[ ! -d "$HOME/.zsh/oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Zsh auto suggestion
[ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
# Zsh syntax highlighting
[ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting

echo "Setting config zsh ..."
cp $PWD/home/.zshrc $HOME/.zshrc

chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh
