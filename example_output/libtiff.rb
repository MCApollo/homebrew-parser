name :
	 Libtiff
homepage :
	 http://libtiff.maptools.org/
url :
	 https://download.osgeo.org/libtiff/tiff-4.0.10.tar.gz
description :
	 TIFF library and utilities
build_deps :
link_deps :
	 jpeg
	 xz
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --without-x
	 --with-jpeg-include-dir=#{Formula["jpeg"].opt_include}
	 --with-jpeg-lib-dir=#{Formula["jpeg"].opt_lib}
	 ]
	 if build.with? "xz"
	 args << "--with-lzma-include-dir=#{Formula["xz"].opt_include}"
	 args << "--with-lzma-lib-dir=#{Formula["xz"].opt_lib}"
	 else
	 args << "--disable-lzma"
	 end
	 system "./configure", *args
	 system "make", "install"
