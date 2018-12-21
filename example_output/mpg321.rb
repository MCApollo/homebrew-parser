name :
	 Mpg321
homepage :
	 https://mpg321.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mpg321/mpg321/0.3.2/mpg321_0.3.2.orig.tar.gz
description :
	 Command-line MP3 player
build_deps :
link_deps :
	 libao
	 libid3tag
	 mad
conflicts :
patches :
EOF_patch :
	 --- a/mpg321.h	2012-03-25 05:27:49.000000000 -0700
	 +++ b/mpg321.h	2012-11-15 20:54:28.000000000 -0800
	 @@ -290,7 +290,7 @@
	 /* Shared total decoded frames */
	 decoded_frames *Decoded_Frames;
	 -#if defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
	 +#if defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED) || defined(__APPLE__)
	 /* */
	 #else
	 union semun {
	 --- a/network.c	2012-03-25 05:27:49.000000000 -0700
	 +++ b/network.c	2012-11-15 20:58:02.000000000 -0800
	 @@ -50,6 +50,13 @@
	 #define IFVERB if(options.opt & MPG321_VERBOSE_PLAY)
	 +/* The following defines are needed to emulate the Linux interface on
	 + * BSD-based systems like FreeBSD and OS X */
	 +#if !defined(IPV6_ADD_MEMBERSHIP) && defined(IPV6_JOIN_GROUP)
	 +#define IPV6_ADD_MEMBERSHIP IPV6_JOIN_GROUP
	 +#define IPV6_DROP_MEMBERSHIP IPV6_LEAVE_GROUP
	 +#endif
	 +
	 int proxy_enable = 0;
	 char *proxy_server;
	 int auth_enable = 0;
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug",
	 "--prefix=#{prefix}",
	 "--disable-mpg123-symlink",
	 "--enable-ipv6",
	 "--disable-alsa"
	 system "make", "install"
