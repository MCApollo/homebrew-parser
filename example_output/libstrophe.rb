name :
	 Libstrophe
homepage :
	 http://strophe.im/libstrophe/
url :
	 https://github.com/strophe/libstrophe/archive/0.9.2.tar.gz
description :
	 XMPP library for C
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 check
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
