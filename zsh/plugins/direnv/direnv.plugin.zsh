##? direnv - Automatic environment loading per directory
##?
##? Enables direnv for automatic environment variable loading based on .envrc files
##? Auto-installs direnv if not found using appropriate package manager

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
eval "$(direnv hook zsh)"
