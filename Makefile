.PHONY: setup_github
setup_github:
	bash github.sh


.PHONY: prepare_zsh
prepare_zsh:
	mkdir -p ~/.zsh

.PHONY: set_zsh
set_zsh:
	cp ~/.zshrc ./zsh/zshrc
	cp -rf ~/.zsh/* ./zsh/
	cp ~/.config/starship.toml ./config/starship.toml

.PHONY: load_zsh
load_zsh:
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