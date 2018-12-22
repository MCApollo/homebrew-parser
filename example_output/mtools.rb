name :
	 Mtools
homepage :
	 https://www.gnu.org/software/mtools/
url :
	 https://ftp.gnu.org/gnu/mtools/mtools-4.0.18.tar.gz
description :
	 Tools for manipulating MSDOS files
build_deps :
link_deps :
	 :x11
conflicts :
	 multimarkdown
patches :
EOF_patch :
install :
	 if ENV.cc == "clang"
	 inreplace "sysincludes.h",
	 "
	 "
	 end
	 args = %W[
	 LIBS=-liconv
	 --disable-debug
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 ]
	 if build.with? "x11"
	 args << "--with-x"
	 else
	 args << "--without-x"
	 end
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
