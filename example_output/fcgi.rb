name :
	 Fcgi
homepage :
	 https://fastcgi-archives.github.io/
url :
	 https://downloads.sourceforge.net/project/slackbuildsdirectlinks/fcgi/fcgi-2.4.0.tar.gz
description :
	 Protocol for interfacing interactive programs with a web server
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 --- a/libfcgi/fcgi_stdio.c
	 +++ b/libfcgi/fcgi_stdio.c
	 @@ -40,7 +40,12 @@
	 #ifndef _WIN32
	 +#if defined(__APPLE__)
	 +#include <crt_externs.h>
	 +#define environ (*_NSGetEnviron())
	 +#else
	 extern char **environ;
	 +#endif
	 #ifdef HAVE_FILENO_PROTO
	 #include <stdio.h>
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
