name :
	 Stuntman
homepage :
	 http://www.stunprotocol.org/
url :
	 http://www.stunprotocol.org/stunserver-1.2.13.tgz
description :
	 Implementation of the STUN protocol
build_deps :
	 boost
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "stunserver", "stunclient", "stuntestcode"
