@AGENTS.md

# Claude-specific notes

- `gh pr` / `gh issue` fail in cloud sessions (the GitHub proxy blocks GraphQL); use the
  GitHub tools or `gh api repos/engrambio/cns-organoid-supply-chain/...`.
- Commit and push to a branch before a cloud session ends; the VM does not keep files.
