name :
	 Libkml
homepage :
	 https://code.google.com/archive/p/libkml/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/libkml/libkml-1.2.0.tar.gz
description :
	 Library to parse, generate and operate on KML
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/dakcarto/7419882/raw/10ae08af224b3fee0617fa6288d806d3ccf37c0f/libkml-1.2-static-deps
EOF_patch :
	 diff --git a/src/kml/base/file_posix.cc b/src/kml/base/file_posix.cc
	 index 764ae55..8ee9892 100644
	 --- a/src/kml/base/file_posix.cc
	 +++ b/src/kml/base/file_posix.cc
	 @@ -29,6 +29,7 @@
	 #include "kml/base/file.h"
	 #include <stdlib.h>
	 #include <string.h>
	 +#include <unistd.h>
	 #include <sys/types.h>
	 #include <sys/stat.h>
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
