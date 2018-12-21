name :
	 PandocCiteproc
homepage :
	 https://github.com/jgm/pandoc-citeproc
url :
	 https://hackage.haskell.org/package/pandoc-citeproc-0.15.0.1/pandoc-citeproc-0.15.0.1.tar.gz
description :
	 Library and executable for using citeproc with pandoc
build_deps :
	 cabal-install
	 ghc
link_deps :
	 pandoc
conflicts :
patches :
EOF_patch :
install :
	 args = []
	 args << "--constraint=cryptonite -support_aesni" if MacOS.version <= :lion
	 install_cabal_package *args
