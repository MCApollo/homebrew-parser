name :
	 Ocamlbuild
homepage :
	 https://github.com/ocaml/ocamlbuild
url :
	 https://github.com/ocaml/ocamlbuild/archive/0.13.1.tar.gz
description :
	 Generic build tool for OCaml
build_deps :
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
	 system "make", "configure", "OCAMLBUILD_BINDIR=#{bin}", "OCAMLBUILD_LIBDIR=#{lib}", "OCAMLBUILD_MANDIR=#{man}"
	 system "make"
	 system "make", "install"
