name :
	 Cuetools
homepage :
	 https://github.com/svend/cuetools
url :
	 https://github.com/svend/cuetools/archive/1.4.1.tar.gz
description :
	 Utilities for .cue and .toc files
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/configure.ac b/configure.ac
	 index f54bb92..84ab467 100644
	 --- a/configure.ac
	 +++ b/configure.ac
	 @@ -1,5 +1,5 @@
	 AC_INIT([cuetools], [1.4.0], [svend@ciffer.net])
	 -AM_INIT_AUTOMAKE([-Wall -Werror foreign])
	 +AM_INIT_AUTOMAKE([-Wall -Werror -Wno-extra-portability foreign])
	 AC_PROG_CC
	 AC_PROG_INSTALL
	 AC_PROG_RANLIB
install :
	 system "autoreconf", "-i"
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
