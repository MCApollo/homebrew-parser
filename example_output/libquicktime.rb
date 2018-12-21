name :
	 Libquicktime
homepage :
	 https://libquicktime.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/libquicktime/libquicktime/1.2.4/libquicktime-1.2.4.tar.gz
description :
	 Library for reading and writing quicktime files
build_deps :
	 pkg-config
link_deps :
	 gettext
conflicts :
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/libq/libquicktime/libquicktime_1.2.4-12.debian.tar.xz
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-gpl",
	 "--without-doxygen",
	 "--without-gtk",
	 "--without-x"
	 system "make"
	 system "make", "install"
