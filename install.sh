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
brew install gcc
brew install gnu-tar
brew install gnu-sed
brew install gnu-time
brew install gnu-getopt

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

### Language toolchains

# Python -> uv (version manager + venv + pip/pipx replacement)
brew install uv

# Rust -> rustup (official toolchain manager)
if ! command -v rustup >/dev/null 2>&1; then
  echo "==> Installing rustup"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

# Node -> volta, plus pnpm & typescript managed by volta
# (VOLTA_HOME / PATH / VOLTA_FEATURE_PNPM live in zsh/zshrc; set here for this run)
brew install volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1
volta install node
volta install pnpm
volta install typescript

### dotfiles
# zsh (zshrc wires up starship / volta / rustup; see zsh/zshrc)
mkdir -p ~/.zsh
cp "$SCRIPT_DIR/zsh/zshrc" ~/.zshrc
cp -R "$SCRIPT_DIR/zsh/completion" ~/.zsh/
# ~/.config (config/ mirrors it: starship.toml, karabiner.json, ...)
mkdir -p ~/.config
cp -R "$SCRIPT_DIR/config/." ~/.config/
