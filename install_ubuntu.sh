#!/bin/bash

wget https://golang.org/dl/go1.18.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz

sudo apt update

wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb

sudo apt install -y gcc g++ clang ruby git make cmake openssh-client wget curl fzf \
    p7zip unrar unzip zip bzip2 gzip lrzip lz4 lzip lzop xz-utils tar \
    openssl zlibc readline-common sqlite llvm tk libffi7 libffi-dev \
    vim zsh \
    default-jdk default-jre maven \
    ffmpeg libboost-all-dev swig sox \
    neofetch htop xdotool xclip ctags \
    ruby-dev

sudo groupadd docker
sudo usermod -aG docker $USER
