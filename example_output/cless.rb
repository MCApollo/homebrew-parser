name :
	 Cless
homepage :
	 https://github.com/tanakh/cless
url :
	 https://github.com/tanakh/cless/archive/0.3.0.0.tar.gz
description :
	 Display file contents with colorized syntax highlighting
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
	 (buildpath/"cabal.config").write("allow-newer: base,transformers\n")
	 install_cabal_package
