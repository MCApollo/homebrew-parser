name :
	 Shelltestrunner
homepage :
	 https://github.com/simonmichael/shelltestrunner
url :
	 https://hackage.haskell.org/package/shelltestrunner-1.9/shelltestrunner-1.9.tar.gz
description :
	 Portable command-line tool for testing command-line programs
build_deps :
	 cabal-install
	 ghc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package :using => ["happy"]
