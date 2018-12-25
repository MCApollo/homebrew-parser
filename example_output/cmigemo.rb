name :
	 Cmigemo
homepage :
	 https://www.kaoriya.net/software/cmigemo
url :
description :
	 Migemo is a tool that supports Japanese incremental search with Romaji
build_deps :
	 nkf
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- a/src/wordbuf.c	2011-08-15 02:57:05.000000000 +0900
	 +++ b/src/wordbuf.c	2011-08-15 02:57:17.000000000 +0900
	 @@ -9,6 +9,7 @@
	 #include <stdio.h>
	 #include <stdlib.h>
	 #include <string.h>
	 +#include <limits.h>
	 #include "wordbuf.h"
	 #define WORDLEN_DEF 64
install :
	 chmod 0755, "./configure"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "osx"
	 system "make", "osx-dict"
	 system "make", "-C", "dict", "utf-8" if build.stable?
	 ENV.deparallelize
	 system "make", "osx-install"
