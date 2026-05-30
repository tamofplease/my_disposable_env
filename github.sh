#!/bin/bash
set -euo pipefail

# Set up git identity, an ed25519 SSH key, and GitHub auth for a fresh Mac.
# Idempotent: safe to re-run. Requires `gh` (installed by install.sh).

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

NAME="tamofplease"
EMAIL="mmiwatomoki@gmail.com"
KEY="$HOME/.ssh/keys/ed25519_git"

### git identity & sensible defaults
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.autoSetupRemote true
git config --global fetch.prune true
git config --global rebase.autostash true

### SSH key (ed25519), generated once
mkdir -p "$HOME/.ssh/keys"
chmod 700 "$HOME/.ssh"
if [ ! -f "$KEY" ]; then
  echo "==> Generating SSH key"
  ssh-keygen -t ed25519 -f "$KEY" -C "$EMAIL" -q -N ""
fi

### ssh config
cp "$SCRIPT_DIR/ssh/config" "$HOME/.ssh/config"
chmod 600 "$HOME/.ssh/config"

### load key into agent + macOS keychain
eval "$(ssh-agent -s)" >/dev/null
ssh-add --apple-use-keychain "$KEY" 2>/dev/null || ssh-add "$KEY"

### register public key on GitHub via gh
if command -v gh >/dev/null 2>&1; then
  if ! gh auth status >/dev/null 2>&1; then
    echo "==> Logging in to GitHub"
    gh auth login
  fi
  echo "==> Registering SSH key on GitHub"
  gh ssh-key add "$KEY.pub" --title "$(hostname)" 2>/dev/null \
    || echo "  (key already registered, skipping)"
else
  echo "gh not found; run install.sh first, then add $KEY.pub on GitHub manually."
fi

### verify connectivity
echo "==> Verifying github.com connectivity"
ssh -T git@github.com || true
