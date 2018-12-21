name :
	 Openjazz
homepage :
	 http://www.alister.eu/jazz/oj/
url :
	 https://github.com/AlisterT/openjazz/releases/download/20180522/openjazz-20180522.tar.xz
description :
	 Open source Jazz Jackrabit engine
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 libmodplug
	 sdl
conflicts :
patches :
EOF_patch :
	 diff --git a/src/io/network.cpp b/src/io/network.cpp
	 index 8af8775..362118e 100644
	 --- a/src/io/network.cpp
	 +++ b/src/io/network.cpp
	 @@ -53,6 +53,9 @@
	 #include <errno.h>
	 #include <string.h>
	 #endif
	 + 	#ifdef __APPLE__
	 + 		#define MSG_NOSIGNAL SO_NOSIGPIPE
	 +    #endif
	 #elif defined USE_SDL_NET
	 #include <arpa/inet.h>
	 #endif
install :
	 ENV.append_to_cflags "-I#{Formula["libmodplug"].opt_include}/libmodplug"
	 system "autoreconf", "-ivf"
	 system "./configure", "--prefix=#{prefix}",
	 "--bindir=#{pkgshare}",
	 "--disable-dependency-tracking"
	 system "make", "install"
	 (bin/"OpenJazz").write <<~EOS
	 #!/bin/sh
	 exec "#{pkgshare}/OpenJazz" "$@"
	 EOS
	 resource("shareware").stage do
	 pkgshare.install Dir["*"]
