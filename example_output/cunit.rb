name :
	 Cunit
homepage :
	 https://cunit.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cunit/CUnit/2.1-3/CUnit-2.1-3.tar.bz2
description :
	 Lightweight unit testing framework for C
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "bootstrap", "libtoolize", "glibtoolize"
	 system "sh", "bootstrap", prefix
	 system "make", "install"
