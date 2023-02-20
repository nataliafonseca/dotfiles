0=${(%):-%x}
autoload-dir ${0:A:h}/functions
fpath+=(${0:A:h}/functions)

export NOTES_DIR="$HOME/Notebook"
export QUICK_NOTES_DIR="$NOTES_DIR/Gibberish"

alias notebook="$EDITOR $NOTES_DIR"
