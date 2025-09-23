# load theme
[[ ! -f $ZDOTDIR/plugins/p10k/p10k.theme.zsh ]] || source $ZDOTDIR/plugins/p10k/p10k.theme.zsh

# silence
POWERLEVEL9K_INSTANT_PROMPT=quiet
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

ZLE_RPROMPT_INDENT=0

# if ! is_mac; then
#     typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='󰌽'
# fi
