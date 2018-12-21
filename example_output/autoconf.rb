name :
	 Autoconf
homepage :
	 https://www.gnu.org/software/autoconf
url :
	 https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
description :
	 Automatic configure script builder
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["PERL"] = "/usr/bin/perl"
	 inreplace "bin/autoreconf.in", "libtoolize", "glibtoolize"
	 inreplace "man/autoreconf.1", "libtoolize", "glibtoolize"
	 system "./configure", "--prefix=#{prefix}", "--with-lispdir=#{elisp}"
	 system "make", "install"
	 rm_f info/"standards.info"
