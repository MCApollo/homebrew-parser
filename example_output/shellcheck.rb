name :
	 Shellcheck
homepage :
	 https://www.shellcheck.net/
url :
	 https://github.com/koalaman/shellcheck/archive/v0.6.0.tar.gz
description :
	 Static analysis and lint tool, for (ba)sh scripts
build_deps :
	 cabal-install
	 ghc
	 pandoc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package
	 system "pandoc", "-s", "-f", "markdown-smart", "-t", "man",
	 "shellcheck.1.md", "-o", "shellcheck.1"
	 man1.install "shellcheck.1"
