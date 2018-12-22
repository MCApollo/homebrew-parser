name :
	 Bitcoin
homepage :
	 https://bitcoin.org/
url :
	 https://bitcoin.org/bin/bitcoin-core-0.17.0/bitcoin-0.17.0.tar.gz
description :
	 Decentralized, peer to peer payment network
build_deps :
	 pkg-config
link_deps :
	 berkeley-db@4
	 boost
	 libevent
	 miniupnpc
	 openssl
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? &&
	 MacOS::Xcode.version >= "8.0"
	 ENV.delete("SDKROOT")
	 end
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--with-boost-libdir=#{Formula["boost"].opt_lib}",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "share/rpcauth"
