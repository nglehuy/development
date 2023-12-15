#!/usr/bin/env sh

echo "Installing development tools ..."
sudo pacman -Syu --noconfirm --needed gcc clang go ruby git make cmake openssh wget curl fzf \
    p7zip unrar unzip zip unarchiver bzip2 gzip lrzip lz4 lzip lzop xz tar \
    base-devel openssl zlib readline sqlite llvm ncurses xz tk python-pyopenssl libffi \
    python python-pip pyenv \
    vim neovim zsh \
    nodejs yarn npm \
    jdk-openjdk jre-openjdk maven \
    ffmpeg \
    boost swig sox \
    neofetch htop xdotool xclip ctags

echo "Installing starship ..."
curl -sS https://starship.rs/install.sh | sh