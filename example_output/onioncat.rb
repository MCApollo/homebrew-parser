name :
	 Onioncat
homepage :
	 https://www.onioncat.org
url :
	 https://www.cypherpunk.at/ocat/download/Source/current/onioncat-0.2.2.r578.tar.gz
description :
	 VPN-adapter that provides location privacy using Tor or I2P
build_deps :
link_deps :
	 tor
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 rm_f "
