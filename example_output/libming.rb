name :
	 Libming
homepage :
	 http://www.libming.org
url :
	 https://github.com/libming/libming/archive/ming-0_4_8.tar.gz
description :
	 C library for generating Macromedia Flash files
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 freetype
	 giflib
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--enable-perl",
	 "--enable-python"
	 system "make", "DEBUG=", "install"
