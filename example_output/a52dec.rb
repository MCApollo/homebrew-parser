name :
	 A52dec
homepage :
	 https://liba52.sourceforge.io/
url :
	 https://liba52.sourceforge.io/files/a52dec-0.7.4.tar.gz
description :
	 Library for decoding ATSC A/52 streams (AKA 'AC-3')
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-shared",
	 "--mandir=#{man}"
	 system "make", "install"
