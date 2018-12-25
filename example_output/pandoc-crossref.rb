name :
	 PandocCrossref
homepage :
	 https://github.com/lierdakil/pandoc-crossref
url :
	 https://hackage.haskell.org/package/pandoc-crossref-0.3.4.0/pandoc-crossref-0.3.4.0.tar.gz
description :
	 Pandoc filter for numbering and cross-referencing
build_deps :
	 cabal-install
	 ghc
link_deps :
	 pandoc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = []
	 args << "--constraint=cryptonite -support_aesni" if MacOS.version <= :lion
	 install_cabal_package *args
