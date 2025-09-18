##? go - Go development environment setup
##?
##? Configures Go development environment with custom GOPATH
##? Provides aliases for Go development tools
##?
##? Environment variables:
##?   GOPATH  - Go workspace directory (set to ~/.go)
##?
##? Aliases:
##?   gow       - Go file watcher with continuous build and restart
##?   go:clean  - Clean Go caches (build, module, test)
##?   go:deps   - Download and verify Go dependencies
##?   go:udeps   - Download, update, and verify Go dependencies

# Set up Go environment
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Ensure Go directories exist
[[ -d "$GOPATH" ]] || mkdir -p "$GOPATH"/{bin,src,pkg}

# Development aliases
alias gow="gow -c -r"  # Go file watcher with continuous build
alias go:clean="go clean -cache -modcache -testcache"
alias go:deps="go mod download && go mod verify"
alias go:udeps="go mod download && go get -u ./... && go mod verify"
