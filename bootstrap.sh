#!/usr/bin/env bash

# Sets the current directory in the process to the dotfiles directory.
cd "$(dirname "${BASH_SOURCE[0]}")"

# Install and manage any Homebrew-related dependencies.
sh $PWD/bm

# Ensure installation of oh-my-zsh.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Create a symlink for .gitmessage and set the contents of ~/.gitmessage as the commit template.
ln -sf $PWD/.gitmessage ~/.gitmessage
git config --global commit.template ~/.gitmessage

# Set the default name and email for commits.
git config --global user.name "Max Curran"
git config --global user.email "maxcurran96@gmail.com"

# Create symlinks for .aliases and ZSH configuration files.
ln -sf $PWD/.aliases ~/.aliases
ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.zprofile ~/.zprofile
