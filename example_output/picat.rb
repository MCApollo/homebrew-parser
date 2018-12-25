name :
	 Picat
homepage :
	 http://picat-lang.org/
url :
	 http://picat-lang.org/download/picat25_src.tar.gz
description :
	 Simple, and yet powerful, logic-based multi-paradigm programming language
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
	 inreplace "emu/Makefile.picat.mac64", "/usr/local/bin/gcc", "gcc"
	 system "make", "-C", "emu", "-f", "Makefile.picat.mac64"
	 bin.install "emu/picat_macx" => "picat"
	 prefix.install "lib" => "pi_lib"
	 doc.install Dir["doc/*"]
	 pkgshare.install "exs"
