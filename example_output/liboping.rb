name :
	 Liboping
homepage :
	 https://noping.cc/
url :
	 https://noping.cc/files/liboping-1.10.0.tar.bz2
description :
	 C library to generate ICMP echo requests
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
