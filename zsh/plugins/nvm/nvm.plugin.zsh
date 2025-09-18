##? nvm - Node Version Manager setup and configuration
##?
##? Configures NVM for Node.js version management
##? Sets up NVM directory and loads NVM if available
##?
##? Environment variables:
##?   NVM_DIR  - NVM installation directory (default: ~/.config/nvm)

# Set NVM directory if not already configured
[[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.config/nvm"

# Create NVM directory if it doesn't exist
[[ -d "$NVM_DIR" ]] || mkdir -p "$NVM_DIR"

# Link system NVM installation if available (common on Arch Linux)
if [[ -e /usr/share/nvm/nvm.sh && ! -e "$NVM_DIR/nvm.sh" ]]; then
    ln -s /usr/share/nvm/nvm.sh "$NVM_DIR/nvm.sh"
fi

if [[ -e /usr/share/nvm/nvm-exec && ! -e "$NVM_DIR/nvm-exec" ]]; then
    ln -s /usr/share/nvm/nvm-exec "$NVM_DIR/nvm-exec"
fi

# Load NVM if available
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"

    # Load NVM bash completion if available
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
fi
