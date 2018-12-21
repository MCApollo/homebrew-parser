name :
	 Gts
homepage :
	 https://gts.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gts/gts/0.7.6/gts-0.7.6.tar.gz
description :
	 GNU triangulated surface library
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 netpbm
conflicts :
patches :
EOF_patch :
	 diff --git a/examples/happrox.c b/examples/happrox.c
	 index 88770a8..11f140d 100644
	 --- a/examples/happrox.c
	 +++ b/examples/happrox.c
	 @@ -21,7 +21,7 @@
	 #include <stdlib.h>
	 #include <locale.h>
	 #include <string.h>
	 -#include <pgm.h>
	 +#include <netpbm/pgm.h>
	 #include "config.h"
	 #ifdef HAVE_GETOPT_H
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
