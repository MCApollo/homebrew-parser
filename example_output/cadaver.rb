name :
	 Cadaver
homepage :
	 https://directory.fsf.org/wiki/Cadaver
url :
	 https://mirrorservice.org/sites/download.salixos.org/i486/extra-14.2/source/network/cadaver/cadaver-0.23.3.tar.gz
description :
	 Command-line client for DAV
build_deps :
	 pkg-config
link_deps :
	 gettext
	 neon
	 openssl
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- cadaver-0.23.3-orig/configure	2009-12-16 01:36:26.000000000 +0300
	 +++ cadaver-0.23.3/configure	2013-11-04 22:44:00.000000000 +0400
	 @@ -10328,7 +10328,7 @@
	 $as_echo "$ne_cv_lib_neon" >&6; }
	 if test "$ne_cv_lib_neon" = "yes"; then
	 ne_cv_lib_neonver=no
	 -       for v in 27 28 29; do
	 +       for v in 27 28 29 30; do
	 case $ne_libver in
	 0.$v.*) ne_cv_lib_neonver=yes ;;
	 esac
	 @@ -10975,8 +10975,8 @@
	 fi
	 else
	 -    { $as_echo "$as_me:$LINENO: incompatible neon library version $ne_libver: wanted 0.27 28 29" >&5
	 -$as_echo "$as_me: incompatible neon library version $ne_libver: wanted 0.27 28 29" >&6;}
	 +    { $as_echo "$as_me:$LINENO: incompatible neon library version $ne_libver: wanted 0.27 28 29 30" >&5
	 +$as_echo "$as_me: incompatible neon library version $ne_libver: wanted 0.27 28 29 30" >&6;}
	 neon_got_library=no
	 fi
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-ssl=openssl",
	 "--with-libs=#{Formula["openssl"].opt_prefix}",
	 "--with-neon=#{Formula["neon"].opt_prefix}"
	 system "make", "-C", "lib/intl"
	 system "make", "install"
