0=${(%):-%x}
autoload-dir ${0:A:h}/functions
fpath+=(${0:A:h}/functions)

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export WORKON_HOME="$XDG_DATA_HOME/venvs"
[[ -d "$WORKON_HOME" ]] || mkdir -p "$WORKON_HOME"

(( $+commands[python] )) || alias python="python3"
alias py='python'
alias pipupdate="pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U"
alias pyva="source .venv/bin/activate"
