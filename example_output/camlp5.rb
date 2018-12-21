name :
	 Camlp5
homepage :
	 https://camlp5.github.io/
url :
	 https://github.com/camlp5/camlp5/archive/rel707.tar.gz
description :
	 Preprocessor and pretty-printer for OCaml
build_deps :
link_deps :
	 ocaml
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix", prefix, "--mandir", man
	 system "make", "world.opt"
	 system "make", "install"
	 (lib/"ocaml/camlp5").install "etc/META"
