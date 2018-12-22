name :
	 Mcrypt
homepage :
	 https://mcrypt.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/mcrypt/MCrypt/2.6.8/mcrypt-2.6.8.tar.gz
description :
	 Replacement for the old crypt package and crypt(1) command
build_deps :
link_deps :
	 mhash
conflicts :
patches :
EOF_patch :
	 diff --git a/src/rfc2440.c b/src/rfc2440.c
	 index 5a1f296..aeb501c 100644
	 --- a/src/rfc2440.c
	 +++ b/src/rfc2440.c
	 @@ -23,7 +23,12 @@
	 #include <zlib.h>
	 #endif
	 #include <stdio.h>
	 +
	 +#ifdef __APPLE__
	 +#include <malloc/malloc.h>
	 +#else
	 #include <malloc.h>
	 +#endif
	 #include "xmalloc.h"
	 #include "keys.h"
install :
	 resource("libmcrypt").stage do
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--with-libmcrypt-prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
