name :
	 Connect
homepage :
	 https://bitbucket.org/gotoh/connect/wiki/Home
url :
	 https://bitbucket.org/gotoh/connect/get/1.105.tar.gz
description :
	 Provides SOCKS and HTTPS proxy support to SSH
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "connect"
