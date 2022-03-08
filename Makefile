.PHONY: genSshEnv
genSshEnv:
	[ -d ~/.ssh/ ] || mkdir ~/.ssh
	[ -d ~/.ssh/keys ] || mkdir ~/.ssh/keys
	ssh-keygen -t ed25519 -f ~/.ssh/keys/ed25519_git -C "riddimdubstep@yahoo.co.jp" -q -N ""
	cp ./ssh/config ~/.ssh/config
	cp cat ~/.ssh/keys/ed25519_git.pub | pbcopy


.PHONY: prepare_zsh
prepare_zsh:
	mkdir -p ~/.zsh
	mkdir -p ~/.zsh_config

.PHONY: set_zsh
set_zsh:
	cp ~/.zsh_config/* ./zsh/zsh_config
	cp ~/.zshrc ./zsh/zshrc
	cp -rf ~/.zsh/* ./zsh/

.PHONY: load_zsh
load_zsh:
	cp ./zsh/zshrc ~/.zshrc
	cp ./zsh/zsh_config/* ~/.zsh_config/
	cp -r ./zsh/completion ~/.zsh/

.PHONY: fix_font
fix_font:
	cd ~/ && git clone https://github.com/powerline/fonts
	~/fonts/install.sh

.PHONY: install_tool
install_tool:
	zsh tools/brew.sh

.PHONY: install_commands
install_commands:
	zsh commands/brew.sh
