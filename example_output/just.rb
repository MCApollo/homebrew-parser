name :
	 Just
homepage :
	 https://github.com/casey/just
url :
	 https://github.com/casey/just/archive/v0.3.13.tar.gz
description :
	 Handy way to save and run project-specific commands
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
