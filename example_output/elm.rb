name :
	 Elm
homepage :
	 https://elm-lang.org
url :
	 https://github.com/elm/compiler/archive/0.19.0.tar.gz
description :
	 Functional programming language for building browser-based GUIs
build_deps :
	 cabal-install
	 ghc@8.2
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"elm-compiler").install Dir["*"]
	 cabal_sandbox do
	 cabal_sandbox_add_source "elm-compiler"
	 cabal_install "--only-dependencies", "elm"
	 cabal_install "--prefix=#{prefix}", "elm"
	 end
