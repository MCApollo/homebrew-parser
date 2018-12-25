name :
	 Unittest
homepage :
	 http://unittest.red-bean.com/
url :
	 http://unittest.red-bean.com/tar/unittest-0.50-62.tar.gz
description :
	 C++ Unit Test Framework
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "test/unittesttest"
