.PHONY: genSshEnv
genSshEnv:
	[ -d ~/.ssh/ ] || mkdir ~/.ssh
	[ -d ~/.ssh/keys ] || mkdir ~/.ssh/keys
	ssh-keygen -t ed25519 -f ~/.ssh/keys/ed25519_git -C "riddimdubstep@yahoo.co.jp" -q -N ""
	cp ./ssh/config ~/.ssh/config
	cp cat ~/.ssh/keys/ed25519_git.pub | pbcopy

