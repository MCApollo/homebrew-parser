name :
	 Links
homepage :
	 http://links.twibright.com/
url :
	 http://links.twibright.com/download/links-2.17.tar.bz2
description :
	 Lynx-like WWW browser that supports tables, menus, etc.
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 librsvg
	 libtiff
	 openssl
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 --without-lzma
	 ]
	 args << "--enable-graphics" if build.with? "x11"
	 system "./configure", *args
	 system "make", "install"
	 doc.install Dir["doc/*"]
