##? docker - Docker development utilities
##?
##? Provides Docker shortcuts and utilities:
##?   dsh <name>      - Open shell in running container
##?   docker:prune    - Clean up Docker system (all containers, images, volumes)
##?   docker:stop     - Stop all running containers
##?   docker:rm       - Remove all stopped containers

# Docker cleanup aliases
alias docker:prune="docker system prune --all --volumes"
alias docker:stop="docker stop \$(docker ps -q)"
alias docker:rm="docker rm \$(docker ps -aq)"
alias dc="docker compose"

# Interactive shell in container
function dsh() {
    if [[ -z "$1" ]]; then
        echo "Usage: dsh <container_name_or_id>"
        echo "Available containers:"
        docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"
        return 1
    fi

    # Try bash first, fall back to sh
    docker exec -it "$1" bash 2>/dev/null || docker exec -it "$1" sh
}

# Enable Docker CLI completions if available
0=${(%):-%x}
if [[ -d "${0:A:h}/completions" ]]; then
    FPATH="${0:A:h}/completions:$FPATH"
    autoload -Uz compinit
    compinit
fi

# Run docker sandbox
function sb() {
    if [[ -z "$1" ]]; then
        echo "Usage: sb <sandbox_name_or_agent_name>"
        echo "Existing sandboxes:"
        docker sandbox list
        return 1
    fi

    export GITHUB_TOKEN=$(gh auth token 2>/dev/null)
    export GH_TOKEN=$(gh auth token 2>/dev/null)
    docker sandbox run "$1" .
}
