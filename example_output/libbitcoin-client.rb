name :
	 LibbitcoinClient
homepage :
	 https://github.com/libbitcoin/libbitcoin-client
url :
	 https://github.com/libbitcoin/libbitcoin-client/archive/v3.5.0.tar.gz
description :
	 Bitcoin Client Query Library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libbitcoin-protocol
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["libbitcoin"].opt_libexec/"lib/pkgconfig"
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
