name :
	 Vsftpd
homepage :
	 https://security.appspot.com/vsftpd.html
url :
	 https://security.appspot.com/downloads/vsftpd-3.0.3.tar.gz
description :
	 Secure FTP server for UNIX
build_deps :
link_deps :
optional_deps :
	 openssl
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/sysdeputil.c b/sysdeputil.c
	 index 9dc8a5e..66dbe30 100644
	 --- a/sysdeputil.c
	 +++ b/sysdeputil.c
	 @@ -64,6 +64,10 @@
	 #include <utmpx.h>
	 /* BEGIN config */
	 +#if defined(__APPLE__)
	 +  #undef VSF_SYSDEP_HAVE_UTMPX
	 +#endif
	 +
	 #if defined(__linux__)
	 #include <errno.h>
	 #include <syscall.h>
	 diff --git a/vsf_findlibs.sh b/vsf_findlibs.sh
	 index b988be6..68d4a34 100755
	 --- a/vsf_findlibs.sh
	 +++ b/vsf_findlibs.sh
	 @@ -20,6 +20,8 @@ if find_func pam_start sysdeputil.o; then
	 locate_library /usr/lib/libpam.sl && echo "-lpam";
	 locate_library /usr/lib/libpam.a && echo "-lpam";
	 +
	 +  locate_library /usr/lib/libpam.dylib && echo "-lpam";
	 else
	 locate_library /lib/libcrypt.so && echo "-lcrypt";
	 locate_library /usr/lib/libcrypt.so && echo "-lcrypt";
	 diff --git a/Makefile b/Makefile
	 index c63ed1b..556519e 100644
	 --- a/Makefile
	 +++ b/Makefile
	 @@ -10,7 +10,7 @@ CFLAGS	=	-O2 -fPIE -fstack-protector --param=ssp-buffer-size=4 \
	 LIBS	=	`./vsf_findlibs.sh`
	 LINK	=	-Wl,-s
	 -LDFLAGS	=	-fPIE -pie -Wl,-z,relro -Wl,-z,now
	 +LDFLAGS	=	-fPIE -pie
	 OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
	 tunables.o ftpdataio.o secbuf.o ls.o \
install :
	 if build.with? "openssl"
	 inreplace "builddefs.h", "#undef VSF_BUILD_SSL", "#define VSF_BUILD_SSL"
	 end
	 inreplace "defs.h", "/etc/vsftpd.conf", "#{etc}/vsftpd.conf"
	 inreplace "tunables.c", "/etc", etc
	 inreplace "tunables.c", "/var", var
	 system "make"
	 sbin.install "vsftpd"
	 etc.install "vsftpd.conf"
	 man5.install "vsftpd.conf.5"
	 man8.install "vsftpd.8"
