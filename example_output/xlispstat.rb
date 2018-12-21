name :
	 Xlispstat
homepage :
	 https://homepage.stat.uiowa.edu/~luke/xls/xlsinfo/
url :
	 https://homepage.cs.uiowa.edu/~luke/xls/xlispstat/current/xlispstat-3-52-23.tar.gz
description :
	 Statistical data science environment based on Lisp
build_deps :
link_deps :
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
	 ENV.deparallelize
	 system "make"
	 system "make", "install"
