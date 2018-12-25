name :
	 Menhir
homepage :
	 http://cristal.inria.fr/~fpottier/menhir
url :
	 http://cristal.inria.fr/~fpottier/menhir/menhir-20180905.tar.gz
description :
	 LR(1) parser generator for the OCaml programming language
build_deps :
	 ocamlbuild
link_deps :
	 ocaml
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "all"
	 system "make", "PREFIX=#{prefix}", "install"
