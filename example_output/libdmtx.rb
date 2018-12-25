name :
	 Libdmtx
homepage :
	 https://libdmtx.sourceforge.io
url :
	 https://github.com/dmtx/libdmtx/archive/v0.7.5.tar.gz
description :
	 Data Matrix library
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
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
