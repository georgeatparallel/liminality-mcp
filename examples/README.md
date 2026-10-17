# Examples

Copy the block for your client, replace `YOUR_KEY` with a key from https://physea.ai/signup, then ask your client for a first solve.

- `claude-code.sh`: one command for Claude Code.
- `cursor.mcp.json`: drop into `~/.cursor/mcp.json` or `.cursor/mcp.json`.
- `vscode.mcp.json`: drop into `.vscode/mcp.json`.
- `codex.config.toml`: section for `~/.codex/config.toml`.
- `hermes.config.yaml`: section for `~/.hermes/config.yaml`.
- `first-solve.md`: a first prompt, what comes back, and how to check it.
- [`parallel-research.md`](parallel-research.md): optionally gather current public web sources in Claude Code, then pass reviewed evidence to a Liminal solve.

Endpoint: `https://liminality.physea.ai/mcp` (streamable HTTP). Auth: `X-API-Key` header or OAuth 2.1 browser sign-in where your client supports it.
