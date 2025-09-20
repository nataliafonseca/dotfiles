##? direnv - Automatic environment loading per directory
##?
##? Enables direnv for automatic environment variable loading based on .envrc files
##? Auto-installs direnv if not found using appropriate package manager

0=${(%):-%x}

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

# Auto-install direnv if not available
if (( ! $+commands[direnv] )); then
    echo "direnv not found, installing..."

    if is_mac; then
        brew install direnv
    elif is_arch; then
        sudo pacman -S --needed --noconfirm direnv
    elif is_deb; then
        sudo apt-get update && sudo apt-get install -y direnv
    elif is_fedora; then
        sudo dnf install -y direnv
    else
        echo "Installing direnv via official installer..."
        curl -sfL https://direnv.net/install.sh | bash
    fi

    if (( $+commands[direnv] )); then
        echo "✓ direnv installed successfully"
    else
        echo "✗ direnv installation failed" >&2
        return 1
    fi
fi

# Enable direnv hook for automatic environment loading
if (( $+commands[direnv] )); then
    eval "$(direnv hook zsh)"
fi
