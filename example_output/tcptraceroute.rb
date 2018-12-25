name :
	 Tcptraceroute
homepage :
	 https://github.com/mct/tcptraceroute
url :
description :
	 Traceroute implementation using TCP packets
build_deps :
link_deps :
	 libnet
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-libnet=#{HOMEBREW_PREFIX}",
	 "--mandir=#{man}"
	 system "make", "install"
