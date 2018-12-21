name :
	 Muparser
homepage :
	 http://beltoforion.de/article.php?a=muparser
url :
	 https://github.com/beltoforion/muparser/archive/v2.2.6.1.tar.gz
description :
	 C++ math expression parser library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
