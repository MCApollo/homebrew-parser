name :
	 Lemon
homepage :
	 https://www.hwaci.com/sw/lemon/
url :
	 https://tx97.net/pub/distfiles/lemon-1.69.tar.bz2
description :
	 LALR(1) parser generator like yacc or bison
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 pkgshare.install "lempar.c"
	 inreplace "lemon.c", / = pathsearch\([^)]*\);/, " = \"#{pkgshare}/lempar.c\";"
	 system ENV.cc, "-o", "lemon", "lemon.c"
	 bin.install "lemon"
