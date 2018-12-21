name :
	 Cpansearch
homepage :
	 https://github.com/c9s/cpansearch
url :
	 https://github.com/c9s/cpansearch/archive/0.2.tar.gz
description :
	 CPAN module search written in C
build_deps :
	 pkg-config
link_deps :
	 glib
	 ncurses
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "cpans"
