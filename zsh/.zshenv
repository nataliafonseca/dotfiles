# ~/.zshenv should only be a one-liner that sources this file
# echo ". ~/.dot/zsh/.zshenv" > ~/.zshenv

export DOTDIR=~/.dot
export ZDOTDIR=$DOTDIR/zsh
export GIT_CONFIG_GLOBAL=$DOTDIR/git/.gitconfig

if [ -f $DOTDIR/.env ]; then
  set -a
  source $DOTDIR/.env
  set +a
fi

# Set XDG base dirs
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}

export EDITOR=code
export TERM=xterm-256color

# EOL
export PROMPT_EOL_MARK=''

# Conditionals
function is_mac() { [[ "$OSTYPE" == "darwin"* ]] }
function is_work() { [[ "$WORK_PC" == "true" ]] }
function is_homelab() { [[ "$HOMELAB" == "true" ]] }
function is_hetzner() { [[ "$HETZNER_VM" == "true" ]] }
function is_racknerd() { [[ "$RACKNERD_VM" == "true" ]] }
