name :
	 Hping
homepage :
	 http://www.hping.org/
url :
	 http://www.hping.org/hping3-20051105.tar.gz
description :
	 Command-line oriented TCP/IP packet assembler/analyzer
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/fc1d446f/hping/patch-libpcap_stuff.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/fc1d446f/hping/patch-ars.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/fc1d446f/hping/patch-sendip.c.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/fc1d446f/hping/patch-Makefile.in.diff
	 https://raw.githubusercontent.com/Homebrew/formula-patches/fc1d446f/hping/patch-bytesex.h.diff
EOF_patch :
	 diff --git a/gethostname.c b/gethostname.c
	 index 3d0ea58..a8a9699 100644
	 --- a/gethostname.c
	 +++ b/gethostname.c
	 @@ -18,8 +18,6 @@
	 #include <arpa/inet.h>
	 #include <string.h>
	 -size_t strlcpy(char *dst, const char *src, size_t siz);
	 -
	 char *get_hostname(char* addr)
	 {
	 static char answer[1024];
install :
	 system "./configure", "--no-tcl"
	 sbin.mkpath
	 man8.mkpath
	 system "make", "CC=#{ENV.cc}",
	 "COMPILE_TIME=#{ENV.cflags}",
	 "INSTALL_PATH=#{prefix}",
	 "INSTALL_MANPATH=#{man}",
	 "install"
