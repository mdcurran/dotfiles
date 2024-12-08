#!/usr/bin/env bash

# Sets the current directory in the process to the dotfiles directory.
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# Create a symlink for .gitmessage and set the contents of ~/.gitmessage as the commit template.
ln -sf "$PWD"/.gitmessage "$HOME"/.gitmessage
git config --global commit.template "$HOME"/.gitmessage

# Set the default name and email for commits.
git config --global user.name "Max Curran"
git config --global user.email "maxcurran96@gmail.com"
# Ensure git uses ssh instead of HTTPS. This is particularly useful for installing vim plugins.
git config --global --add url."git@github.com:".insteadOf "https://github.com/"

# Exclude /scratch directories from any local git repository
git config --global core.excludesFile "$HOME"/.gitignore.global
if [ ! -f "$HOME"/.gitignore.global ]; then
    echo '/_scratch' >> ~/.gitignore.global
    echo '/scratch' >> ~/.gitignore.global
fi

# Ensure all git commits are signed by a GPG key.
git config --global commit.gpgsign true
git config --global user.signingkey "$(pass Personal/gpg_signing_key)"

# Additional git configuration.
git config --global branch.sort -committerdate
git config --global column.ui auto
git config --global rerere.enabled true

# Create symlinks for .aliases and ZSH configuration files.
ln -sf "$PWD"/.aliases "$HOME"/.aliases
ln -sf "$PWD"/.zshrc "$HOME"/.zshrc
ln -sf "$PWD"/.zprofile "$HOME"/.zprofile

# neovim configuration.
ln -sf "$PWD"/nvim "$HOME"/nvim

# WezTerm configuration
ln -sf "$PWD"/wezterm/wezterm.lua "$HOME"/.wezterm.lua

# starship configuration
mkdir -p "$HOME"/.config
ln -sf "$PWD"/starship/starship.toml "$HOME"/.config/starship.toml

# Source these during bootstrapping to reflect changes in the current shell session.
source "$HOME"/.zshrc "$HOME"/.zprofile

# Create ~/.local/bin if it doesn't exist already, and create the symlink for bm.
mkdir -p "$HOME"/.local/bin
ln -sf "$PWD"/bm "$HOME"/.local/bin

# Install and manage any Homebrew-related dependencies.
bm

# Install any software/dependencies outside of Homebrew.
# Generally this requires fetching a file from some server and running `sh`.
sh "installers.sh"
