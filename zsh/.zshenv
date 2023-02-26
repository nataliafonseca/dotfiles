# ~/.zshenv should only be a one-liner that sources this file
# echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv

export DOTDIR=~/.dot
export ZDOTDIR=$DOTDIR/zsh
export GIT_CONFIG_GLOBAL=$DOTDIR/git/.gitconfig

# Set XDG base dirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}

# Ensure XDG dirs exist.
for xdgdir in XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_RUNTIME_DIR; do
  [[ -e ${(P)xdgdir} ]] || mkdir -p ${(P)xdgdir}
done

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin

export QT_IM_MODULE=ibus
export XCOMPOSEFILE=$DOTDIR/.XCompose

export EDITOR=code

function is_mac() { [[ $(uname) == "Darwin" ]] && return 0 || return 1 }
function is_pc() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"pc-linux"* ]] && return 0 || return 1 }
function is_homelab() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"homelab"* ]] && return 0 || return 1 }
function is_cloud() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"cloud"* ]] && return 0 || return 1 }
function is_thinkpad() { (( $+commands[hostnamectl] )) && [[ $(hostnamectl) == *"INOTE"* ]] && return 0 || return 1 }

function is_deb() { (( $+commands[apt] )) && return 0 || return 1 }
function is_arch() { (( $+commands[pacman] )) && return 0 || return 1 }
function is_fedora() { (( $+commands[dnf] )) && return 0 || return 1 }
