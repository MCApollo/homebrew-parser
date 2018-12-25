name :
	 Libquantum
homepage :
	 http://www.libquantum.de/
url :
	 http://www.libquantum.de/files/libquantum-1.0.0.tar.gz
description :
	 C library for the simulation of quantum mechanics
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
	 system "make", "install"
