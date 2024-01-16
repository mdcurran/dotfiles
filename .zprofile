eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
eval "$(rbenv init - --path)"

# GPG
export GPG_TTY=$(tty)

# Source Cargo (Rust) environment variables.
. "$HOME/.cargo/env"
