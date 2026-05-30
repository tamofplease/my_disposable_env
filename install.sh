#!/bin/bash
set -euo pipefail

# Install CLI tools and applications for a fresh Mac.
# macOS system defaults are handled separately by setup.sh.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

### Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

### GUI apps (Homebrew Cask)
brew install --cask zed
brew install --cask warp
brew install --cask raycast
brew install --cask slack
brew install --cask figma
brew install --cask zoom
brew install --cask karabiner-elements
brew install --cask docker-desktop
brew install --cask claude
brew install --cask font-hack-nerd-font

### CLI tools (Homebrew)
brew install git
brew install gh
brew install jq
brew install starship
brew install scrcpy
brew install direnv
brew install codex
brew install awscli

### Claude Code (native installer; self-updates, so don't manage via brew)
if ! command -v claude >/dev/null 2>&1; then
  echo "==> Installing Claude Code"
  curl -fsSL https://claude.ai/install.sh | bash
fi

### Google Cloud SDK (native installer; keeps `gcloud components` usable)
if ! command -v gcloud >/dev/null 2>&1; then
  echo "==> Installing Google Cloud SDK"
  curl https://sdk.cloud.google.com | bash
fi

### starship prompt config
mkdir -p ~/.config
cp "$SCRIPT_DIR/zsh/starship.toml" ~/.config/starship.toml
# enable starship in zsh (idempotent)
if ! grep -q 'starship init zsh' ~/.zshrc 2>/dev/null; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

### karabiner config
mkdir -p ~/.config/karabiner
cp "$SCRIPT_DIR/tools/karabiner.json" ~/.config/karabiner/karabiner.json
