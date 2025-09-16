# If zoxide is not found, install it
if (( ! $+commands[zoxide] )); then
  echo "\nStarting zoxide installation...\n"
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  return
fi

eval "$(zoxide init zsh)"
