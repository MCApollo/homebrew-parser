name :
	 LibbitcoinServer
homepage :
	 https://github.com/libbitcoin/libbitcoin-server
url :
	 https://github.com/libbitcoin/libbitcoin-server/archive/v3.5.0.tar.gz
description :
	 Bitcoin Full Node and Query Server
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libbitcoin-node
	 libbitcoin-protocol
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["libbitcoin"].opt_libexec/"lib/pkgconfig"
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 bash_completion.install "data/bs"
