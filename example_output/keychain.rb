name :
	 Keychain
homepage :
	 https://www.funtoo.org/Keychain
url :
	 https://build.funtoo.org/distfiles/keychain/keychain-2.8.5.tar.bz2
description :
	 User-friendly front-end to ssh-agent(1)
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
	 bin.install "keychain"
	 man1.install "keychain.1"
