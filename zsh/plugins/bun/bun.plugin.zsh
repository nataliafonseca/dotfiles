##? bun - Bun JavaScript runtime setup
##?
##? Configures Bun JavaScript runtime and package manager
##? Sets up PATH and enables completions
##?
##? Environment variables:
##?   BUN_INSTALL  - Bun installation directory (set to ~/.bun)

# Set up Bun environment
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Load Bun completions (cross-platform)
if [[ -s "$BUN_INSTALL/_bun" ]]; then
    source "$BUN_INSTALL/_bun"
fi
