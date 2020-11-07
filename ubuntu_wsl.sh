#!/usr/bin/env sh

wget https://golang.org/dl/go1.15.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.15.4.linux-amd64.tar.gz

curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update

sudo apt install -y gcc g++ clang ruby git make cmake openssh-client wget curl fzf \
    p7zip unrar unzip zip bzip2 gzip lrzip lz4 lzip lzop xz-utils tar \
    openssl zlibc readline-common sqlite llvm tk libffi7 libffi-dev \
    vim neovim zsh \
    default-jdk default-jre maven \
    ffmpeg libboost-all-dev swig sox \
    neofetch htop xdotool xclip ctags \
    nodejs yarn 

sudo groupadd docker
sudo usermod -aG docker $USER
