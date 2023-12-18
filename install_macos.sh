#!/usr/bin/env sh

brew install \
    ffmpeg neofetch swig sox vim neovim git python3 python@3.10 python@3.9 espeak \
    rust go make cmake gcc openssl curl wget fzf \
    clang-format gradle maven openjdk llvm libomp mecab automake grpc protobuf \
    bazelisk coreutils \
    openssh openvpn postgresql kubectl \
    starship google-cloud-sdk

sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
