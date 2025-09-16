alias claude:add:serena="claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server --context ide-assistant --project $(pwd)"
alias claude:add:context7="claude mcp add context7 -- npx -y @upstash/context7-mcp --api-key $CONTEXT7_API_KEY"
alias claude:add:firecraw="claude mcp add firecrawl -e FIRECRAWL_API_KEY=$FIRECRAWL_API_KEY -- npx -y firecrawl-mcp"
alias claude:add:playwright="claude mcp add playwright npx @playwright/mcp@latest"