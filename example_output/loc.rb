name :
	 Loc
homepage :
	 https://github.com/cgag/loc
url :
	 https://github.com/cgag/loc/archive/v0.4.1.tar.gz
description :
	 Count lines of code quickly
build_deps :
	 rust
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
