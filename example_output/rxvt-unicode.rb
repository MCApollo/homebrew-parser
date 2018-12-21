name :
	 RxvtUnicode
homepage :
	 http://software.schmorp.de/pkg/rxvt-unicode.html
url :
	 http://dist.schmorp.de/rxvt-unicode/rxvt-unicode-9.22.tar.bz2
description :
	 Rxvt fork with Unicode support
build_deps :
	 pkg-config
link_deps :
	 :x11
conflicts :
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index c756724..5e94907 100755
	 --- a/configure
	 +++ b/configure
	 @@ -7847,8 +7847,8 @@ $as_echo_n "checking for $PERL suitability... " >&6; }
	 save_CXXFLAGS="$CXXFLAGS"
	 save_LIBS="$LIBS"
	 -     CXXFLAGS="$CXXFLAGS `$PERL -MExtUtils::Embed -e ccopts`"
	 -     LIBS="$LIBS `$PERL -MExtUtils::Embed -e ldopts`"
	 +     CXXFLAGS="$CXXFLAGS `$PERL -MExtUtils::Embed -e ccopts|sed -E 's/ -arch [^ ]+//g'`"
	 +     LIBS="$LIBS `$PERL -MExtUtils::Embed -e ldopts|sed -E 's/ -arch [^ ]+//g'`"
	 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
	 /* end confdefs.h.  */
	 @@ -7884,8 +7884,8 @@ $as_echo "#define ENABLE_PERL 1" >>confdefs.h
	 IF_PERL=
	 PERL_O=rxvtperl.o
	 -        PERLFLAGS="`$PERL -MExtUtils::Embed -e ccopts`"
	 -        PERLLIB="`$PERL -MExtUtils::Embed -e ldopts`"
	 +        PERLFLAGS="`$PERL -MExtUtils::Embed -e ccopts|sed -E 's/ -arch [^ ]+//g'`"
	 +        PERLLIB="`$PERL -MExtUtils::Embed -e ldopts|sed -E 's/ -arch [^ ]+//g'`"
	 PERLPRIVLIBEXP="`$PERL -MConfig -e 'print $Config{privlibexp}'`"
	 else
	 as_fn_error $? "no, unable to link" "$LINENO" 5
	 diff --git a/Makefile.in b/Makefile.in
	 index eee5969..c230930 100644
	 --- a/Makefile.in
	 +++ b/Makefile.in
	 @@ -31,6 +31,7 @@ subdirs = src doc
	 RECURSIVE_TARGETS = all allbin alldoc tags clean distclean realclean install
	 +.PHONY: install
	 #-------------------------------------------------------------------------
	 $(RECURSIVE_TARGETS):
install :
	 args = %W[
	 --prefix=#{prefix}
	 --enable-256-color
	 --with-term=rxvt-unicode-256color
	 --with-terminfo=/usr/share/terminfo
	 --enable-smart-resize
	 --enable-unicode3
	 ]
	 system "./configure", *args
	 system "make", "install"
