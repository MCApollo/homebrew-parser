name :
	 Vncsnapshot
homepage :
	 https://sourceforge.net/projects/vncsnapshot/
url :
	 https://downloads.sourceforge.net/project/vncsnapshot/vncsnapshot/1.2a/vncsnapshot-1.2a-src.tar.gz
description :
	 Command-line utility for taking VNC snapshots
build_deps :
link_deps :
	 jpeg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/sockets.cxx b/sockets.cxx
	 index ecdf0db..6c827fa 100644
	 --- a/sockets.cxx
	 +++ b/sockets.cxx
	 @@ -38,9 +38,9 @@ typedef int socklen_t;
	 #include <fcntl.h>
	 #endif
	 -#ifdef __APPLE__
	 -typedef int socklen_t;
	 -#endif
	 +//#ifdef __APPLE__
	 +//typedef int socklen_t;
	 +//#endif
	 extern "C" {
	 #include "vncsnapshot.h"
install :
	 inreplace "rfb.h", "typedef unsigned long CARD32;",
	 "typedef unsigned int CARD32;"
	 system "make"
	 bin.install "vncsnapshot", "vncpasswd"
	 man1.install "vncsnapshot.man1" => "vncsnapshot.1"
