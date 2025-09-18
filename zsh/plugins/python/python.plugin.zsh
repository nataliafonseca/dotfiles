##? python - Python development environment management
##?
##? Provides commands for Python virtual environment management:
##?   mkvenv [name]     - Create virtual environment (local .venv or named in WORKON_HOME)
##?   workon <name>     - Activate virtual environment
##?   pyclean [dirs]    - Clean Python cache files and directories
##?
##? Aliases:
##?   python            - python3 (if python not available)
##?   py                - uv run (modern Python task runner)
##?
##? Environment variables:
##?   WORKON_HOME       - Directory for named virtual environments

0=${(%):-%x}
autoload-dir ${0:A:h}/functions
fpath+=(${0:A:h}/functions)

# Set up virtual environment directory
export WORKON_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/venvs"
[[ -d "$WORKON_HOME" ]] || mkdir -p "$WORKON_HOME"

# Ensure python command exists
(( $+commands[python] )) || alias python="python3"
