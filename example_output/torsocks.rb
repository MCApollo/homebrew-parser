name :
	 Torsocks
homepage :
	 https://gitweb.torproject.org/torsocks.git/
url :
	 https://git.torproject.org/torsocks.git
description :
	 Use SOCKS-friendly applications with Tor
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
