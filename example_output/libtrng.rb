name :
	 Libtrng
homepage :
	 https://www.numbercrunch.de/trng/
url :
	 https://www.numbercrunch.de/trng/trng-4.20.tar.gz
description :
	 Tina's Random Number Generator Library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
