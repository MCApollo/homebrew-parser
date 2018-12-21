name :
	 Lfe
homepage :
	 http://lfe.io/
url :
	 https://github.com/rvirding/lfe/archive/v1.3.tar.gz
description :
	 Concurrent Lisp for the Erlang VM
build_deps :
link_deps :
	 erlang
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "MANINSTDIR=#{man}", "install-man"
	 system "make", "emacs"
	 libexec.install "bin", "ebin"
	 bin.install_symlink (libexec/"bin").children
	 doc.install Dir["doc/*.txt"]
	 pkgshare.install "dev", "examples", "test"
	 elisp.install Dir["emacs/*.elc"]
