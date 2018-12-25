name :
	 HaskellStack
homepage :
	 https://haskellstack.org/
url :
	 https://github.com/commercialhaskell/stack/releases/download/v1.9.3/stack-1.9.3-sdist-1.tar.gz
description :
	 The Haskell Tool Stack
build_deps :
	 cabal-install
	 ghc
link_deps :
optional_deps :
conflicts :
resource :
	 ['stack_lts_12_yaml']
	 ['https://raw.githubusercontent.com/commercialhaskell/stack/v1.9.3/stack-lts-12.yaml']
patches :
EOF_patch :
install :
	 buildpath.install resource("stack_lts_12_yaml")
	 cabal_sandbox do
	 cabal_install "happy"
	 cabal_install "--flags=disable-git-info"
	 jobs = ENV.make_jobs
	 ENV.deparallelize
	 system "stack", "-j#{jobs}", "--stack-yaml=stack-lts-12.yaml",
	 "--system-ghc", "--no-install-ghc", "setup"
	 system "stack", "-j#{jobs}", "--stack-yaml=stack-lts-12.yaml",
	 "--system-ghc", "--no-install-ghc", "--local-bin-path=#{bin}",
	 "install", "--flag", "stack:disable-git-info"
	 end
