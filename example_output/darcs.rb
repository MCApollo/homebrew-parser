name :
	 Darcs
homepage :
	 http://darcs.net/
url :
	 https://hackage.haskell.org/package/darcs-2.14.1/darcs-2.14.1.tar.gz
description :
	 Distributed version control system that tracks changes, via Haskell
build_deps :
	 cabal-install
	 ghc
link_deps :
	 gmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 install_cabal_package
