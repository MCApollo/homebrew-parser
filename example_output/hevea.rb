name :
	 Hevea
homepage :
	 http://hevea.inria.fr/
url :
	 http://hevea.inria.fr/old/hevea-2.32.tar.gz
description :
	 LaTeX-to-HTML translator
build_deps :
	 ocamlbuild
link_deps :
	 ocaml
	 ghostscript
conflicts :
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 system "make"
	 system "make", "install"
