name :
	 Maxima
homepage :
	 https://maxima.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/maxima/Maxima-source/5.41.0-source/maxima-5.41.0.tar.gz
description :
	 Computer algebra system
build_deps :
	 sbcl
link_deps :
	 gettext
	 gnuplot
	 rlwrap
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["LANG"] = "C"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-gettext",
	 "--enable-sbcl",
	 "--enable-sbcl-exec",
	 "--with-sbcl=#{Formula["sbcl"].opt_bin}/sbcl"
	 system "make"
	 system "make", "install"
