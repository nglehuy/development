#!/usr/bin/env bash

source_dir=$1
target_dir=$2

if [ -z "$source_dir" ] || [ -z "$target_dir" ]; then
  echo "Usage: $0 <source_dir> <target_dir>"
  exit 1
fi

cp -rv $source_dir/.*rc $target_dir

mkdir -p $target_dir/.config
cp -rv $source_dir/.config/* $target_dir/.config

cp -rv $source_dir/.zsh* $target_dir

cp -rv $source_dir/.tmux* $target_dir

cp -rv $source_dir/.gitconfig $target_dir

mkdir -p $target_dir/.ssh
cp -rv $source_dir/.ssh/id_rsa* $target_dir/.ssh
cp -rv $source_dir/.ssh/known_hosts $target_dir/.ssh

mkdir -p $target_dir/.oci
cp -rv $source_dir/.oci/* $target_dir/.oci