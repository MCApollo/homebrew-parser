name :
	 LibbitcoinNetwork
homepage :
	 https://github.com/libbitcoin/libbitcoin-network
url :
	 https://github.com/libbitcoin/libbitcoin-network/archive/v3.5.0.tar.gz
description :
	 Bitcoin P2P Network Library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libbitcoin
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
