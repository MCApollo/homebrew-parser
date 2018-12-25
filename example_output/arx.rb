name :
	 Arx
homepage :
	 https://github.com/solidsnack/arx
url :
	 https://github.com/solidsnack/arx/archive/0.3.2.tar.gz
description :
	 Bundles files and programs for easy transfer and repeatable execution
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
	 cabal_install "--only-dependencies"
	 system "make"
	 tag = `./bin/dist tag`.chomp
	 bin.install "tmp/dist/arx-#{tag}/arx" => "arx"
	 end
