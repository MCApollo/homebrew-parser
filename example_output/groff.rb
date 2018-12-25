name :
	 Groff
homepage :
	 https://www.gnu.org/software/groff/
url :
	 https://ftp.gnu.org/gnu/groff/groff-1.22.3.tar.gz
description :
	 GNU troff text-formatting system
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/Makefile.in b/Makefile.in
	 index bc156ce..70c6f85 100644
	 --- a/Makefile.in
	 +++ b/Makefile.in
	 @@ -896,6 +896,8 @@ $(GNULIBDIRS): FORCE
	 $(MAKE) ACLOCAL=: AUTOCONF=: AUTOHEADER=: AUTOMAKE=: $(do) ;; \
	 esac
	 +$(SHPROGDIRS): $(PROGDEPDIRS)
	 +
	 $(OTHERDIRS): $(PROGDEPDIRS) $(CCPROGDIRS) $(CPROGDIRS) $(SHPROGDIRS)
	 $(INCDIRS) $(PROGDEPDIRS) $(SHPROGDIRS) $(OTHERDIRS): FORCE
install :
	 system "./configure", "--prefix=#{prefix}", "--without-x"
	 system "make"
	 system "make", "install"
