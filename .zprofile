eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
eval "$(rbenv init - --path)"

# Source Cargo (Rust) environment variables.
. "$HOME/.cargo/env"
