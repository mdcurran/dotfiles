#!/usr/bin/env bash

# Install and manage any Homebrew-related dependencies.
sh brew_manager.sh

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy .gitmessage to ~/.gitmessage and set the contents of ~/.gitmessage as the commit template.
cp .gitmessage ~/.gitmessage
git config --global commit.template ~/.gitmessage
# Set the default name and email for commits.
git config --global user.name "Max Curran"
git config --global user.email "maxcurran96@gmail.com"

# Copy .aliases to ~/.aliases.
cp .aliases ~/.aliases

# Copy .zshrc to ~/.zshrc.
cp .zshrc ~/.zshrc
cp .zprofile ~/.zprofile
