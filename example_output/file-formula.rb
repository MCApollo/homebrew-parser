name :
	 FileFormula
homepage :
	 https://www.darwinsys.com/file/
url :
	 ftp://ftp.astron.com/pub/file/file-5.35.tar.gz
description :
	 Utility to determine file types
build_deps :
link_deps :
	 libmagic
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/Makefile.in b/src/Makefile.in
	 index c096c71..583a0ba 100644
	 --- a/src/Makefile.in
	 +++ b/src/Makefile.in
	 @@ -115,7 +115,6 @@ libmagic_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
	 PROGRAMS = $(bin_PROGRAMS)
	 am_file_OBJECTS = file.$(OBJEXT) seccomp.$(OBJEXT)
	 file_OBJECTS = $(am_file_OBJECTS)
	 -file_DEPENDENCIES = libmagic.la
	 AM_V_P = $(am__v_P_@AM_V@)
	 am__v_P_ = $(am__v_P_@AM_DEFAULT_V@)
	 am__v_P_0 = false
	 @@ -311,7 +310,7 @@ libmagic_la_LDFLAGS = -no-undefined -version-info 1:0:0
	 @MINGW_TRUE@MINGWLIBS = -lgnurx -lshlwapi
	 libmagic_la_LIBADD = $(LTLIBOBJS) $(MINGWLIBS)
	 file_SOURCES = file.c seccomp.c
	 -file_LDADD = libmagic.la
	 +file_LDADD = $(LDADD)
	 CLEANFILES = magic.h
	 EXTRA_DIST = magic.h.in
	 HDR = $(top_srcdir)/src/magic.h.in
install :
	 ENV.prepend "LDFLAGS", "-L#{Formula["libmagic"].opt_lib} -lmagic"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install-exec"
	 system "make", "-C", "doc", "install-man1"
	 rm_r lib
