name :
	 Unac
homepage :
	 https://savannah.nongnu.org/projects/unac
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/u/unac/unac_1.8.0.orig.tar.gz
description :
	 C library and command that removes accents from a string
build_deps :
	 autoconf
	 automake
	 gettext
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;filename=patch-libunac1.txt;att=1;bug=623340
	 https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=10;filename=patch-unaccent.c.txt;att=1;bug=623340
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/u/unac/unac_1.8.0-6.diff.gz
EOF_patch :
	 diff --git a/configure.ac b/configure.ac
	 index 4a4eab6..9f25d50 100644
	 --- a/configure.ac
	 +++ b/configure.ac
	 @@ -49,6 +49,7 @@ AM_MAINTAINER_MODE
	 AM_ICONV
	 +LIBS="$LIBS -liconv"
	 AC_CHECK_FUNCS(iconv_open,,AC_MSG_ERROR([
	 iconv_open not found try to install replacement from
	 http://www.gnu.org/software/libiconv/
install :
	 chmod 0755, "configure"
	 touch "config.rpath"
	 inreplace "autogen.sh", "libtool", "glibtool"
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
