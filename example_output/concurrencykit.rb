name :
	 Concurrencykit
homepage :
	 http://concurrencykit.org
url :
	 http://concurrencykit.org/releases/ck-0.6.0.tar.gz
description :
	 Aid design and implementation of concurrent systems
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
