name :
	 SimpleObfs
homepage :
	 https://github.com/shadowsocks/simple-obfs
url :
	 https://github.com/shadowsocks/simple-obfs.git
description :
	 Simple obfusacting plugin of shadowsocks-libev
build_deps :
	 asciidoc
	 autoconf
	 automake
	 libtool
	 xmlto
link_deps :
	 libev
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--enable-applecc"
	 system "make"
	 system "make", "install"
