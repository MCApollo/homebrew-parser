name :
	 Clpbar
homepage :
	 https://clpbar.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz
description :
	 Command-line progress bar
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--program-prefix='clp'"
	 system "make", "install"
