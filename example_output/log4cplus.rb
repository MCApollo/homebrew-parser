name :
	 Log4cplus
homepage :
	 https://sourceforge.net/p/log4cplus/wiki/Home/
url :
	 https://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/2.0.2/log4cplus-2.0.2.tar.xz
description :
	 Logging Framework for C++
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
