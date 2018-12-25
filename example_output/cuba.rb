name :
	 Cuba
homepage :
	 http://www.feynarts.de/cuba/
url :
	 http://www.feynarts.de/cuba/Cuba-4.2.tar.gz
description :
	 Library for multidimensional numerical integration
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
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "demo"
