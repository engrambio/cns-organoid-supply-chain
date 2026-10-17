#!/usr/bin/env bash
# Full verification for cns-organoid-supply-chain: the one command CI and agents run.
# Parses the JS, then starts server.js on a loopback port and checks what it serves:
# the page and its data load, traversal is refused, and a malformed URL does not crash it.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "== parse"
for f in server.js data.js; do node --check "$f"; done

echo "== server smoke test"
port=$(( 20000 + RANDOM % 20000 ))
PORT=$port node server.js >/dev/null 2>&1 &
pid=$!
trap 'kill "$pid" 2>/dev/null || true' EXIT
for _ in $(seq 50); do curl -s -o /dev/null "http://127.0.0.1:$port/" && break; sleep 0.1; done

base="http://127.0.0.1:$port"
expect() {  # expect <status> <path> [grep pattern in body]
  local body status
  body=$(curl -s --path-as-is -w '\n%{http_code}' "$base$2") || { echo "FAIL $2: no response (server down?)"; exit 1; }
  status=${body##*$'\n'}; body=${body%$'\n'*}
  [ "$status" = "$1" ] || { echo "FAIL $2: status $status, want $1"; exit 1; }
  [ -z "${3:-}" ] || grep -q -- "$3" <<< "$body" || { echo "FAIL $2: body lacks '$3'"; exit 1; }
  echo "ok   $2 -> $status"
}
expect 200 /              '<html'
expect 200 /data.js       'const NODES'
expect 400 '/%E0%A4%A'
expect 200 /              '<html'          # still up after the malformed request
expect 200 /../../etc/passwd '<html'       # traversal stays inside the repo (falls back to the page)

echo "check: OK"
