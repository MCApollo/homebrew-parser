name :
	 LibbitcoinExplorer
homepage :
	 https://github.com/libbitcoin/libbitcoin-explorer
url :
	 https://github.com/libbitcoin/libbitcoin-explorer/archive/v3.5.0.tar.gz
description :
	 Bitcoin command-line tool
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libbitcoin-client
	 libbitcoin-network
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
	 bash_completion.install "data/bx"
