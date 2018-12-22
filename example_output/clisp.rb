name :
	 Clisp
homepage :
	 https://clisp.sourceforge.io/
url :
	 https://ftp.gnu.org/gnu/clisp/release/2.49/clisp-2.49.tar.bz2
description :
	 GNU CLISP, a Common Lisp implementation
build_deps :
link_deps :
	 libsigsegv
	 readline
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e2cc7c1/clisp/patch-src_lispbibl_d.diff
EOF_patch :
	 diff --git a/src/stream.d b/src/stream.d
	 index 5345ed6..cf14e29 100644
	 --- a/src/stream.d
	 +++ b/src/stream.d
	 @@ -3994,7 +3994,7 @@ global object iconv_range (object encoding, uintL start, uintL end, uintL maxint
	 nonreturning_function(extern, error_unencodable, (object encoding, chart ch));
	 /* Avoid annoying warning caused by a wrongly standardized iconv() prototype. */
	 -#ifdef GNU_LIBICONV
	 +#if defined(GNU_LIBICONV) && !defined(__APPLE_CC__)
	 #undef iconv
	 #define iconv(cd,inbuf,inbytesleft,outbuf,outbytesleft) \
	 libiconv(cd,(ICONV_CONST char **)(inbuf),inbytesleft,outbuf,outbytesleft)
install :
	 ENV.deparallelize
	 ENV.O0
	 ENV["CC"] = "#{ENV.cc} -m#{MacOS.prefer_64_bit? ? 64 : 32}"
	 inreplace "src/makemake.in", "${datarootdir}/emacs/site-lisp", elisp
	 system "./configure", "--prefix=#{prefix}",
	 "--with-readline=yes"
	 cd "src" do
	 inreplace "Makefile" do |s|
	 s.change_make_var! "CFLAGS", "#{s.get_make_var("CFLAGS")} #{ENV["CFLAGS"]}"
	 end
	 system "ulimit -s 16384 && make"
	 if MacOS.version >= :lion
	 opoo <<~EOS
	 `make check` fails so we are skipping it.
	 However, there will likely be other issues present.
	 Please take them upstream to the clisp project itself.
	 EOS
	 else
	 system "make", "check"
	 end
	 system "make", "install"
