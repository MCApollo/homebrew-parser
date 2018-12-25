name :
	 Nload
homepage :
	 http://www.roland-riegel.de/nload/
url :
	 http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz
description :
	 Realtime console network usage monitor
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://sourceforge.net/p/nload/bugs/_discuss/thread/c9b68d8e/4a65/attachment/devreader-bsd.cpp.patch
EOF_patch :
	 diff --git a/configure.in b/configure.in
	 index 87ecc88..4df8dc3 100644
	 --- a/configure.in
	 +++ b/configure.in
	 @@ -38,7 +38,7 @@ case $host_os in
	 AC_CHECK_FUNCS([memset])
	 ;;
	 -    *bsd*)
	 +    *darwin*)
	 AC_DEFINE(HAVE_BSD, 1, [Define to 1 if your build target is BSD.])
	 AM_CONDITIONAL(HAVE_BSD, true)
install :
	 system "./run_autotools"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install", "LDFLAGS="
