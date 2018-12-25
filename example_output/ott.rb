name :
	 Ott
homepage :
	 https://www.cl.cam.ac.uk/~pes20/ott/
url :
	 https://github.com/ott-lang/ott/archive/0.28.tar.gz
description :
	 Tool for writing definitions of programming languages and calculi
build_deps :
	 ocaml
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "world"
	 bin.install "bin/ott"
	 pkgshare.install "examples"
	 (pkgshare/"emacs/site-lisp/ott").install "emacs/ott-mode.el"
