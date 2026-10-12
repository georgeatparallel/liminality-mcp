# Liminal is a hosted remote MCP server (streamable HTTP at https://liminality.physea.ai/mcp).
# This image is only a stdio bridge for directories and clients that need a container
# (for example Glama's server inspection). It runs mcp-remote and forwards your key.
#
#   docker build -t liminal-mcp .
#   docker run -i --rm -e API_KEY=your_key liminal-mcp
#
# Get a free key at https://physea.ai/signup.
FROM node:20-alpine

RUN npm install -g mcp-remote@0.14.3 && npm cache clean --force

ENV MCP_URL=https://liminality.physea.ai/mcp

USER node
WORKDIR /home/node

CMD ["sh", "-c", "exec mcp-remote \"$MCP_URL\" --transport http-only --header \"X-API-Key:${API_KEY}\""]
