name :
	 Mandoc
homepage :
	 https://mandoc.bsd.lv/
url :
	 https://mandoc.bsd.lv/snapshots/mandoc-1.14.4.tar.gz
description :
	 The mandoc UNIX manpage compiler toolset
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 localconfig = [
	 "PREFIX=#{prefix}",
	 "INCLUDEDIR=#{include}",
	 "LIBDIR=#{lib}",
	 "MANDIR=#{man}",
	 "WWWPREFIX=#{prefix}/var/www",
	 "EXAMPLEDIR=#{share}/examples",
	 "BINM_MAN=bsdman",
	 "BINM_APROPOS=bsdapropos",
	 "BINM_WHATIS=bsdwhatis",
	 "BINM_MAKEWHATIS=bsdmakewhatis",
	 "MANM_MAN=man",
	 "MANM_MDOC=mdoc",
	 "MANM_ROFF=mandoc_roff",
	 "MANM_EQN=eqn",
	 "MANM_TBL=tbl",
	 "OSNAME='Mac OS X
	 "MANPATH_DEFAULT=#{HOMEBREW_PREFIX}/share/man",
	 "HAVE_MANPATH=0",
	 "STATIC=",
	 "HOMEBREWDIR=
	 "BUILD_CGI=1",
	 ]
	 File.rename("cgi.h.example", "cgi.h")
	 (buildpath/"configure.local").write localconfig.join("\n")
	 system "./configure"
	 ENV.deparallelize do
	 system "make"
	 system "make", "install"
