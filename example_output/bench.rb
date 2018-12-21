name :
	 Bench
homepage :
	 https://github.com/Gabriel439/bench
url :
	 https://hackage.haskell.org/package/bench-1.0.12/bench-1.0.12.tar.gz
description :
	 Command-line benchmark tool
build_deps :
	 cabal-install
	 ghc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package
