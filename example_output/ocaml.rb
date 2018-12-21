name :
	 Ocaml
homepage :
	 https://ocaml.org/
url :
	 https://caml.inria.fr/pub/distrib/ocaml-4.07/ocaml-4.07.1.tar.xz
description :
	 General purpose programming language in the ML family
build_deps :
link_deps :
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = ["-prefix", HOMEBREW_PREFIX.to_s, "-with-debug-runtime", "-mandir", man]
	 args << "-no-graph" if build.without? "x11"
	 args << "-flambda" if build.with? "flambda"
	 system "./configure", *args
	 system "make", "world.opt"
	 system "make", "install", "PREFIX=#{prefix}"
