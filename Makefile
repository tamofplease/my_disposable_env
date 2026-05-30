.PHONY: genSshEnv
genSshEnv:
	[ -d ~/.ssh/ ] || mkdir ~/.ssh
	[ -d ~/.ssh/keys ] || mkdir ~/.ssh/keys
	ssh-keygen -t ed25519 -f ~/.ssh/keys/ed25519_git -C "riddimdubstep@yahoo.co.jp" -q -N ""
	cp ./ssh/config ~/.ssh/config
	cat ~/.ssh/keys/ed25519_git.pub | pbcopy


.PHONY: prepare_zsh
prepare_zsh:
	mkdir -p ~/.zsh

.PHONY: set_zsh
set_zsh:
	cp ~/.zshrc ./zsh/zshrc
	cp -rf ~/.zsh/* ./zsh/
	cp ~/.config/starship.toml ./zsh/starship.toml

.PHONY: load_zsh
load_zsh:
	cp ./zsh/zshrc ~/.zshrc
	cp -r ./zsh/completion ~/.zsh/
	mkdir -p ~/.config
	cp ./zsh/starship.toml ~/.config/starship.toml

.PHONY: fix_font
fix_font:
	brew install --cask font-hack-nerd-font

.PHONY: install
install:
	bash install.sh

.PHONY: run_all
run_all:
	zsh setup.sh