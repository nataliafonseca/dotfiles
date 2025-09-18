# if variable NVM_DIR is not set, sets for ~/.config/nvm
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.config/nvm"

# if NVM_DIR is not present, create directory
[ -d "$NVM_DIR" ] || mkdir -p $NVM_DIR

# $NVM_DIR needs to contain nvm.sh and nvm-exec, if it doesn't, the files should be linked from installation dir.
if [ -e /usr/share/nvm/nvm.sh ] && [ ! -e "$NVM_DIR/nvm.sh" ]; then
    ln -s /usr/share/nvm/nvm.sh "$NVM_DIR/nvm.sh"
fi
if [ -e /usr/share/nvm/nvm-exec ] && [ ! -e "$NVM_DIR/nvm-exec" ]; then
    ln -s /usr/share/nvm/nvm-exec "$NVM_DIR/nvm-exec"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm
