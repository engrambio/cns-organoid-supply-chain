# AGENTS.md — cns-organoid-supply-chain

Operational source of truth for coding agents (Claude Code, Codex, others). Engram-wide
rules live in engrambio/engineering-standards `STANDARDS.md`. This repo is **public**.

## What this repo is

An interactive D3 map of the CNS organoid drug-discovery supply chain: `index.html` plus the
data in `data.js`, served by the zero-dependency `server.js` (Railway, or any static host).

## Verify

`./scripts/check.sh` is the full gate, and CI runs exactly this: the JS parses, and
`server.js` serves the page and data, refuses path traversal and survives a malformed URL.

## Conventions

- No dependencies: `server.js` uses Node's standard library only.
- CI is inline in `.github/workflows/ci.yml`, because a public repo cannot call the private
  engineering-standards workflows.

## Security

Public repo: nothing internal, no secrets, no unpublished data.

## CI gate

Never edit CI to make a failing check pass: workflows, `scripts/check.sh`. If a check is
wrong, say so in the PR and change it in a separate, explained commit.

## Definition of done

`./scripts/check.sh` green.
