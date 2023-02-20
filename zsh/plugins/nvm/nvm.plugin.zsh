# if variable NVM_DIR is not set, sets for ~/.config/nvm
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"

# if NVM_DIR is not present, create directory
[ -d "$NVM_DIR" ] || mkdir -p $NVM_DIR

# $NVM_DIR needs to contain nvm.sh and nvm-exec, if it doesn't, the files linked from installation dir. For example:
# ln -s /usr/share/nvm/nvm.sh "$NVM_DIR/nvm.sh"
# ln -s /usr/share/nvm/nvm-exec "$NVM_DIR/nvm-exec"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm

# this configures nvm to use node version from .nvmrc automatically, if version is installed
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
