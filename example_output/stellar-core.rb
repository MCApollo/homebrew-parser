name :
	 StellarCore
homepage :
	 https://www.stellar.org/
url :
	 https://github.com/stellar/stellar-core.git
description :
	 The backbone of the Stellar (XLM) network
build_deps :
	 autoconf
	 automake
	 libtool
	 pandoc
	 pkg-config
link_deps :
	 libsodium
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-postgres"
	 system "make", "install"
