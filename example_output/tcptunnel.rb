name :
	 Tcptunnel
homepage :
	 http://www.vakuumverpackt.de/tcptunnel/
url :
	 https://github.com/vakuum/tcptunnel/archive/v0.8.tar.gz
description :
	 TCP port forwarder
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.mkpath
	 system "./configure", "--prefix=#{bin}"
	 system "make"
	 system "make", "install"
