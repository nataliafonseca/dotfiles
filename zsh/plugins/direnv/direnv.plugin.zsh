# If direnv is not found, install it
if (( ! $+commands[direnv] )); then
  echo "\nStarting direnv installation...\n"
  if is_mac; then
    brew install direnv
  elif is_arch; then
    sudo pacman -S --needed --noconfirm direnv
  elif is_deb; then
    sudo apt install direnv
  elif is_fedora; then
    sudo dnf install direnv
  else
    curl -sfL https://direnv.net/install.sh | bash
  fi
fi

eval "$(direnv hook zsh)"
