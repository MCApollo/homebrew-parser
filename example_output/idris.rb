name :
	 Idris
homepage :
	 https://www.idris-lang.org/
url :
	 https://github.com/idris-lang/Idris-dev/archive/v1.3.1.tar.gz
description :
	 Pure functional programming language with dependent types
build_deps :
	 cabal-install
	 ghc
	 pkg-config
link_deps :
	 libffi
conflicts :
patches :
EOF_patch :
install :
	 args = ["-f", "FFI"]
	 args << "-f" << "release" if build.stable?
	 install_cabal_package *args
