name :
	 OcamlNum
homepage :
	 https://github.com/ocaml/num
url :
	 https://github.com/ocaml/num/archive/v1.1.tar.gz
description :
	 OCaml legacy Num library for arbitrary-precision arithmetic
build_deps :
	 ocaml-findlib
link_deps :
	 ocaml
conflicts :
patches :
EOF_patch :
install :
	 ENV["OCAMLFIND_DESTDIR"] = lib/"ocaml"
	 (lib/"ocaml").mkpath
	 cp Formula["ocaml"].opt_lib/"ocaml/Makefile.config", lib/"ocaml"
	 inreplace lib/"ocaml/Makefile.config", /^PREFIX=#{HOMEBREW_PREFIX}$/,
	 "PREFIX=#{prefix}"
	 system "make"
	 (lib/"ocaml/stublibs").mkpath
	 system "make", "install", "STDLIBDIR=#{lib}/ocaml"
	 pkgshare.install "test"
	 rm lib/"ocaml/Makefile.config"
