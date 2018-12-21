name :
	 Harbour
homepage :
	 https://harbour.github.io
url :
description :
	 Portable, xBase-compatible programming language and environment
build_deps :
link_deps :
	 pcre
	 :x11
conflicts :
patches :
EOF_patch :
	 diff --git a/contrib/hbcurl/core.c b/contrib/hbcurl/core.c
	 index 00caaa8..53618ed 100644
	 --- a/contrib/hbcurl/core.c
	 +++ b/contrib/hbcurl/core.c
	 @@ -53,8 +53,12 @@
	 */
	 #include <curl/curl.h>
	 -#include <curl/types.h>
	 -#include <curl/easy.h>
	 +#if LIBCURL_VERSION_NUM < 0x070A03
	 +
	 +#endif
	 +#if LIBCURL_VERSION_NUM < 0x070C00
	 +
	 +#endif
	 #include "hbapi.h"
	 #include "hbapiitm.h"
install :
	 ENV["HB_INSTALL_PREFIX"] = prefix
	 ENV["HB_WITH_X11"] = "no" if build.without? "x11"
	 ENV.deparallelize
	 system "make", "install"
	 rm Dir[bin/"hbmk2.*.hbl"]
	 rm bin/"contrib.hbr" if build.head?
	 rm bin/"harbour.ucf" if build.head?
