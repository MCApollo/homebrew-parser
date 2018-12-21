name :
	 Ccze
homepage :
	 https://packages.debian.org/wheezy/ccze
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/c/ccze/ccze_0.2.1.orig.tar.gz
description :
	 Robust and modular log colorizer
build_deps :
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/ccze-compat.c", "#if HAVE_SUBOPTARg", "#if HAVE_SUBOPTARG"
	 inreplace "src/Makefile.in", "-Wreturn-type -Wswitch -Wmulticharacter",
	 "-Wreturn-type -Wswitch"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-builtins=all"
	 system "make", "install"
	 share.install prefix/"man"
