#!/bin/bash
set -euo pipefail

# Clone every repo listed in repos.txt into ~/ghq/github.com/<owner>/<repo>.
# Run after `make setup_github` (needs gh auth for private repos / org expansion).

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LIST="$SCRIPT_DIR/repos.txt"

command -v ghq >/dev/null 2>&1 || { echo "ghq not found; run install.sh first."; exit 1; }
[ -f "$LIST" ] || { echo "no repos.txt; nothing to clone."; exit 0; }

while IFS= read -r line; do
  line="${line%%#*}"                 # strip inline/whole-line comments
  line="$(echo "$line" | xargs)"     # trim whitespace
  [ -z "$line" ] && continue

  if [[ "$line" == @* ]]; then
    org="${line#@}"
    echo "==> Expanding org: $org"
    command -v gh >/dev/null 2>&1 || { echo "  gh not found; skipping @$org"; continue; }
    gh repo list "$org" --limit 1000 --json nameWithOwner -q '.[].nameWithOwner' \
      | while IFS= read -r repo; do echo "  - $repo"; ghq get "$repo"; done
  else
    echo "==> $line"
    ghq get "$line"
  fi
done < "$LIST"

echo "==> Done. Browse with: ghq list | fzf  (or Ctrl-] in zsh)"
