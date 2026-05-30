#!/bin/bash
set -euo pipefail

# Bootstrap a brand-new Mac from nothing.
# Run it from a Terminal (so interactive prompts like `gh auth login` work):
#
#   curl -fsSL https://raw.githubusercontent.com/tamofplease/my_disposable_env/main/bootstrap.sh -o /tmp/bootstrap.sh
#   bash /tmp/bootstrap.sh
#
# It installs Homebrew (which also pulls Command Line Tools / git), clones
# this repo over HTTPS (no SSH key needed), then runs `make all`.

REPO="https://github.com/tamofplease/my_disposable_env.git"
# Clone into the ghq layout so it isn't duplicated when `make clone` runs later.
DEST="$HOME/ghq/github.com/tamofplease/my_disposable_env"

### Homebrew (also installs Command Line Tools, i.e. git)
if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

### Clone this repo over HTTPS (SSH key not required for a public repo)
if [ ! -d "$DEST/.git" ]; then
  echo "==> Cloning $REPO -> $DEST"
  mkdir -p "$(dirname "$DEST")"
  git clone "$REPO" "$DEST"
fi

### Run the full setup
cd "$DEST"
make all
