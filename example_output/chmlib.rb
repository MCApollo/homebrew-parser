name :
	 Chmlib
homepage :
	 http://www.jedrea.com/chmlib
url :
	 http://www.jedrea.com/chmlib/chmlib-0.40.tar.gz
description :
	 Library for dealing with Microsoft ITSS/CHM files
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
	 system "./configure", "--disable-io64", "--enable-examples", "--prefix=#{prefix}"
	 system "make", "install"
