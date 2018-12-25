name :
	 Pandoc
homepage :
	 https://pandoc.org/
url :
	 https://hackage.haskell.org/package/pandoc-2.5/pandoc-2.5.tar.gz
description :
	 Swiss-army knife of markup format conversion
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
	 cabal_sandbox do
	 args = []
	 args << "--constraint=cryptonite -support_aesni" if MacOS.version <= :lion
	 install_cabal_package *args
	 end
	 (bash_completion/"pandoc").write `#{bin}/pandoc --bash-completion`
