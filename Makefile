# One-shot: tools + dotfiles, then GitHub/SSH/git, then macOS defaults.
# Run from a Terminal so `gh auth login` can prompt interactively.
.PHONY: all
all: install setup_github run_all

.PHONY: setup_github
setup_github:
	bash github.sh

# Clone repos listed in repos.txt into ~/ghq (run after setup_github).
.PHONY: clone
clone:
	bash clone.sh


.PHONY: set_zsh
set_zsh:
	cp ~/.zshrc ./zsh/zshrc
	cp -rf ~/.zsh/* ./zsh/
	cp ~/.config/starship.toml ./config/starship.toml

.PHONY: load_zsh
load_zsh:
	mkdir -p ~/.zsh
	cp ./zsh/zshrc ~/.zshrc
	cp -r ./zsh/completion ~/.zsh/
	mkdir -p ~/.config
	cp -R ./config/. ~/.config/

.PHONY: fix_font
fix_font:
	brew install --cask font-hack-nerd-font

.PHONY: install
install:
	bash install.sh

.PHONY: run_all
run_all:
	zsh setup.sh