name :
	 Libharu
homepage :
	 http://www.libharu.org/
url :
	 https://github.com/libharu/libharu/archive/RELEASE_2_3_0.tar.gz
description :
	 Library for generating PDF files
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./buildconf.sh", "--force"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-png=#{Formula["libpng"].opt_prefix}
	 ]
	 args << "--with-zlib=#{MacOS.sdk_path}/usr" if MacOS.sdk_path_if_needed
	 system "./configure", *args
	 system "make", "install"
