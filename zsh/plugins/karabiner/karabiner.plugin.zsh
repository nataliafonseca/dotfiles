0=${(%):-%x}

# Create karabiner config symlink if it doesn't exist
if [[ ! -e $HOME/.config/karabiner ]]; then
    mkdir -p $HOME/.config
    ln -s ${0:A:h}/config $HOME/.config/karabiner
fi