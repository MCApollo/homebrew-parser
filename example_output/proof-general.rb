name :
	 ProofGeneral
homepage :
	 https://proofgeneral.github.io
url :
	 https://github.com/ProofGeneral/PG/archive/v4.4.tar.gz
description :
	 Emacs-based generic interface for theorem provers
build_deps :
	 texi2html
	 texinfo
link_deps :
	 emacs
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 PREFIX=#{prefix}
	 DEST_PREFIX=#{prefix}
	 ELISPP=share/emacs/site-lisp/proof-general
	 ELISP_START=#{elisp}/site-start.d
	 EMACS=#{which "emacs"}
	 ]
	 system "make", "install", *args
	 cd "doc" do
	 system "make", "info", "html"
	 end
	 man1.install "doc/proofgeneral.1"
	 info.install "doc/ProofGeneral.info", "doc/PG-adapting.info"
	 doc.install "doc/ProofGeneral", "doc/PG-adapting"
