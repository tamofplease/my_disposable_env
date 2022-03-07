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
