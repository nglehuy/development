#!/usr/bin/env sh

brew install \
    ffmpeg neofetch swig sox vim neovim git git-lfs python3 python@3.10 python@3.11 python@3.12 espeak \
    rust go make cmake gcc jemalloc openssl curl wget fzf \
    clang-format gradle maven openjdk llvm libomp mecab automake grpc protobuf \
    bazelisk coreutils \
    openssh openvpn postgresql@14 kubectl \
    starship google-cloud-sdk \
    iproute2mac flock \
    font-recursive-mono-nerd-font

sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
