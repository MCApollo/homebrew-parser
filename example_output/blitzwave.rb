name :
	 Blitzwave
homepage :
	 https://oschulz.github.io/blitzwave
url :
	 https://github.com/oschulz/blitzwave/archive/v0.8.0.tar.gz
description :
	 C++ wavelet library
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 blitz
conflicts :
patches :
EOF_patch :
	 diff --git a/configure.ac b/configure.ac
	 index 8d28d78..2bfe06f 100644
	 --- a/configure.ac
	 +++ b/configure.ac
	 @@ -8,6 +8,7 @@ AM_INIT_AUTOMAKE([-Wall -Werror])
	 AC_PROG_CXX
	 AC_LIBTOOL_DLOPEN
	 AC_PROG_LIBTOOL
	 +AM_PROG_AR
	 AC_CHECK_PROGS(DOXYGEN, doxygen, false)
	 AM_CONDITIONAL([COND_DOXYGEN], [test "$DOXYGEN" != "false"])
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
