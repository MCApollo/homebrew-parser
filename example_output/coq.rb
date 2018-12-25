name :
	 Coq
homepage :
	 https://coq.inria.fr/
url :
	 https://github.com/coq/coq/archive/V8.8.2.tar.gz
description :
	 Proof assistant for higher-order logic
build_deps :
	 ocaml-findlib
link_deps :
	 camlp5
	 ocaml
	 ocaml-num
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "-prefix", prefix,
	 "-mandir", man,
	 "-emacslib", elisp,
	 "-coqdocdir", "#{pkgshare}/latex",
	 "-coqide", "no",
	 "-with-doc", "no"
	 system "make", "world"
	 ENV.deparallelize { system "make", "install" }
