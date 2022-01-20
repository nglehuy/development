#!/usr/bin/env sh

echo "Setting up zsh ..."
# Oh my zsh
export ZSH="$HOME/.zsh/oh-my-zsh"
[ ! -d "$HOME/.zsh/oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Zsh auto suggestion
[ ! -d "$HOME/.zsh/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
# Zsh syntax highlighting
[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting

echo "Setting config zsh ..."
cp $PWD/home/.zshrc $HOME/.zshrc