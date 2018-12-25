name :
	 Tcpreplay
homepage :
	 https://tcpreplay.appneta.com/
url :
	 https://github.com/appneta/tcpreplay/releases/download/v4.3.0/tcpreplay-4.3.0.tar.gz
description :
	 Replay saved tcpdump files at arbitrary speeds
build_deps :
link_deps :
	 libdnet
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-dynamic-link"
	 system "make", "install"
