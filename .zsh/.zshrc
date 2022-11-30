if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $HOME/.zsh/partials/p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

source $HOME/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
source $HOME/.zsh/plugins/zsh-z/zsh-z.plugin.zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
unsetopt beep nomatch

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -e
bindkey "^[[A" up-line-or-beginning-search   # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^[[H" beginning-of-line             # Home
bindkey "^[[F" end-of-line                   # End
bindkey "^[[3~" delete-char                  # Delete

# environment, aliases and functions
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin
export AUTOSWITCH_VIRTUAL_ENV_DIR=".venv"

function take() {
  mkdir $1 && cd $1
}

alias reload="exec $SHELL"
# alias zshconfig="code $ZDOTDIR"
alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME"

(( $+commands[networkQuality] )) && alias speedtest="networkQuality" || alias speedtest="python speedtest-cli"
(( $+commands[bat] )) && alias cat="bat --style=plain"
(( $+commands[exa] )) && alias ls="exa -lh --icons  --time-style=long-iso --group-directories-first --sort=name --sort=ext"
(( $+commands[exa] )) && alias la="exa -lha --icons --time-style=long-iso --group-directories-first --sort=name --sort=ext"
(( $+commands[exa] )) && alias tree="exa --icons --tree"
(( $+commands[rmtrash] )) && alias rm="rmtrash"
(( $+commands[rmdirtrash] )) && alias rmdir="rmdirtrash"
(( $+commands[gh] )) && alias clone="gh repo clone"
(( $+commands[python] )) || alias python="python3"

if [[ $(uname) == "Darwin" ]]; then
  export DEVICE=macbook
  source $HOME/.zsh/partials/homebrew.zsh
  source $HOME/.zsh/partials/android.zsh
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
elif [[ $(hostnamectl hostname) == "pc-linux" ]]; then
  export DEVICE=pc
  source $HOME/.zsh/partials/openrgb.zsh
  source $HOME/.zsh/partials/caddy.zsh
elif [[ $(hostnamectl hostname) == "homelab" ]]; then
  export DEVICE=homelab
  source $HOME/.zsh/partials/caddy.zsh
elif [[ $(hostnamectl hostname) == "cloud" ]]; then
  export DEVICE=cloud
fi

source $HOME/.zsh/partials/nvm.zsh
source $HOME/.zsh/partials/docker.zsh
