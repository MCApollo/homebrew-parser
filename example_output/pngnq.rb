name :
	 Pngnq
homepage :
	 https://pngnq.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pngnq/pngnq/1.1/pngnq-1.1.tar.gz
description :
	 Tool for optimizing PNG images
build_deps :
	 pkg-config
link_deps :
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/rwpng.c b/src/rwpng.c
	 index aaa21fc..5324afe 100644
	 --- a/src/rwpng.c
	 +++ b/src/rwpng.c
	 @@ -31,6 +31,7 @@
	 #include <stdio.h>
	 #include <stdlib.h>
	 +#include <zlib.h>
	 #include "png.h"        /* libpng header; includes zlib.h */
	 #include "rwpng.h"      /* typedefs, common macros, public prototypes */
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
