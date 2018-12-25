name :
	 Testdisk
homepage :
	 https://www.cgsecurity.org/wiki/TestDisk
url :
	 https://www.cgsecurity.org/testdisk-7.0.tar.bz2
description :
	 Powerful free data recovery utility
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
