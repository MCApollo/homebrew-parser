name :
	 HighlightingKate
homepage :
	 https://github.com/jgm/highlighting-kate
url :
	 https://hackage.haskell.org/package/highlighting-kate-0.6.4/highlighting-kate-0.6.4.tar.gz
description :
	 Haskell syntax highlighting library, based on the Kate editor
build_deps :
	 cabal-install
	 ghc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package "-f", "executable"
