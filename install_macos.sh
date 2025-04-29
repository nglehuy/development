#!/usr/bin/env bash

brew install \
    ffmpeg neofetch swig sox vim neovim git git-lfs python3 python@3.10 python@3.11 python@3.12 espeak \
    rust go make cmake gcc jemalloc openssl curl wget fzf \
    clang-format gradle maven openjdk openjdk@11 llvm libomp mecab automake grpc protobuf \
    bazelisk coreutils \
    openssh openvpn postgresql@14 kubectl k9s helm telnet cfssl nmap \
    tmux starship \
    iproute2mac socat flock golang-migrate pnpm unixodbc \
    font-recursive-mono-nerd-font \
    minikube

# [Terraform] CLI
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# [Etcher] Tools to flash OS images to SD cards & USB drives
brew install --cask balenaetcher

# [Google Cloud SDK] CLI
brew install --cask google-cloud-sdk

# [MongoDB] Install MongoDB Database Tools
brew tap mongodb/brew
brew update
brew install mongodb-database-tools

# Unarchiver
brew install --cask the-unarchiver

# [Java] Symlinks
sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# [Keyboard] disable press and hold to make keyboard repeat faster
defaults write -g ApplePressAndHoldEnabled -bool false 