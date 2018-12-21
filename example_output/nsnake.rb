name :
	 Nsnake
homepage :
	 https://github.com/alexdantas/nSnake
url :
	 https://downloads.sourceforge.net/project/nsnake/GNU-Linux/nsnake-3.0.1.tar.gz
description :
	 Classic snake game with textual interface
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
	 (share/"applications").rmtree
	 (share/"icons").rmtree
	 (share/"pixmaps").rmtree
