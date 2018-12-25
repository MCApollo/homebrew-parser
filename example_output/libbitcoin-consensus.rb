name :
	 LibbitcoinConsensus
homepage :
	 https://github.com/libbitcoin/libbitcoin-consensus
url :
	 https://github.com/libbitcoin/libbitcoin-consensus/archive/v3.5.0.tar.gz
description :
	 Bitcoin Consensus Library (optional)
build_deps :
	 autoconf
	 automake
	 boost
	 libtool
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 ['secp256k1']
	 ['https://github.com/libbitcoin/secp256k1/archive/v0.1.0.13.tar.gz']
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
	 "--prefix=#{prefix}"
	 system "make", "install"
