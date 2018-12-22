name :
	 Pgplot
homepage :
	 http://www.astro.caltech.edu/~tjp/pgplot/
url :
	 ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot522.tar.gz
description :
	 Device-independent graphics package for making simple scientific graphs
build_deps :
link_deps :
	 gcc
	 libpng
	 :x11
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/patches/b520c2d/pgplot/patch-makemake.diff
	 https://raw.githubusercontent.com/Homebrew/patches/b520c2d/pgplot/patch-proccom.c.diff
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.append "CPPFLAGS", "-DPG_PPU"
	 inreplace "src/grgfil.f", "/usr/local/pgplot", share
	 inreplace "makehtml", "/usr/local/bin/perl", which("perl")
	 inreplace "drivers/pndriv.c", "setjmp(png_ptr->jmpbuf)", "setjmp(png_jmpbuf(png_ptr))"
	 (buildpath/"sys_darwin/homebrew.conf").write <<~EOS
	 XINCL="#{ENV.cppflags}"
	 MOTIF_INCL=""
	 ATHENA_INCL=""
	 TK_INCL=""
	 RV_INCL=""
	 FCOMPL="gfortran"
	 FFLAGC="-ffixed-line-length-none"
	 FFLAGD=""
	 CCOMPL="#{ENV.cc}"
	 CFLAGC="#{ENV.cppflags}"
	 CFLAGD=""
	 PGBIND_FLAGS="bsd"
	 LIBS="#{ENV.ldflags} -lX11"
	 MOTIF_LIBS=""
	 ATHENA_LIBS=""
	 TK_LIBS=""
	 RANLIB="#{which "ranlib"}"
	 SHARED_LIB="libpgplot.dylib"
	 SHARED_LD="gfortran -dynamiclib -single_module $LDFLAGS -lX11 -install_name libpgplot.dylib"
	 SHARED_LIB_LIBS="#{ENV.ldflags} -lpng -lX11"
	 MCOMPL=""
	 MFLAGC=""
	 SYSDIR="$SYSDIR"
	 CSHARED_LIB="libcpgplot.dylib"
	 CSHARED_LD="gfortran -dynamiclib -single_module $LDFLAGS -lX11"
	 EOS
	 mkdir "build" do
	 cp "../drivers.list", "."
	 %w[GIF VGIF LATEX PNG TPNG PS
	 VPS CPS VCPS XWINDOW XSERVE].each do |drv|
	 inreplace "drivers.list", %r{^! (.*\/#{drv} .*)}, '  \1'
	 end
	 system "../makemake .. darwin; make; make cpg; make pgplot.html"
	 bin.install "pgxwin_server", "pgbind"
	 lib.install Dir["*.dylib", "*.a"]
	 include.install Dir["*.h"]
	 share.install Dir["*.txt", "*.dat"]
	 doc.install Dir["*.doc", "*.html"]
	 (share/"examples").install Dir["*demo*", "../examples/pgdemo*.f", "../cpg/cpgdemo*.c", "../drivers/*/pg*demo.*"]
	 end
