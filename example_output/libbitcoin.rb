name :
	 Libbitcoin
homepage :
	 https://libbitcoin.org/
url :
	 https://github.com/libbitcoin/libbitcoin/archive/v3.5.0.tar.gz
description :
	 Bitcoin Cross-Platform C++ Development Toolkit
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 boost
	 libpng
	 qrencode
conflicts :
patches :
EOF_patch :
install :
	 resource("secp256k1").stage do
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}",
	 "--enable-module-recovery",
	 "--with-bignum=no"
	 system "make", "install"
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", "#{libexec}/lib/pkgconfig"
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-png",
	 "--with-qrencode"
	 system "make", "install"
