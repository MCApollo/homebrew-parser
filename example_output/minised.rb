name :
	 Minised
homepage :
	 https://www.exactcode.com/opensource/minised/
url :
	 https://dl.exactcode.de/oss/minised/minised-1.15.tar.gz
description :
	 Smaller, cheaper, faster SED implementation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "DESTDIR=#{prefix}", "PREFIX=", "install"
