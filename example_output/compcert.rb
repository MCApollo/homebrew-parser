name :
	 Compcert
homepage :
	 http://compcert.inria.fr
url :
	 https://github.com/AbsInt/CompCert/archive/v3.4.tar.gz
description :
	 Formally verified C compiler
build_deps :
	 coq
	 menhir
	 ocaml
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "-prefix", prefix, "x86_64-macosx",
	 "-ignore-coq-version"
	 system "make", "all"
	 system "make", "install"
