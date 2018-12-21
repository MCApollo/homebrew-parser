name :
	 Libdca
homepage :
	 https://www.videolan.org/developers/libdca.html
url :
	 https://download.videolan.org/pub/videolan/libdca/0.0.6/libdca-0.0.6.tar.bz2
description :
	 Library for decoding DTS Coherent Acoustics streams
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-std=gnu89"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
