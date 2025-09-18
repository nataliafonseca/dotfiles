0=${(%):-%x}
autoload-dir ${0:A:h}/functions
fpath+=(${0:A:h}/functions)

# export WORKON_HOME="$XDG_DATA_HOME/venvs"
# [[ -d "$WORKON_HOME" ]] || mkdir -p "$WORKON_HOME"

(( $+commands[python] )) || alias python="python3"
alias py='uv run'
