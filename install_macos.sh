#!/usr/bin/env bash

# Install Homebrew if not installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# https://github.com/tw93/mole
# Install libs
brew install \
    ffmpeg espeak libheif neofetch swig sox vim neovim git git-lfs \
    python3 python@3.10 python@3.11 python@3.12 python@3.14 uv \
    rust go make cmake gcc jemalloc openssl curl wget fzf perl \
    jq yq ripgrep\
    pybind11 abseil re2 libffi xmlsec1 \
    clang-format gradle maven openjdk openjdk@11 openjdk@21 llvm libomp mecab automake grpc protobuf \
    bazelisk coreutils \
    openssh openvpn postgresql@18 postgresql@17 postgresql@15 kubectl k9s helm telnet cfssl nmap trufflehog \
    tmux starship \
    iproute2mac socat flock golang-migrate pnpm unixodbc swaks \
    font-recursive-mono-nerd-font \
    minikube graphviz istioctl \
    rabbitmq \
    opentofu \
    mole \
    wireshark cpanminus

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

# Miniconda
brew install --cask miniconda

# [Java] Symlinks
sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# [Keyboard] disable press and hold to make keyboard repeat faster
defaults write -g ApplePressAndHoldEnabled -bool false 

# Fonts
brew install --cask font-maple-mono-nf font-meslo-for-powerlevel10k font-caskaydia-cove-nerd-font font-jetbrains-mono-nerd-font

# Netbird
curl -fsSL https://pkgs.netbird.io/install.sh | sh

# Mac Apps
brew install --cask \
    raycast \
    doll \
    xkey \
    wireshark-app \
    macs-fan-control \
    the-unarchiver \
    Sanyam-G/switch/switch

# Codegraph
curl -fsSL https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.sh | sh

# Mac Latex
brew install --cask mactex
sudo cpanm --quiet YAML::Tiny File::HomeDir Log::Log4perl Log::Dispatch

# Bun
brew tap oven-sh/bun
brew install oven-sh/bun/bun oven-sh/bun/bun@1.3.10