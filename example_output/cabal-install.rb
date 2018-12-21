name :
	 CabalInstall
homepage :
	 https://www.haskell.org/cabal/
url :
	 https://hackage.haskell.org/package/cabal-install-2.4.1.0/cabal-install-2.4.1.0.tar.gz
description :
	 Command-line interface for Cabal and Hackage
build_deps :
link_deps :
	 ghc
conflicts :
patches :
EOF_patch :
install :
	 cd "cabal-install" if build.head?
	 system "sh", "bootstrap.sh", "--sandbox"
	 bin.install ".cabal-sandbox/bin/cabal"
	 bash_completion.install "bash-completion/cabal"
