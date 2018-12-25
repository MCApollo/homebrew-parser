name :
	 Hashcash
homepage :
	 http://hashcash.org
url :
	 http://hashcash.org/source/hashcash-1.22.tgz
description :
	 Proof-of-work algorithm to counter denial-of-service (DoS) attacks
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install",
	 "PACKAGER=HOMEBREW",
	 "INSTALL_PATH=#{bin}",
	 "MAN_INSTALL_PATH=#{man1}",
	 "DOC_INSTALL_PATH=#{doc}"
