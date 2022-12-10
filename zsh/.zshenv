# ~/.zshenv should only be a one-liner that sources this file
# echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv

export DOTDIR=~/.dot
export ZDOTDIR=$DOTDIR/zsh
export GIT_CONFIG_GLOBAL=$DOTDIR/git/.gitconfig

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin

export QT_IM_MODULE=ibus
export XCOMPOSEFILE=$DOTDIR/.XCompose

(( $+commands[code] )) && export EDITOR=code || export EDITOR=vim

function is_macbook() { [[ $(uname) == "Darwin" ]] && return 0 || return 1 }
function is_pc() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"pc-linux"* ]] && return 0 || return 1 }
function is_homelab() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"homelab"* ]] && return 0 || return 1 }
function is_cloud() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"cloud"* ]] && return 0 || return 1 }
function is_work() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"INOTE"* ]] && return 0 || return 1 }