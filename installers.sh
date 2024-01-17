#!/usr/bin/env bash

# Rust
if ( rustup --version ) < /dev/null > /dev/null 2>&1; then
    echo 'rustup is already installed!'
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# krew
if ( kubectl krew ) < /dev/null > /dev/null 2>&1; then
    echo 'The krew plugin for kubectl is already installed!'
else
    (
    set -x; cd "$(mktemp -d)" &&
        OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
        ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
        KREW="krew-${OS}_${ARCH}" &&
        curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
        tar zxvf "${KREW}.tar.gz" &&
        ./"${KREW}" install krew
    )
fi
