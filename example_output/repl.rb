name :
	 Repl
homepage :
	 https://github.com/defunkt/repl
url :
	 https://github.com/defunkt/repl/archive/v1.0.0.tar.gz
description :
	 Wrap non-interactive programs with a REPL
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "bin/repl"
	 man1.install "man/repl.1"
