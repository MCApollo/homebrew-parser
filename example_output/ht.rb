name :
	 Ht
homepage :
	 https://hte.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/hte/ht-source/ht-2.1.0.tar.bz2
description :
	 Viewer/editor/analyzer for executables
build_deps :
link_deps :
	 lzo
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "htapp.cc", "(abs(a - b) > 1)", "(abs((int)a - (int)b))"
	 chmod 0755, "./install-sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-x11-textmode"
	 system "make", "install"
