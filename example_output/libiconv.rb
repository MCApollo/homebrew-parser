name :
	 Libiconv
homepage :
	 https://www.gnu.org/software/libiconv/
url :
	 https://ftp.gnu.org/gnu/libiconv/libiconv-1.15.tar.gz
description :
	 Conversion library
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/patches/9be2793af/libiconv/patch-utf8mac.diff
EOF_patch :
	 diff --git a/lib/flags.h b/lib/flags.h
	 index d7cda21..4cabcac 100644
	 --- a/lib/flags.h
	 +++ b/lib/flags.h
	 @@ -14,6 +14,7 @@
	 #define ei_ascii_oflags (0)
	 #define ei_utf8_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
	 +#define ei_utf8mac_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
	 #define ei_ucs2_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
	 #define ei_ucs2be_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
	 #define ei_ucs2le_oflags (HAVE_ACCENTS | HAVE_QUOTATION_MARKS | HAVE_HANGUL_JAMO)
install :
	 ENV.deparallelize
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-extra-encodings",
	 "--enable-static",
	 "--docdir=#{doc}"
	 system "make", "-f", "Makefile.devel", "CFLAGS=#{ENV.cflags}", "CC=#{ENV.cc}"
	 system "make", "install"
