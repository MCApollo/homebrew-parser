name :
	 Miniupnpc
homepage :
	 https://miniupnp.tuxfamily.org
url :
	 https://miniupnp.tuxfamily.org/files/download.php?file=miniupnpc-2.1.tar.gz
description :
	 UPnP IGD client library and daemon
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
	 system "make", "INSTALLPREFIX=#{prefix}", "install"
