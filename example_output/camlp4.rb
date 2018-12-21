name :
	 Camlp4
homepage :
	 https://github.com/ocaml/camlp4
url :
	 https://github.com/ocaml/camlp4/archive/4.07+1.tar.gz
description :
	 Tool to write extensible parsers in OCaml
build_deps :
link_deps :
	 ocaml
	 ocamlbuild
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--bindir=#{bin}",
	 "--libdir=#{HOMEBREW_PREFIX}/lib/ocaml",
	 "--pkgdir=#{HOMEBREW_PREFIX}/lib/ocaml/camlp4"
	 system "make", "all"
	 system "make", "install", "LIBDIR=#{lib}/ocaml",
	 "PKGDIR=#{lib}/lib/ocaml/camlp4"
