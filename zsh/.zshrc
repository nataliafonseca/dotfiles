# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dot/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set zsh history variables.
HISTFILE=$XDG_DATA_HOME/zsh/history
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h
HISTSIZE=10000   # max history in session
SAVEHIST=10000   # max entries in HISTFILE

# load functions
autoload -Uz $ZDOTDIR/functions/autoload-dir
autoload-dir $ZDOTDIR/functions

# load antidote/plugins
## antidote options
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:bundle' file $ZDOTDIR/.zplugins

## clone antidote if not found
[[ -e $ZDOTDIR/.antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git $ZDOTDIR/.antidote

## create plugin files if not found
zsh_plugins=${ZDOTDIR:-~}/.zplugins.zsh
[[ -f ${zsh_plugins:r} ]] || touch ${zsh_plugins:r}

## load antidote functions
fpath+=($ZDOTDIR/.antidote/functions)
autoload -Uz $fpath[-1]/antidote

## update plugins file if text file changes
if [[ ! $zsh_plugins -nt ${zsh_plugins:r} ]] || [[ ! -s $zsh_plugins ]]; then

  (( $+commands[envsubst] )) || envsubst() { python3 -c 'import os,sys;[sys.stdout.write(os.path.expandvars(l)) for l in sys.stdin]' }

  source $ZDOTDIR/.antidote/antidote.zsh
  (envsubst <${zsh_plugins:r} | antidote bundle >|$zsh_plugins)
fi

# load aliases
source $ZDOTDIR/.zaliases

# keybindings
bindkey  "^[[H"   beginning-of-line     # home key
bindkey  "^[[F"   end-of-line           # end key
bindkey  "\^U"    backward-kill-line    # ctrl+u
bindkey '^[[3~' delete-char             # delete

## load plugins - keep at the end as some plugins like to go last
source $zsh_plugins

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "$(fnm env --shell zsh)"
fi
