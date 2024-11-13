# Custom configuration; involves enabling the bm executable and bf file alias.
# Source the relevant files at the start of a new Shell session.
source ~/.aliases

# Load autocompletions.
autoload -U compinit; compinit

# Add ~/.local/bin to the PATH to enable to the bm executable
export PATH="$HOME/.local/bin:$PATH"

export DOTFILES="$HOME/repositories/dotfiles" # This is used by bm to find the Brewfile
alias bf='nvim $DOTFILES/Brewfile'

# pyenv
eval "$(pyenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Golang
export GOPATH=${HOME}/go
export PATH=${HOME}/go/bin:$PATH

# OpenSSL Homebrew install
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Helm
export PATH="/usr/local/opt/helm@2/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# Git(Hub)
export GIT_EDITOR="nvim"

# atuin
eval "$(atuin init zsh)"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# For applications that rely on XDG_CONFIG_HOME. Includes neovim.
export XDG_CONFIG_HOME="$HOME"

# bat
export BAT_THEME="Dracula"

# Make sure we can use the Homebrew-installed llvm with the Rust compiler.
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# starship.
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
