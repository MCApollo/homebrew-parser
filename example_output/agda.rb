name :
	 Agda
homepage :
	 https://wiki.portal.chalmers.se/agda/
url :
	 https://hackage.haskell.org/package/Agda-2.5.4.2/Agda-2.5.4.2.tar.gz
description :
	 Dependently typed functional programming language
build_deps :
link_deps :
	 cabal-install
	 ghc
	 emacs
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package :using => ["alex", "happy", "cpphs"]
	 resource("stdlib").stage lib/"agda"
	 cd lib/"agda" do
	 cabal_sandbox :home => buildpath, :keep_lib => true do
	 cabal_install "--only-dependencies"
	 cabal_install
	 system "GenerateEverything"
