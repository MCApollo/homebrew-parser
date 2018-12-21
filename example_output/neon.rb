name :
	 Neon
homepage :
	 https://web.archive.org/web/webdav.org/neon/
url :
	 https://mirrorservice.org/sites/distfiles.macports.org/neon/neon-0.30.2.tar.gz
description :
	 HTTP and WebDAV client library with a C interface
build_deps :
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index d7702d2..5c3b5a3 100755
	 --- a/configure
	 +++ b/configure
	 @@ -4224,7 +4224,6 @@ fi
	 $as_echo "$ne_cv_os_uname" >&6; }
	 if test "$ne_cv_os_uname" = "Darwin"; then
	 -  CPPFLAGS="$CPPFLAGS -no-cpp-precomp"
	 LDFLAGS="$LDFLAGS -flat_namespace"
	 if test x${ac_cv_func_poll+set} != xset; then
install :
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--enable-shared",
	 "--disable-static",
	 "--disable-nls",
	 "--with-ssl=openssl",
	 "--with-libs=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
