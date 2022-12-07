#
# .zshenv
#

# ~/.zshenv should only be a one-liner that sources this file
# echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv

export ZDOTDIR=~/.dot/zsh
export GIT_CONFIG_GLOBAL=~/.dot/git/.gitconfig

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
export XDG_PROJECTS_HOME=${XDG_PROJECTS_HOME:-~/Developer}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-~/.xdg}

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin

(( $+commands[code] )) && export EDITOR=code

function is_macbook() {
  [[ $(uname) == "Darwin" ]] && return 0 || return 1
}
function is_pc() {
  [[ $(hostnamectl hostname) == "pc-linux" ]] && return 0 || return 1
}
function is_homelab() {
  [[ $(hostnamectl hostname) == "homelab" ]] && return 0 || return 1
}
function is_cloud() {
  [[ $(hostnamectl hostname) == "cloud" ]] && return 0 || return 1
}
