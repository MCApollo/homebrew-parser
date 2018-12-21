name :
	 Freeipmi
homepage :
	 https://www.gnu.org/software/freeipmi/
url :
	 https://ftp.gnu.org/gnu/freeipmi/freeipmi-1.6.2.tar.gz
description :
	 In-band and out-of-band IPMI (v1.5/2.0) software
build_deps :
link_deps :
	 argp-standalone
	 libgcrypt
conflicts :
patches :
EOF_patch :
install :
	 inreplace "man/Makefile.in",
	 "$(CPP_FOR_BUILD) -nostdinc -w -C -P -I$(top_srcdir)/man $@.pre $@",
	 "clang -E -nostdinc -w -C -P -I$(top_srcdir)/man $@.pre > $@"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
