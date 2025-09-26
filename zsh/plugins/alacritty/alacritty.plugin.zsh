##? direnv - Automatic environment loading per directory
##?
##? Enables direnv for automatic environment variable loading based on .envrc files
##? Auto-installs direnv if not found using appropriate package manager

0=${(%):-%x}

# Ensure direnv config is always symlinked to the plugin config
alacritty_config_dir=$XDG_CONFIG_HOME/alacritty
plugin_config_dir=${0:A:h}/config

mkdir -p $XDG_CONFIG_HOME

if [[ -L $alacritty_config_dir ]]; then
    if [[ ${alacritty_config_dir:A} != ${plugin_config_dir:A} ]]; then
        rm $alacritty_config_dir
        ln -s $plugin_config_dir $alacritty_config_dir
    fi
else
    if [[ -e $alacritty_config_dir ]]; then
        rm -rf $alacritty_config_dir
    fi
    ln -s $plugin_config_dir $alacritty_config_dir
fi
