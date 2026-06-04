# Set up environment
export PNPM_HOME="$HOME/.pnpm"
export PATH="$PNPM_HOME/bin:$PATH"

# enable completions
fpath+="${0:A:h}/completions"
