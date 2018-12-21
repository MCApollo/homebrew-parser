name :
	 Futhark
homepage :
	 https://futhark-lang.org/
url :
	 https://github.com/diku-dk/futhark/archive/v0.7.4.tar.gz
description :
	 Data-parallel functional programming language
build_deps :
	 cabal-install
	 ghc
	 sphinx-doc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cabal_sandbox do
	 cabal_install "hpack"
	 system "./.cabal-sandbox/bin/hpack"
	 install_cabal_package :using => ["alex", "happy"]
