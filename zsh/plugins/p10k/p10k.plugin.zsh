[[ ! -f $ZDOTDIR/plugins/p10k/p10k.theme.zsh ]] || source $ZDOTDIR/plugins/p10k/p10k.theme.zsh

# ZLE_RPROMPT_INDENT=0

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='󰔛'

if is_hetzner; then
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=' '
elif is_racknerd; then
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='󰊪 '
elif is_homelab; then
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=' '
elif is_mac; then
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=''
else
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='󰻀'
fi