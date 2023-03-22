#!/usr/bin/env bash

if ( rustup --version ) < /dev/null > /dev/null 2>&1; then
    echo 'rustup is already installed!'
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
