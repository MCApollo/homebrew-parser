name :
	 Makeicns
homepage :
	 https://bitbucket.org/mkae/makeicns
url :
	 https://bitbucket.org/mkae/makeicns/downloads/makeicns-1.4.10a.tar.bz2
description :
	 Create icns files from the command-line
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e59da9d/makeicns/patch-IconFamily.m.diff
EOF_patch :
install :
	 system "make"
	 bin.install "makeicns"
