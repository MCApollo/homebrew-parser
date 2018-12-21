name :
	 Blitz
homepage :
	 https://blitz.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/blitz/blitz/Blitz++%200.10/blitz-0.10.tar.gz
description :
	 C++ class library for scientific computing
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fi" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--infodir=#{info}",
	 "--enable-shared",
	 "--disable-doxygen",
	 "--disable-dot",
	 "--prefix=#{prefix}"
	 system "make", "install"
