#!/usr/bin/env bash

# Check for Homebrew installation. If not installed, then install latest
# version. macOS comes with a system version of Ruby that can be used for this.
if ( brew --version ) < /dev/null > /dev/null 2>&1; then
    echo 'Homebrew is already installed!'
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Install the Cask extension for Homebrew (if not already installed).
if ( brew cask --version; ) < /dev/null > /dev/null 2>&1; then
    echo 'Caskroom tapped already'
else
    brew tap caskroom/cask;
fi

# Check that the Homebrew bundle functionality is enabled, then install the
# dependencies listed in the Brewfile.
if ( brew bundle check; ) < /dev/null > /dev/null 2>&1; then
    echo 'Brewfiles enabled'
else
    brew tap Homebrew/bundle;
    brew bundle;
fi

# Clean-up and diagnose any potential problems.
brew cleanup && brew prune && brew doctor

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
