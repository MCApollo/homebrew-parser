name :
	 Hadolint
homepage :
	 https://github.com/hadolint/hadolint
url :
	 https://github.com/hadolint/hadolint/archive/v1.15.0.tar.gz
description :
	 Smarter Dockerfile linter to validate best practices
build_deps :
	 cabal-install
	 ghc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cabal_sandbox do
	 cabal_install "hpack"
	 system "./.cabal-sandbox/bin/hpack"
	 end
	 install_cabal_package
