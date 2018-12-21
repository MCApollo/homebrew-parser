name :
	 Bsdiff
homepage :
	 https://www.daemonology.net/bsdiff
url :
	 https://www.daemonology.net/bsdiff/bsdiff-4.3.tar.gz
description :
	 Generate and apply patches to binary files
build_deps :
	 bsdmake
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/bspatch.c b/bspatch.c
	 index 643c60b..543379c 100644
	 --- a/bspatch.c
	 +++ b/bspatch.c
	 @@ -28,6 +28,7 @@
	 __FBSDID("$FreeBSD: src/usr.bin/bsdiff/bspatch/bspatch.c,v 1.1 2005/08/06 01:59:06 cperciva Exp $");
	 #endif
	 +#include <sys/types.h>
	 #include <bzlib.h>
	 #include <stdlib.h>
	 #include <stdio.h>
install :
	 system "bsdmake"
	 bin.install "bsdiff"
	 man1.install "bsdiff.1"
