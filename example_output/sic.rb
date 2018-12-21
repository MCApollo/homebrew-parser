name :
	 Sic
homepage :
	 https://tools.suckless.org/sic/
url :
	 https://dl.suckless.org/tools/sic-1.2.tar.gz
description :
	 Minimal multiplexing IRC client
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
