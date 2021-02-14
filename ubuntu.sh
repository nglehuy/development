#!/bin/bash

sudo snap install go --classic

sudo apt update

sudo apt install -y gcc g++ clang ruby git make cmake openssh-client wget curl openvpn \
    p7zip unrar unzip zip bzip2 gzip lrzip lz4 lzip lzop xz-utils tar \
    openssl readline-common sqlite llvm tk libffi-dev \
    vim neovim zsh \
    default-jdk default-jre maven \
    ffmpeg libboost-all-dev swig sox \
    neofetch htop xdotool xclip universal-ctags \
    yarn docker docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER
