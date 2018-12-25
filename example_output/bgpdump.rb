name :
	 Bgpdump
homepage :
	 https://bitbucket.org/ripencc/bgpdump/wiki/Home
url :
	 https://bitbucket.org/ripencc/bgpdump/get/1.6.0.tar.gz
description :
	 C library for analyzing MRT/Zebra/Quagga dump files
build_deps :
	 autoconf
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
