name :
	 Ledit
homepage :
	 http://pauillac.inria.fr/~ddr/ledit/
url :
	 http://pauillac.inria.fr/~ddr/ledit/distrib/src/ledit-2.04.tgz
description :
	 Line editor for interactive commands
build_deps :
link_deps :
	 camlp5
	 ocaml
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[BINDIR=#{bin} LIBDIR=#{lib} MANDIR=#{man}]
	 system "make", *args
	 system "make", "install", *args
