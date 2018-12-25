name :
	 ElmFormat
homepage :
	 https://github.com/avh4/elm-format
url :
	 https://github.com/avh4/elm-format.git
description :
	 Elm source code formatter, inspired by gofmt
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
	 (buildpath/"elm-format").install Dir["*"]
	 cabal_sandbox do
	 cabal_sandbox_add_source "elm-format"
	 cabal_install "--only-dependencies", "elm-format"
	 cabal_install "--prefix=#{prefix}", "elm-format"
	 end
