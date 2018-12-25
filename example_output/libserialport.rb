name :
	 Libserialport
homepage :
	 https://sigrok.org/wiki/Libserialport
url :
	 https://sigrok.org/download/source/libserialport/libserialport-0.1.1.tar.gz
description :
	 Cross-platform serial port C library
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
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
