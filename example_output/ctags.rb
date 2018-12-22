name :
	 Ctags
homepage :
	 https://ctags.sourceforge.io/
url :
	 https://downloads.sourceforge.net/ctags/ctags-5.8.tar.gz
description :
	 Reimplementation of ctags(1)
build_deps :
link_deps :
conflicts :
patches :
	 https://gist.githubusercontent.com/naegelejd/9a0f3af61954ae5a77e7/raw/16d981a3d99628994ef0f73848b6beffc70b5db8/Ctags%20r782
EOF_patch :
	 diff -ur a/ctags-5.8/read.c b/ctags-5.8/read.c
	 --- a/ctags-5.8/read.c	2009-07-04 17:29:02.000000000 +1200
	 +++ b/ctags-5.8/read.c	2012-11-04 16:19:27.000000000 +1300
	 @@ -18,7 +18,6 @@
	 #include <string.h>
	 #include <ctype.h>
	 -#define FILE_WRITE
	 #include "read.h"
	 #include "debug.h"
	 #include "entry.h"
	 diff -ur a/ctags-5.8/read.h b/ctags-5.8/read.h
	 --- a/ctags-5.8/read.h	2008-04-30 13:45:57.000000000 +1200
	 +++ b/ctags-5.8/read.h	2012-11-04 16:19:18.000000000 +1300
	 @@ -11,12 +11,6 @@
	 #ifndef _READ_H
	 #define _READ_H
	 -#if defined(FILE_WRITE) || defined(VAXC)
	 -
	 -#else
	 -
	 -#endif
	 -
	 /*
	 *   INCLUDE FILES
	 */
	 @@ -95,7 +89,7 @@
	 /*
	 *   GLOBAL VARIABLES
	 */
	 -extern CONST_FILE inputFile File;
	 +extern inputFile File;
	 /*
	 *   FUNCTION PROTOTYPES
install :
	 if build.head?
	 system "autoheader"
	 system "autoconf"
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-macro-patterns",
	 "--mandir=#{man}",
	 "--with-readlib"
	 system "make", "install"
