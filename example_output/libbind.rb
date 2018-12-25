name :
	 Libbind
homepage :
	 https://www.isc.org/software/libbind
url :
	 https://ftp.isc.org/isc/libbind/6.0/libbind-6.0.tar.gz
description :
	 Original resolver library from ISC
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
