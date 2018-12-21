name :
	 Gdbm
homepage :
	 https://www.gnu.org/software/gdbm/
url :
	 https://ftp.gnu.org/gnu/gdbm/gdbm-1.18.1.tar.gz
description :
	 GNU database manager
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --without-readline
	 --prefix=#{prefix}
	 ]
	 args << "--enable-libgdbm-compat" if build.with? "libgdbm-compat"
	 system "./configure", *args
	 system "make", "install"
