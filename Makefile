.PHONY: genSshEnv
genSshEnv:
	[ -d ~/.ssh/keys ] || mkdir ~/.ssh/keys
	ssh-keygen -t ed25519 -f ~/.ssh/keys/ed25519_git -C "riddimdubstep@yahoo.co.jp" -q -N ""
	cp ./ssh/config ~/.ssh/config


.PHONY: updateSecrets
updateSecrets:
	tar cvf \
	  secrets.tar \
          ./ssh/config \
	  ./ssh/github_id_rsa
	gpg -c secrets.tar

.PHONY: decryptSecrets
decreyptSecrets:
	gpg --batch --yes --decrypy --output secrets.tar secrets.tar.gpg
