name :
	 GitAnnex
homepage :
	 https://git-annex.branchable.com/
url :
	 https://hackage.haskell.org/package/git-annex-7.20181121/git-annex-7.20181121.tar.gz
description :
	 Manage files with git without checking in file contents
build_deps :
	 cabal-install
	 ghc@8.2
	 pkg-config
link_deps :
	 gsasl
	 libmagic
	 quvi
	 xdot
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 install_cabal_package "--constraint", "http-conduit<2.3",
	 "--constraint", "network<2.7.0.1",
	 :using => ["alex", "happy", "c2hs"],
	 :flags => ["s3", "webapp"]
	 bin.install_symlink "git-annex" => "git-annex-shell"
