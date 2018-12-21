name :
	 Hilite
homepage :
	 https://sourceforge.net/projects/hilite/
url :
	 https://downloads.sourceforge.net/project/hilite/hilite/1.5/hilite.c
description :
	 CLI tool that runs a command and highlights STDERR output
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, ENV.cflags, "hilite.c", "-o", "hilite"
	 bin.install "hilite"
