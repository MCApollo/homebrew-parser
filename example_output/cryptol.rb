name :
	 Cryptol
homepage :
	 https://www.cryptol.net/
url :
	 https://hackage.haskell.org/package/cryptol-2.6.0/cryptol-2.6.0.tar.gz
description :
	 Domain-specific language for specifying cryptographic algorithms
build_deps :
	 cabal-install
	 ghc
link_deps :
	 z3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 install_cabal_package :using => ["alex", "happy"]
