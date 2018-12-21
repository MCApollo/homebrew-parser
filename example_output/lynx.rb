name :
	 Lynx
homepage :
	 https://invisible-island.net/lynx/
url :
	 https://invisible-mirror.net/archives/lynx/tarballs/lynx2.8.9rel.1.tar.bz2
description :
	 Text-based web browser
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--disable-echo",
	 "--enable-default-colors",
	 "--with-zlib",
	 "--with-bzlib",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}",
	 "--enable-ipv6"
	 system "make", "install"
