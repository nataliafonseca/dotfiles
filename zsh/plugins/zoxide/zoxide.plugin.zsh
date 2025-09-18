# If zoxide is not found, install it
if (( ! $+commands[zoxide] )); then
  echo "\nStarting zoxide installation...\n"
  if is_arch; then
    sudo pacman -S --needed --noconfirm zoxide
  else
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  fi
fi

eval "$(zoxide init zsh)"
