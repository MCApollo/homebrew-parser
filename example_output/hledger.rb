name :
	 Hledger
homepage :
	 http://hledger.org
url :
	 https://hackage.haskell.org/package/hledger-1.11.1/hledger-1.11.1.tar.gz
description :
	 Command-line accounting tool
build_deps :
	 cabal-install
	 ghc
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 install_cabal_package :using => ["happy"]
