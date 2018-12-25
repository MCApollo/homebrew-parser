name :
	 Libpst
homepage :
	 https://www.five-ten-sg.com/libpst/
url :
	 https://www.five-ten-sg.com/libpst/packages/libpst-0.6.72.tar.gz
description :
	 Utilities for the PST file format
build_deps :
	 pkg-config
link_deps :
	 boost
	 boost-python
	 gettext
	 libgsf
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-python
	 --with-boost-python=mt
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
