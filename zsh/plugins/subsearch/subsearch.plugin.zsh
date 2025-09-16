bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down
bindkey "^[[H" beginning-of-line  # home key
bindkey "^[[F" end-of-line  # end key

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1