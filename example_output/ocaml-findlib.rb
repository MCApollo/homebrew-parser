name :
	 OcamlFindlib
homepage :
	 http://projects.camlcity.org/projects/findlib.html
url :
	 http://download.camlcity.org/download/findlib-1.8.0.tar.gz
description :
	 OCaml library manager
build_deps :
link_deps :
	 ocaml
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "-bindir", bin,
	 "-mandir", man,
	 "-sitelib", lib/"ocaml",
	 "-config", etc/"findlib.conf",
	 "-no-topfind"
	 system "make", "all"
	 system "make", "opt"
	 inreplace "findlib.conf", prefix, HOMEBREW_PREFIX
	 system "make", "install"
