# Gather web evidence before a solve

Use [Parallel Search MCP](https://docs.parallel.ai/integrations/mcp/search-mcp)
alongside Liminal when a decision needs current public sources. For the
[first solve](first-solve.md), you could gather PostgreSQL documentation before
asking Liminal to weigh whether to add read replicas.

Claude Code calls the two servers separately. Adding Parallel to your client
does not connect it to Liminal's hosted service; your client must include the
selected evidence in the question it sends to `solve`.

## Connect

First connect Liminal using [`claude-code.sh`](claude-code.sh) and your Liminal
key, or keep your existing Liminal connection. Then, from the same project, add
the optional search server:

```bash
claude mcp add --transport http parallel-search https://search.parallel.ai/mcp --header "User-Agent: liminality-mcp-example"
```

This uses Claude Code's local scope for the current project and adds a separate
server entry. If you already use the name `parallel-search`, keep that connection
or choose another name. Parallel's anonymous endpoint needs no account or API key
and uses Fast mode for search. Free access is intended for light use and has rate
limits. Liminal still uses its own authentication and solve allowance.

Run `/mcp` in Claude Code to check both connections. Parallel should expose
`web_search` and `web_fetch`; Liminal should expose `solve`. See the
[Claude Code MCP guide](https://code.claude.com/docs/en/mcp) if a connection fails.

## Gather and inspect sources

Start with public documentation rather than your private database details. For
example, ask your client:

> Use `web_search` from `parallel-search` to find official PostgreSQL documentation
> about read replica query conflicts and replication lag. Set the search
> objective to those two topics and prefer postgresql.org sources. Keep the
> PostgreSQL version visible for each source. Return a short evidence table with
> the title, URL, version, relevant excerpt, and retrieval date. If search excerpts
> are insufficient, use `web_fetch` on the relevant URLs. Do not call Liminal yet.

Open the selected sources and check that their versions match your deployment.
Replace an unsuitable source or mark the evidence as missing. A search result's
date alone does not establish that its advice applies to your database version.
If a search or fetch fails, keep that gap visible instead of inventing an excerpt.

## Pass selected evidence to Liminal

After reviewing the table, include the selected rows in a follow-up request.
Replace the bracketed fields with your own facts and the actual evidence:

> Use Liminal's `solve` tool with this question, including the evidence below as
> part of the question text: "We run a small SaaS on one PostgreSQL instance.
> Should we add read replicas now or wait? Our PostgreSQL version is [version],
> read load is [measurements or unknown], acceptable replication lag is [limit or
> unknown], and monthly budget is [budget or unknown]. Selected public evidence:
> [paste the reviewed source URLs, versions, excerpts, and retrieval dates].
> Distinguish these sources from our operational facts. Identify missing facts
> and the conditions that would change the recommendation."

The selected evidence and operational facts are sent to Liminal with that
question. Keep URLs with their excerpts so you can check the resulting claims.
Follow the [first-solve checks](first-solve.md#check-it), and treat blocked,
unavailable, or uncertified results as gaps to resolve before acting.
