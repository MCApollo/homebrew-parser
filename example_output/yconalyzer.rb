name :
	 Yconalyzer
homepage :
	 https://sourceforge.net/projects/yconalyzer/
url :
	 https://downloads.sourceforge.net/project/yconalyzer/yconalyzer-1.0.4.tar.bz2
description :
	 TCP traffic analyzer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 --- yconalyzer.cc.orig	2014-01-12 14:15:17.000000000 +0800
	 +++ yconalyzer.cc	2014-01-12 14:17:49.000000000 +0800
	 @@ -76,19 +76,11 @@
	 #include <string>
	 -#if __GNUC__ > 2
	 #include <map>
	 -using namespace _GLIBCXX_STD;
	 +using namespace std;
	 // Linux gcc-3 is not too happy with the format strings we use in BSD.
	 #define KEY_FMT_STRING "%#8x%#4x"
	 -#else	/* We are using gnu-c <= 2 */
	 -
	 -#include <hash_map.h>
	 -#define KEY_FMT_STRING "%8ux%4hx"
	 -
	 -#endif
	 -
	 static int debug = 0;
	 static u_short port = 0;
	 static int nbuckets;
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 chmod 0755, "./install-sh"
	 system "make", "install"
