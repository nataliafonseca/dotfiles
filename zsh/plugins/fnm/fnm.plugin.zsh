if [ -d "$XDG_DATA_HOME/fnm" ]; then
  FNM_PATH="$XDG_DATA_HOME/fnm"
elif [ -d "/opt/homebrew/opt/fnm/bin" ]; then
  FNM_PATH="/opt/homebrew/opt/fnm/bin"
fi

if [ -d "$FNM_PATH" ]; then
  if (( ! $+commands[fnm] )); then
    export PATH="$PATH:$FNM_PATH"
  fi
  eval "$(fnm env --shell zsh)"
  fpath+="${0:A:h}/completions"
fi
