name :
	 Exempi
homepage :
	 https://wiki.freedesktop.org/libopenraw/Exempi/
url :
	 https://libopenraw.freedesktop.org/download/exempi-2.4.5.tar.bz2
description :
	 Library to parse XMP metadata
build_deps :
link_deps :
	 boost
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-boost=#{HOMEBREW_PREFIX}"
	 system "make", "install"
