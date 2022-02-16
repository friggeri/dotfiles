#!/bin/sh

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
mkdir -p $HOME/.config
rm $HOME/.config/starship.toml && ln -s $dir/starship.toml $HOME/.config/starship.toml
rm $HOME/.zshrc && ln -s $dir/.zshrc $HOME/.zshrc
rm $HOME/.gitconfig && ln -s $dir/.gitconfig $HOME/.gitconfig
