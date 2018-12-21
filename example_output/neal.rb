name :
	 Neal
homepage :
	 https://uber.github.io/NEAL/
url :
	 https://github.com/uber/NEAL/archive/v0.2.4.tar.gz
description :
	 Analyzes source code based on user-specified rules written in a custom DSL
build_deps :
	 camlp4
	 ocaml
	 ocaml-num
	 ocamlbuild
	 opam
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 opamroot = buildpath/"opamroot"
	 opamroot.mkpath
	 ENV["OPAMROOT"] = opamroot
	 ENV["OPAMYES"] = "1"
	 ENV["NATIVE"] = "1"
	 ENV["LIB_PATH"] = lib
	 ENV["BIN_PATH"] = bin
	 system "opam", "init", "--no-setup"
	 system "opam", "install", "ocamlfind"
	 system "opam", "install", "--fake", "num"
	 system "opam", "config", "exec", "--", "make", "brew"
