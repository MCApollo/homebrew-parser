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
optional_deps :
conflicts :
resource :
	 ['homebrew-key.gpg']
	 ['https://gist.githubusercontent.com/zmwangx/be307671d11cd78985bd3a96182f15ea/raw/c7e803814efc4ca96cc9a56632aa542ea4ccf5b3/homebrew-key.gpg']
patches :
EOF_patch :
install :
	 install_cabal_package :using => ["alex", "happy"]
