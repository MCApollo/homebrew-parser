name :
	 ArgpStandalone
homepage :
	 https://www.lysator.liu.se/~nisse/misc/
url :
	 https://www.lysator.liu.se/~nisse/misc/argp-standalone-1.3.tar.gz
description :
	 Standalone version of arguments parsing functions from GLIBC
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/b5f0ad3/argp-standalone/patch-argp-fmtstream.h
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 lib.install "libargp.a"
	 include.install "argp.h"
