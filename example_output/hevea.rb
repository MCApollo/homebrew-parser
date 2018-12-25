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
optional_deps :
	 ghostscript
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 system "make"
	 system "make", "install"
