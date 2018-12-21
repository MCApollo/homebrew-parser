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
