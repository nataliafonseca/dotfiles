alias dprune="docker system prune --all --volumes"

function dsh() {
  docker exec -it $1 sh
}

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/natalia/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions