name :
	 Zlib
homepage :
	 https://zlib.net/
url :
	 https://zlib.net/zlib-1.2.11.tar.gz
description :
	 General-purpose lossless data-compression library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
