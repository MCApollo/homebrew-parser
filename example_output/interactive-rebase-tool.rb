name :
	 InteractiveRebaseTool
homepage :
	 https://gitrebasetool.mitmaro.ca/
url :
	 https://github.com/MitMaro/git-interactive-rebase-tool/archive/0.7.0.tar.gz
description :
	 Ncurses sequence editor for git interactive rebase
build_deps :
	 rust
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
