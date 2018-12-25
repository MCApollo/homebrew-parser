name :
	 Cppunit
homepage :
	 https://wiki.freedesktop.org/www/Software/cppunit/
url :
	 https://dev-www.libreoffice.org/src/cppunit-1.14.0.tar.gz
description :
	 Unit testing framework for C++
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
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
