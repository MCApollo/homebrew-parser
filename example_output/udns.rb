name :
	 Udns
homepage :
	 http://www.corpit.ru/mjt/udns.html
url :
	 http://www.corpit.ru/mjt/udns/udns-0.4.tar.gz
description :
	 DNS resolver library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 --- udns-0.4.orig/Makefile.in	2014-01-23 02:45:31.000000000 -0800
	 +++ udns-0.4/Makefile.in	2014-08-16 20:22:00.000000000 -0700
	 @@ -42,6 +42,11 @@
	 SOLIBV = lib$(NAME).so.$(SOVER)
	 SOLIBFL= -L. -l$(NAME)_s
	 +DYLIB   = lib$(NAME).dylib
	 +DYLIBV = lib$(NAME).$(SOVER).dylib
	 +
	 +LIBS   = $(LIB) $(SOLIBV) $(DYLIB)
	 +
	 UTILS   = $(USRCS:.c=)
	 UOBJS   = $(USRCS:.c=.o)
	 SOUTILS = $(USRCS:.c=_s)
	 @@ -71,6 +76,14 @@
	 .c.o:
	 $(CC) $(CFLAGS) $(CDEFS) -c $<
	 +dylib: $(DYLIB)
	 +
	 +$(DYLIBV): $(SOBJS)
	 +	$(CC) -dynamiclib $(SOBJS) -o $(DYLIBV)
	 +$(DYLIB): $(DYLIBV)
	 +	rm -rf $@
	 +	ln -s $(DYLIBV) $@
	 +
	 shared: $(SOLIBV) $(SOUTILS)
	 sharedlib: $(SOLIBV)
install :
	 system "./configure"
	 system "make"
	 system "make", "dylib"
	 bin.install "dnsget", "rblcheck"
	 doc.install "NOTES", "TODO", "ex-rdns.c"
	 include.install "udns.h"
	 lib.install "libudns.a", "libudns.0.dylib", "libudns.dylib"
	 man1.install "dnsget.1", "rblcheck.1"
	 man3.install "udns.3"
