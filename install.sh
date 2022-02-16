#!/bin/sh

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
mkdir -p $HOME/.config
rm -f $HOME/.config/starship.toml && ln -s $dir/starship.toml $HOME/.config/starship.toml
rm -f $HOME/.zshrc && ln -s $dir/.zshrc $HOME/.zshrc
rm -f $HOME/.gitconfig && ln -s $dir/.gitconfig $HOME/.gitconfig
