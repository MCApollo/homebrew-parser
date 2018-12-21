name :
	 GnuCobol
homepage :
	 https://sourceforge.net/projects/open-cobol/
url :
	 https://downloads.sourceforge.net/project/open-cobol/gnu-cobol/2.2/gnucobol-2.2.tar.xz
description :
	 Implements much of the COBOL 85 and COBOL 2002 standards
build_deps :
link_deps :
	 berkeley-db
	 gmp
conflicts :
	 open-cobol
patches :
EOF_patch :
install :
	 gmp = Formula["gmp"]
	 bdb = Formula["berkeley-db"]
	 ENV.append "CPPFLAGS", "-I#{gmp.opt_include} -I#{bdb.opt_include}"
	 ENV.append "LDFLAGS", "-L#{gmp.opt_lib} -L#{bdb.opt_lib}"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-libiconv-prefix=/usr",
	 "--with-libintl-prefix=/usr"
	 system "make", "install"
