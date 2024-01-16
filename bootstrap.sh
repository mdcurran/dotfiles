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
# Ensure git uses ssh instead of HTTPS. This is particularly useful for installing vim plugins.
git config --global --add url."git@github.com:".insteadOf "https://github.com/"

# Exclude /scratch directories from any local git repository
git config --global core.excludesFile "$HOME"/.gitignore.global
echo '/_scratch' >> ~/.gitignore.global
echo '/scratch' >> ~/.gitignore.global

# Ensure all git commits are signed by a GPG key.
git config --global commit.gpgsign true
git config --global user.signingkey 7304C155A8230E5E

# Create symlinks for .aliases and ZSH configuration files.
ln -sf "$PWD"/.aliases "$HOME"/.aliases
ln -sf "$PWD"/.zshrc "$HOME"/.zshrc
ln -sf "$PWD"/.zprofile "$HOME"/.zprofile

# neovim configuration.
ln -sf "$PWD"/nvim "$HOME"/nvim

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME"/.local/share/nvim/site/pack/packer/start/packer.nvim

# Source these during bootstrapping to reflect changes in the current shell session.
source "$HOME"/.zshrc "$HOME"/.zprofile

# Create ~/.local/bin if it doesn't exist already, and create the symlink for bm.
mkdir -p "$HOME"/.local/bin
ln -sf "$PWD"/bm "$HOME"/.local/bin
ln -sf "$PWD"/zig-update "$HOME"/.local/bin

# Install and manage any Homebrew-related dependencies.
bm

# Install any software/dependencies outside of Homebrew.
# Generally this requires fetching a file from some server and running `sh`.
sh "installers.sh"
