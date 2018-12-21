name :
	 Gputils
homepage :
	 https://gputils.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gputils/gputils/1.5.0/gputils-1.5.0-1.tar.bz2
description :
	 GNU PIC Utilities
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
