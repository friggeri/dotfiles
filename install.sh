#!/bin/sh

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

mkdir -p $HOME/.config
ln -s $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
