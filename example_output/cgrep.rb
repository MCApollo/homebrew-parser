name :
	 Cgrep
homepage :
	 https://github.com/awgn/cgrep
url :
	 https://github.com/awgn/cgrep/archive/v6.6.27.tar.gz
description :
	 Context-aware grep for source code
build_deps :
	 cabal-install
	 ghc
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package
