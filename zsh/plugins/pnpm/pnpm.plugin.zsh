# Set up environment
export PNPM_HOME="$HOME/.pnpm/bin"
export PATH="$PNPM_HOME:$PATH"

# Load completions (cross-platform)
0=${(%):-%x}
source ${0:A:h}/completion.zsh
