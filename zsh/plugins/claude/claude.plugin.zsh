##? claude - Claude AI MCP (Model Context Protocol) server management
##?
##? Provides aliases for managing Claude MCP servers:
##?   claude:add:*           - Add MCP servers (serena, context7, firecrawl, playwright)
##?   claude:remove:*        - Remove MCP servers (serena, context7, firecrawl, playwright)
##?   claude:mcp:list        - List all configured MCP servers
##?   claude:mcp:reset       - Reset project-scoped server choices
##?   claude:check-keys      - Check required API keys
##?   claude:list-servers    - List servers with fallback
##?
##? Requirements:
##?   - CONTEXT7_API_KEY environment variable for Context7
##?   - FIRECRAWL_API_KEY environment variable for Firecrawl

# Claude MCP server management aliases

# Add MCP servers
alias claude:add:serena="claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server --context ide-assistant --project \$(pwd)"
alias claude:add:context7="claude mcp add context7 -- npx -y @upstash/context7-mcp --api-key $CONTEXT7_API_KEY"
alias claude:add:firecrawl="claude mcp add firecrawl -e FIRECRAWL_API_KEY=$FIRECRAWL_API_KEY -- npx -y firecrawl-mcp"
alias claude:add:playwright="claude mcp add playwright -- npx @playwright/mcp@latest"

# Remove MCP servers
alias claude:remove:serena="claude mcp remove serena"
alias claude:remove:context7="claude mcp remove context7"
alias claude:remove:firecrawl="claude mcp remove firecrawl"
alias claude:remove:playwright="claude mcp remove playwright"

# General MCP management
alias claude:mcp:list="claude mcp list"
alias claude:mcp:reset="claude mcp reset-project-choices"

# Helper functions
function claude:check-keys() {
    echo "Checking required API keys for Claude MCP servers:"
    echo ""

    if [[ -n "$CONTEXT7_API_KEY" ]]; then
        echo "✓ CONTEXT7_API_KEY: configured"
    else
        echo "✗ CONTEXT7_API_KEY: not set (required for context7 server)"
    fi

    if [[ -n "$FIRECRAWL_API_KEY" ]]; then
        echo "✓ FIRECRAWL_API_KEY: configured"
    else
        echo "✗ FIRECRAWL_API_KEY: not set (required for firecrawl server)"
    fi
}

function claude:list-servers() {
    if (( $+commands[claude] )); then
        claude mcp list 2>/dev/null || echo "No MCP servers configured or 'claude mcp list' command not available"
    else
        echo "Claude CLI not found. Install with: npm install -g @anthropic-ai/claude-cli"
    fi
}