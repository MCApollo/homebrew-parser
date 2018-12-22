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