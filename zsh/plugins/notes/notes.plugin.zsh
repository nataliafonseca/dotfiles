##? notes - Quick note-taking and notebook management
##?
##? Provides commands for managing notes and notebooks:
##?   n              - Create/edit quick timestamped notes
##?   notebook       - Open main notebook directory in editor
##?
##? Environment variables:
##?   NOTES_DIR       - Main notebook directory (default: ~/Notebook)
##?   QUICK_NOTES_DIR - Quick notes subdirectory (default: $NOTES_DIR/Gibberish)

0=${(%):-%x}
autoload-dir ${0:A:h}/functions
fpath+=(${0:A:h}/functions)

export NOTES_DIR="${NOTES_DIR:-$HOME/Notebook}"
export QUICK_NOTES_DIR="${QUICK_NOTES_DIR:-$NOTES_DIR/Gibberish}"

# Ensure directories exist
[[ -d "$NOTES_DIR" ]] || mkdir -p "$NOTES_DIR"
[[ -d "$QUICK_NOTES_DIR" ]] || mkdir -p "$QUICK_NOTES_DIR"

# Aliases
alias notebook="$EDITOR '$NOTES_DIR'"
alias notes-dir="cd '$NOTES_DIR'"
alias quick-notes="cd '$QUICK_NOTES_DIR'"
