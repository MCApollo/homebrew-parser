name :
	 Trr
homepage :
	 https://code.google.com/archive/p/trr22/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/trr22/trr22_0.99-5.tar.gz
description :
	 Type training program for emacs users
build_deps :
	 nkf
link_deps :
	 apel
conflicts :
patches :
EOF_patch :
install :
	 system "make", "clean"
	 cp Dir["#{Formula["apel"].opt_elisp}/**/*.el"], buildpath
	 system "nkf", "-w", "--overwrite", buildpath/"CONTENTS"
	 inreplace buildpath/"CONTENTS", "EmacsLisp", "Elisp_programs"
	 system "make", "clean"
	 cp Dir["#{Formula["apel"].opt_elisp}/**/*.elc"], buildpath
	 texts = "The_Constitution_Of_JAPAN Constitution_of_the_USA Iccad_90 C_programs Elisp_programs Java_programs Ocaml_programs Python_programs"
	 inreplace buildpath/"Makefile", "japanese = t", "japanese = nil"
	 system "make", "install",
	 "CC=#{ENV.cc}",
	 "TRRDIR=#{prefix}",
	 "INFODIR=#{info}",
	 "BINDIR=#{bin}",
	 "TEXTS=#{texts}",
	 "LISPDIR=#{elisp}"
	 (prefix/"record").install Dir["record/*"]
