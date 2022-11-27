alias reload="exec $SHELL"
alias zshconfig="code $HOME/.zsh"

function take() {
  mkdir $1 && cd $1
}

# git
(( $+commands[gh] )) && alias clone="gh repo clone"
alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME" # dotfiles

# python
(( $+commands[python] )) || alias python="python3"
alias py="python"
alias mkvenv="python -m venv ./.venv"
alias venv="source ./.venv/bin/activate"

# speedtest
(( $+commands[networkQuality] )) && alias speedtest="networkQuality" || alias speedtest="python speedtest-cli"

# cat > bat
(( $+commands[bat] )) && alias cat="bat --style=plain"

# ls > exa
(( $+commands[exa] )) && alias ls="exa -lh --icons  --time-style=long-iso --group-directories-first --sort=name --sort=ext"
(( $+commands[exa] )) && alias la="exa -lha --icons --time-style=long-iso --group-directories-first --sort=name --sort=ext"
(( $+commands[exa] )) && alias tree="exa --icons --tree"

# rm > rmtrash
# which rmtrash > /dev/null 2>&1 && alias rm="rmtrash"
(( $+commands[rmtrash] )) && alias rm="rmtrash"
(( $+commands[rmdirtrash] )) && alias rmdir="rmdirtrash"

# tailscale cli on macbook
[[ $DEVICE == "macbook" ]] && alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
