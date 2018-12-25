name :
	 Hlint
homepage :
	 https://github.com/ndmitchell/hlint
url :
	 https://hackage.haskell.org/package/hlint-2.1.10/hlint-2.1.10.tar.gz
description :
	 Haskell source code suggestions
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
	 install_cabal_package :using => "happy"
	 man1.install "data/hlint.1"
