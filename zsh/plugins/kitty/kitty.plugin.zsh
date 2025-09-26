##? direnv - Automatic environment loading per directory
##?
##? Enables direnv for automatic environment variable loading based on .envrc files
##? Auto-installs direnv if not found using appropriate package manager

0=${(%):-%x}

# Ensure kitty config is always symlinked to the plugin config
kitty_config_dir=$XDG_CONFIG_HOME/kitty
plugin_config_dir=${0:A:h}/config

mkdir -p $XDG_CONFIG_HOME

if [[ -L $kitty_config_dir ]]; then
    if [[ ${kitty_config_dir:A} != ${plugin_config_dir:A} ]]; then
        rm $kitty_config_dir
        ln -s $plugin_config_dir $kitty_config_dir
    fi
else
    if [[ -e $kitty_config_dir ]]; then
        rm -rf $kitty_config_dir
    fi
    ln -s $plugin_config_dir $kitty_config_dir
fi
