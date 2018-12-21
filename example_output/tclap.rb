name :
	 Tclap
homepage :
	 https://tclap.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/tclap/tclap-1.2.2.tar.gz
description :
	 Templatized C++ command-line parser library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
