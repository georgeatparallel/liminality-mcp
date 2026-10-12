<p align="center"><img src="assets/logo.png" width="120" alt="Liminal"></p>

<h1 align="center">Liminal</h1>

<p align="center">Augment your work with Liminal. Stop repeating yourself and build on what’s already solved.</p>

<p align="center"><b><a href="https://physea.ai/mcp">Docs</a></b> · <b><a href="https://physea.ai/signup">Get a free key</a></b> · <b><a href="examples/">Examples</a></b></p>

<p align="center"><a href="https://glama.ai/mcp/servers/jaybro2042-alt/liminality-mcp"><img src="https://glama.ai/mcp/servers/jaybro2042-alt/liminality-mcp/badges/score.svg" alt="Liminal on Glama"></a> <a href="https://registry.modelcontextprotocol.io/v0/servers?search=ai.physea/liminality"><img src="https://img.shields.io/badge/MCP%20Registry-ai.physea%2Fliminality-blue" alt="Official MCP Registry"></a> <a href="https://smithery.ai/servers/physea/liminality"><img src="https://smithery.ai/badge/physea/liminality" alt="smithery badge"></a> <a href="https://lobehub.com/mcp/jaybro2042-alt-liminality-mcp"><img src="https://lobehub.com/badge/mcp/jaybro2042-alt-liminality-mcp" alt="MCP Badge"></a></p>

<!-- mcp-name: ai.physea/liminality -->

---

Liminal turns objectives into structured work by strategizing through an atomic, deterministic basis: setting guardrails around scope, compiling resources and constraints, uncovering gaps, and organizing research and next steps. All while carrying continuity and priorities forward so your AI builds on what’s already done.

Connect easily through MCP or use the desktop app.

## Install

Remote server, nothing to build or run locally. Get a key at https://physea.ai/signup, then add
it to your client. Ready-to-copy files for each client are in [`examples/`](examples/), with a
[first solve walkthrough](examples/first-solve.md).

**Claude Code**

```bash
claude mcp add liminal --transport http https://liminality.physea.ai/mcp --header "X-API-Key: YOUR_KEY"
```

**Cursor**

Add to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "liminal": {
      "url": "https://liminality.physea.ai/mcp",
      "headers": { "X-API-Key": "YOUR_KEY" }
    }
  }
}
```

**VS Code**

Add to `.vscode/mcp.json`:

```json
{
  "servers": {
    "liminal": {
      "type": "http",
      "url": "https://liminality.physea.ai/mcp",
      "headers": { "X-API-Key": "YOUR_KEY" }
    }
  }
}
```

**Docker (stdio bridge)**

For clients or directories that need a container, the [`Dockerfile`](Dockerfile) wraps the
remote endpoint with `mcp-remote`:

```bash
docker build -t liminal-mcp . && docker run -i --rm -e API_KEY=YOUR_KEY liminal-mcp
```

- **Endpoint:** `https://liminality.physea.ai/mcp`
- **Transport:** streamable HTTP (remote, hosted)
- **Auth:** API key via `X-API-Key` or `Authorization: Bearer`, or OAuth 2.1.
- **Registry name:** `ai.physea/liminality` (Official MCP Registry)

## What it is

Liminal is a reasoning layer that sits between your agent and the tools it could call. Instead
of answering from memory, it works out the structure of the request first, then routes each piece
to something real.

It runs on context-dependent determinism. Same question with the same known context routes the
same way every time, so a result is reproducible and you can hand the route to someone else and
get the same thing back. Change the context, and the route adapts to it. The determinism is in
how it decides, not a frozen cache of canned answers.

## Tools

- **`solve`** is the front door. Give it anything non-trivial. It works out the structure
  (decompose, ground to real tools, score the decision) and returns a worked result: a scored
  decision frame for a choice, or a grounded answer for a question.
- `research` runs a deeper multi-source pass that pulls real information for a question.
- `ask_form` / `apply_form`: when the answer depends on your specifics, it hands back a short
  multiple-choice form. Relay it, then `apply_form` folds the answers into a sharper result.
- `get_my_context`: what's known about you and what you've connected.
- `register_asset` / `set_preference`: tell it about your material and how you like results.
- `report_feedback` / `report_outcome`: tell it how a result did, so routes improve with use.
- `composio_connect`: connect a tool so an action can run against it.

## Discovery

- `https://liminality.physea.ai/.well-known/mcp`
- `https://liminality.physea.ai/.well-known/agent.json`
- `https://liminality.physea.ai/llms.txt`

## Links

- Site and docs: https://physea.ai/mcp
- Get a key: https://physea.ai/signup
- Privacy: https://physea.ai/privacy-policy
- By [Physea](https://physea.ai)

---

© 2026 Physea Labs. All rights reserved. "Liminal", the name, and the logo are trademarks of
Physea. This repository is a listing for a hosted service; no rights to the service, its
software, or its data are granted. Use of the service is governed by the terms at
https://physea.ai/mcp.
