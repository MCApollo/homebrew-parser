name :
	 GitCrypt
homepage :
	 https://www.agwa.name/projects/git-crypt/
url :
	 https://www.agwa.name/projects/git-crypt/downloads/git-crypt-0.6.0.tar.gz
description :
	 Enable transparent encryption/decryption of files in a git repo
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "git-crypt"
