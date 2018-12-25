name :
	 Png2ico
homepage :
	 https://www.winterdrache.de/freeware/png2ico/
url :
	 https://www.winterdrache.de/freeware/png2ico/data/png2ico-src-2002-12-08.tar.gz
description :
	 PNG to icon converter
build_deps :
link_deps :
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/png2ico.cpp b/png2ico.cpp
	 index 8fb87e4..9dedb97 100644
	 --- a/png2ico.cpp
	 +++ b/png2ico.cpp
	 @@ -34,6 +34,7 @@ Notes about transparent and inverted pixels:
	 #include <cstdio>
	 #include <vector>
	 #include <climits>
	 +#include <cstdlib>
	 #if __GNUC__ > 2
	 #include <ext/hash_map>
install :
	 inreplace "Makefile", "g++", "$(CXX)"
	 system "make", "CPPFLAGS=#{ENV.cxxflags} #{ENV.cppflags} #{ENV.ldflags}"
	 bin.install "png2ico"
	 man1.install "doc/png2ico.1"
