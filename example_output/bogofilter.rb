name :
	 Bogofilter
homepage :
	 https://bogofilter.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/bogofilter/bogofilter-1.2.4/bogofilter-1.2.4.tar.bz2
description :
	 Mail filter via statistical analysis
build_deps :
link_deps :
	 berkeley-db
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
