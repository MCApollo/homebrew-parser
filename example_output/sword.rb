name :
	 Sword
homepage :
	 https://www.crosswire.org/sword/index.jsp
url :
	 https://www.crosswire.org/ftpmirror/pub/sword/source/v1.8/sword-1.8.1.tar.gz
description :
	 Cross-platform tools to write Bible software
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-debug
	 --disable-profile
	 --disable-tests
	 --with-curl
	 --without-icu
	 --without-clucene
	 ]
	 system "./configure", *args
	 system "make", "install"
