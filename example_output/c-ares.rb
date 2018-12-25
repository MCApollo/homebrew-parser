name :
	 CAres
homepage :
	 https://c-ares.haxx.se/
url :
	 https://c-ares.haxx.se/download/c-ares-1.15.0.tar.gz
description :
	 Asynchronous DNS library
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
	 system "./buildconf" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-debug"
	 system "make", "install"
