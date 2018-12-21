name :
	 Cowsay
homepage :
	 https://github.com/tnalpgge/rank-amateur-cowsay
url :
	 https://github.com/tnalpgge/rank-amateur-cowsay/archive/cowsay-3.04.tar.gz
description :
	 Configurable talking characters in ASCII art
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "/bin/sh", "install.sh", prefix
	 mv prefix/"man", share
