# The CNS Organoid Drug-Discovery Supply Chain

An interactive map of the organoid / human-model supply chain behind CNS drug discovery — from the instrument makers at the bottom, up through reagents, human models, CROs, and data/AI, to the pharma programs that depend on all of it.

- **Red rings** are chokepoints the whole field routes through. Every one was adversarially verified (a skeptic actively tried to find a credible second source); the ones that couldn't survive were demoted.
- **Hollow red nodes** are gaps — valuable parts of the chain that don't exist yet.
- **Hover a node** to trace what connects to it, with the relationship shown on each line. **Click** any node for the company, the numbers, and the source of the claim.

171 nodes, ~280 verified dependencies, 7 chokepoints, 10 gaps.

## Run it

It's a static page (D3 from CDN). Open `index.html`, or deploy the folder to any static host (e.g. Vercel).

## Files

- `index.html` — the interactive map (D3 force graph).
- `data.js` — the nodes, edges, and per-company data.

Comments or questions: patel.5469@osu.edu
