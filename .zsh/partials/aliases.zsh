alias reload="exec $SHELL"
alias zshconfig="code $HOME/.zsh"

function take() {
  mkdir $1 && cd $1
}

# git
alias clone="gh repo clone"
alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME" # dotfiles

function giteris() {
  git config --local user.name "Natalia Braga da Fonseca - NFO"
  git config --local user.email natalia.fonseca@iteris.com.br
}

function gnutrien() {
  git config --local user.name "Natalia Fonseca"
  git config --local user.email natalia.fonseca@nutrien.com
}

# python
alias py="python"
alias mkvenv="python -m venv ./.venv"
alias venv="source ./.venv/bin/activate"

# cat and ls to exa and bat
which exa >/dev/null 2>&1 && alias ls="exa -lh --icons  --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa >/dev/null 2>&1 && alias la="exa -lha --icons --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa >/dev/null 2>&1 && alias tree="exa --icons --tree"
which bat >/dev/null 2>&1 && alias cat="bat --style=plain"

# docker
function dsh() {
  docker exec -it $1 sh
}

# macos only
if [[ $DEVICE == "macbook" ]]; then
  alias speedtest="networkQuality"
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi
