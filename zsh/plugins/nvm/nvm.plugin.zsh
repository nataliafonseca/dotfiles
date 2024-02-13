# if variable NVM_DIR is not set, sets for ~/.config/nvm
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.config/nvm"

# if NVM_DIR is not present, create directory
[ -d "$NVM_DIR" ] || mkdir -p $NVM_DIR

# $NVM_DIR needs to contain nvm.sh and nvm-exec, if it doesn't, the files linked from installation dir. For example:
# ln -s /usr/share/nvm/nvm.sh "$NVM_DIR/nvm.sh"
# ln -s /usr/share/nvm/nvm-exec "$NVM_DIR/nvm-exec"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm
