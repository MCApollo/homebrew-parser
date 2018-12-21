name :
	 Lzlib
homepage :
	 https://www.nongnu.org/lzip/lzlib.html
url :
	 https://download.savannah.gnu.org/releases/lzip/lzlib/lzlib-1.10.tar.gz
description :
	 Data compression library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
