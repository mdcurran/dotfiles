#!/usr/bin/env bash

# Copy aliases file to ~/.aliases
cp aliases ~/.aliases

for file in ~/.{aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;

# Copy gitmessage file to ~/.gitmessage
cp gitmessage ~/.gitmessage
# Set the contents of ~/.gitmessage as the commit template
git config --global commit.template ~/.gitmessage
