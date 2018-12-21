name :
	 Mpssh
homepage :
	 https://github.com/ndenev/mpssh
url :
description :
	 Mass parallel ssh
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "CC=#{ENV.cc}", "BIN=#{bin}"
	 man1.install "mpssh.1"
