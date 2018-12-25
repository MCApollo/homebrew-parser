name :
	 Ocproxy
homepage :
	 https://github.com/cernekee/ocproxy
url :
	 https://github.com/cernekee/ocproxy/archive/v1.60.tar.gz
description :
	 User-level SOCKS and port forwarding proxy
build_deps :
	 autoconf
	 automake
link_deps :
	 libevent
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
