name :
	 Gocr
homepage :
	 https://wasd.urz.uni-magdeburg.de/jschulen/ocr/
url :
	 https://wasd.urz.uni-magdeburg.de/jschulen/ocr/gocr-0.51.tar.gz
description :
	 Optical Character Recognition (OCR), converts images back to text
build_deps :
link_deps :
	 jpeg
	 netpbm
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/Makefile.in b/src/Makefile.in
	 index bf4181f..883fec2
	 --- a/src/Makefile.in
	 +++ b/src/Makefile.in
	 @@ -10,7 +10,7 @@ PROGRAM = gocr$(EXEEXT)
	 PGMASCLIB = Pgm2asc
	 #LIBPGMASCLIB = lib$(PGMASCLIB).a
	 -#INCLUDEFILES = gocr.h
	 +INCLUDEFILES = pgm2asc.h output.h list.h unicode.h gocr.h pnm.h
	 LANG=C
	 @@ -39,8 +39,8 @@ LIBOBJS=pgm2asc.o \
	 #VPATH = @srcdir@
	 bindir = @bindir@
	 -#libdir = @libdir@
	 -#includedir = @includedir@
	 +libdir = @libdir@
	 +includedir = /include/gocr
	 CC=@CC@
	 @@ -89,7 +89,8 @@ $(PROGRAM): $(LIBOBJS) gocr.o
	 $(CC) -o $@ $(LDFLAGS) gocr.o $(LIBOBJS) $(LIBS)
	 -libs: lib$(PGMASCLIB).a lib$(PGMASCLIB).@PACKAGE_VERSION@.so
	 +#libs: lib$(PGMASCLIB).a lib$(PGMASCLIB).@PACKAGE_VERSION@.so
	 +libs: lib$(PGMASCLIB).a
	 #lib$(PGMASCLIB).@PACKAGE_VERSION@.so: $(LIBOBJS)
	 #	$(CC) -fPIC -shared -Wl,-h$@ -o $@ $(LIBOBJS)
	 @@ -109,17 +110,17 @@ $(LIBOBJS): Makefile
	 .PHONY : clean proper install uninstall
	 install: all
	 -	#$(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(libdir) $(DESTDIR)$(includedir)
	 -	$(INSTALL) -d $(DESTDIR)$(bindir)
	 +	$(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(libdir) $(DESTDIR)$(includedir)
	 +	#$(INSTALL) -d $(DESTDIR)$(bindir)
	 $(INSTALL) $(PROGRAM) $(DESTDIR)$(bindir)
	 $(INSTALL) ../bin/gocr.tcl   $(DESTDIR)$(bindir)
	 if test -f lib$(PGMASCLIB).a; then\
	 $(INSTALL) lib$(PGMASCLIB).a $(DESTDIR)$(libdir);\
	 $(INSTALL) lib$(PGMASCLIB).@PACKAGE_VERSION@.so $(DESTDIR)$(libdir);\
	 $(INSTALL) lib$(PGMASCLIB).so $(DESTDIR)$(libdir);\
	 +	 $(INSTALL) $(INCLUDEFILES) $(DESTDIR)$(includedir);\
	 +	 $(INSTALL) ../include/config.h $(DESTDIR)$(includedir);\
	 fi
	 -
	 -	#$(INSTALL) $(INCLUDEFILES) $(DESTDIR)$(includedir)
	 uninstall:
	 @@ -129,7 +130,8 @@ uninstall:
	 -rm -f $(DESTDIR)$(libdir)/lib$(PGMASCLIB).@PACKAGE_VERSION@.so
	 -rm -f $(DESTDIR)$(libdir)/lib$(PGMASCLIB).so
	 -	#for X in $(INCLUDEFILES); do rm -f $(DESTDIR)$(includedir)/$$X; done
	 +	for X in $(INCLUDEFILES); do rm -f $(DESTDIR)$(includedir)/$$X; done
	 +	-rm -f $(DESTDIR)$(includedir)/config.h
	 clean:
	 -rm -f *.o *~
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 inreplace "man/Makefile" do |s|
	 s.change_make_var! "mandir", "/share/man"
	 end
	 system "make", "libs"
	 system "make", "install"
