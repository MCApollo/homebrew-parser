name :
	 Opam
homepage :
	 https://opam.ocaml.org
url :
	 https://github.com/ocaml/opam/releases/download/2.0.2/opam-full-2.0.2.tar.gz
description :
	 The OCaml package manager
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
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "lib-ext"
	 system "make"
	 system "make", "man"
	 system "make", "install"
	 bash_completion.install "src/state/shellscripts/complete.sh"
	 zsh_completion.install "src/state/shellscripts/complete.zsh" => "_opam"
