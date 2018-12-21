name :
	 Libestr
homepage :
	 http://libestr.adiscon.com
url :
	 http://libestr.adiscon.com/files/download/libestr-0.1.10.tar.gz
description :
	 C library for string handling (and a bit more)
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
