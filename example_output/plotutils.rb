name :
	 Plotutils
homepage :
	 https://www.gnu.org/software/plotutils/
url :
	 https://ftp.gnu.org/gnu/plotutils/plotutils-2.6.tar.gz
description :
	 C/C++ function library for exporting 2-D vector graphics
build_deps :
link_deps :
	 libpng
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 inreplace "libplot/z_write.c", "png_ptr->jmpbuf", "png_jmpbuf (png_ptr)"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-libplotter
	 ]
	 args << "--with-x" if build.with? "x11"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
