#!/usr/bin/env bash

# Sets the current directory in the process to the dotfiles directory.
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# Ensure installation of oh-my-zsh.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Create a symlink for .gitmessage and set the contents of ~/.gitmessage as the commit template.
ln -sf "$PWD"/.gitmessage "$HOME"/.gitmessage
git config --global commit.template "$HOME"/.gitmessage

# Set the default name and email for commits.
git config --global user.name "Max Curran"
git config --global user.email "maxcurran96@gmail.com"

# Create symlinks for .aliases and ZSH configuration files.
ln -sf "$PWD"/.aliases "$HOME"/.aliases
ln -sf "$PWD"/.zshrc "$HOME"/.zshrc
ln -sf "$PWD"/.zprofile "$HOME"/.zprofile

# Source these during bootstrapping to reflect changes in the current shell session.
source "$HOME"/.zshrc "$HOME"/.zprofile

# Create ~/.local/bin if it doesn't exist already, and create the symlink for bm.
mkdir -p "$HOME"/.local/bin
ln -sf "$PWD"/bm "$HOME"/.local/bin

# Install and manage any Homebrew-related dependencies.
bm
