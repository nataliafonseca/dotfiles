# Set up environment
export PNPM_HOME="$HOME/.pnpm"
export PATH="$PNPM_HOME/bin:$PATH"

# Load completions (cross-platform)
0=${(%):-%x}
source ${0:A:h}/completion.zsh
