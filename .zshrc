# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Golang
export PATH=${HOME}/go/bin:$PATH

# Source the relevant files at the start of a new Shell session.
for file in ~/.{aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;

# Enables scrolling when viewing files with bat
export BAT_PAGER="less -RF"
