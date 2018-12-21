name :
	 Libtermkey
homepage :
	 http://www.leonerd.org.uk/code/libtermkey/
url :
	 http://www.leonerd.org.uk/code/libtermkey/libtermkey-0.20.tar.gz
description :
	 Library for processing keyboard entry from the terminal
build_deps :
	 libtool
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
