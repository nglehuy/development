#!/usr/bin/env sh

wget https://golang.org/dl/go1.18.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz

sudo apt update

sudo apt install -y gcc g++ clang ruby git make cmake openssh-client wget curl fzf \
    p7zip unrar unzip zip bzip2 gzip lrzip lz4 lzip lzop xz-utils tar \
    openssl zlib1g readline-common sqlite3 llvm tk libffi8 libffi-dev \
    vim neovim zsh \
    default-jdk default-jre maven \
    ffmpeg libboost-all-dev swig sox \
    neofetch htop xdotool xclip universal-ctags \
    ruby-dev

sudo groupadd docker
sudo usermod -aG docker $USER
