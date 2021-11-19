# Path to your oh-my-zsh installation.
export ZSH="/Users/maxcurran/.oh-my-zsh"

ZSH_THEME=robbyrussell

plugins=(
  ag
  docker
  dotenv
  gcloud
  git
  golang
  history
  iterm2
  kubectl
  postgres
  ripgrep
  rsync
)

source $ZSH/oh-my-zsh.sh

# Custom configuration

source ~/.aliases

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
export PATH="$HOME/.rbenv/bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Golang
export GOPATH=${HOME}/go
export PATH=${HOME}/go/bin:$PATH

# Source the relevant files at the start of a new Shell session.
for file in ~/.{aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;

# OpenSSL Homebrew install
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/maxcurran/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/maxcurran/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/maxcurran/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/maxcurran/google-cloud-sdk/completion.zsh.inc'; fi

# Helm
export PATH="/usr/local/opt/helm@2/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
