name :
	 Gloox
homepage :
	 https://camaya.net/gloox/
url :
	 https://camaya.net/download/gloox-1.0.21.tar.bz2
description :
	 C++ Jabber/XMPP library that handles the low-level protocol
build_deps :
	 pkg-config
link_deps :
	 libidn
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-zlib",
	 "--disable-debug",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
