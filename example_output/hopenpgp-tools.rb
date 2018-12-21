name :
	 HopenpgpTools
homepage :
	 https://hackage.haskell.org/package/hopenpgp-tools
url :
	 https://hackage.haskell.org/package/hopenpgp-tools-0.21.2/hopenpgp-tools-0.21.2.tar.gz
description :
	 Command-line tools for OpenPGP-related operations
build_deps :
	 cabal-install
	 ghc
	 pkg-config
link_deps :
	 nettle
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package :using => ["alex", "happy"]
