##? direnv - Automatic environment loading per directory
##?
##? Enables direnv for automatic environment variable loading based on .envrc files
##? Auto-installs direnv if not found using appropriate package manager

# Ensure direnv config is always symlinked to the plugin config
direnv_config_dir=$XDG_CONFIG_HOME/direnv
plugin_config_dir=${0:A:h}/config

mkdir -p $XDG_CONFIG_HOME

if [[ -L $direnv_config_dir ]]; then
    if [[ ${direnv_config_dir:A} != ${plugin_config_dir:A} ]]; then
        rm $direnv_config_dir
        ln -s $plugin_config_dir $direnv_config_dir
    fi
else
    if [[ -e $direnv_config_dir ]]; then
        rm -rf $direnv_config_dir
    fi
    ln -s $plugin_config_dir $direnv_config_dir
fi

# Enable direnv hook for automatic environment loading
if (( $+commands[direnv] )); then
    eval "$(direnv hook zsh)"
fi
