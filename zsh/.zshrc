# p10k instant prompt (should stay close to the top of .zshrc)
if [[ -r "$XDG_CACHE_HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$XDG_CACHE_HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load aliases
source $ZDOTDIR/.zaliases

# load functions
autoload -Uz $ZDOTDIR/functions/autoload-dir
autoload-dir $ZDOTDIR/functions

# load antidote/plugins
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:bundle' file $ZDOTDIR/.zplugins

[[ -e $ZDOTDIR/.antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git $ZDOTDIR/.antidote

if [[ ! $ZDOTDIR/.zplugins.zsh -nt $ZDOTDIR/.zplugins ]]; then
  source $ZDOTDIR/.antidote/antidote.zsh
  envsubst <$ZDOTDIR/.zplugins | antidote bundle >$ZDOTDIR/.zplugins.zsh
fi

source $ZDOTDIR/.zplugins.zsh
autoload -Uz $ZDOTDIR/.antidote/functions/antidote
