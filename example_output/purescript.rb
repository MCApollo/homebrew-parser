name :
	 Purescript
homepage :
	 http://www.purescript.org
url :
	 https://hackage.haskell.org/package/purescript-0.12.1/purescript-0.12.1.tar.gz
description :
	 Strongly typed programming language that compiles to JavaScript
build_deps :
	 cabal-install
	 ghc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cabal_sandbox do
	 if build.head?
	 cabal_install "hpack"
	 system "./.cabal-sandbox/bin/hpack"
	 end
	 install_cabal_package "-f", "release", :using => ["alex", "happy"]
	 end
