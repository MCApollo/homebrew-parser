name :
	 Gsmartcontrol
homepage :
	 https://gsmartcontrol.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/gsmartcontrol/1.1.3/gsmartcontrol-1.1.3.tar.bz2
description :
	 Graphical user interface for smartctl
build_deps :
	 pkg-config
link_deps :
	 gtkmm3
	 pcre
	 smartmontools
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
