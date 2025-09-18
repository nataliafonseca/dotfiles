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
if [[ -d "$HOME/.docker/completions" ]]; then
    fpath=($HOME/.docker/completions $fpath)
    autoload -Uz compinit
    compinit
fi