name :
	 Liblacewing
homepage :
	 https://udp.github.io/lacewing/
url :
	 https://github.com/udp/lacewing/archive/0.5.4.tar.gz
description :
	 Cross-platform, high-level C/C++ networking library
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 mv "#{lib}/liblacewing.dylib.0.5", "#{lib}/liblacewing.0.5.dylib"
