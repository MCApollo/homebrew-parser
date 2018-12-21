name :
	 Cpptest
homepage :
	 https://cpptest.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cpptest/cpptest/cpptest-1.1.2/cpptest-1.1.2.tar.gz
description :
	 Unit testing framework handling automated tests in C++
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
