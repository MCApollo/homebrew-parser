name :
	 Libxspf
homepage :
	 https://libspiff.sourceforge.io/
url :
	 https://downloads.xiph.org/releases/xspf/libxspf-1.2.0.tar.bz2
description :
	 C++ library for XSPF playlist reading and writing
build_deps :
	 pkg-config
link_deps :
	 cpptest
	 uriparser
conflicts :
patches :
EOF_patch :
	 diff --git a/examples/read/read.cpp b/examples/read/read.cpp
	 index 411f892..b66a25c 100644
	 --- a/examples/read/read.cpp
	 +++ b/examples/read/read.cpp
	 @@ -43,6 +43,7 @@
	 #include <cstdio>
	 #include <cstdlib> // MAX_PATH
	 #include <climits> // PATH_MAX
	 +#include <unistd.h>
	 #if defined(__WIN32__) || defined(WIN32)
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
