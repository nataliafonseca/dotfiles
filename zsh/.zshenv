# ~/.zshenv should only be a one-liner that sources this file
# echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv

export DOTDIR=~/.dot
export ZDOTDIR=$DOTDIR/zsh
export GIT_CONFIG_GLOBAL=$DOTDIR/git/.gitconfig

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin

export QT_IM_MODULE=ibus
export XCOMPOSEFILE=$DOTDIR/.XCompose

(( $+commands[code] )) && export EDITOR=code

function is_macbook() { [[ $(uname) == "Darwin" ]] && return 0 || return 1 }
function is_pc() { [[ $(hostnamectl hostname) == "pc-linux" ]] && return 0 || return 1 }
function is_homelab() { [[ $(hostnamectl hostname) == "homelab" ]] && return 0 || return 1 }
function is_cloud() { [[ $(hostnamectl hostname) == "cloud" ]] && return 0 || return 1 }
