alias dprune="docker system prune --all --volumes"

function dsh() {
  docker exec -it $1 sh
}
