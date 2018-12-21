name :
	 Lesstif
homepage :
	 https://lesstif.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/lesstif/lesstif/0.95.2/lesstif-0.95.2.tar.bz2
description :
	 Open source implementation of OSF/Motif
build_deps :
link_deps :
	 freetype
	 :x11
conflicts :
	 openmotif
patches :
EOF_patch :
install :
	 inreplace "configure", "`aclocal --print-ac-dir`", "#{share}/aclocal"
	 ENV["LANG"] = "C"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--enable-production",
	 "--disable-dependency-tracking",
	 "--enable-shared",
	 "--enable-static"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
