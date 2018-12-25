name :
	 Coccinelle
homepage :
	 http://coccinelle.lip6.fr/
url :
	 http://coccinelle.lip6.fr/distrib/coccinelle-1.0.6.tgz
description :
	 Program matching and transformation engine for C code
build_deps :
	 hevea
	 opam
link_deps :
	 camlp4
	 ocaml
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OCAMLPARAM"] = "safe-string=0,_"
	 opamroot = buildpath/"opamroot"
	 ENV["OPAMROOT"] = opamroot
	 ENV["OPAMYES"] = "1"
	 system "opam", "init", "--no-setup"
	 system "opam", "install", "ocamlfind"
	 system "./configure", "--disable-dependency-tracking",
	 "--enable-release",
	 "--enable-ocaml",
	 "--enable-opt",
	 "--enable-ocaml",
	 "--with-pdflatex=no",
	 "--prefix=#{prefix}"
	 system "opam", "config", "exec", "--", "make"
	 system "make", "install"
	 pkgshare.install "demos/simple.cocci", "demos/simple.c"
