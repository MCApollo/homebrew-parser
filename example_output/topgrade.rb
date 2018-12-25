name :
	 Topgrade
homepage :
	 https://github.com/r-darwish/topgrade
url :
	 https://github.com/r-darwish/topgrade/archive/v1.2.0.tar.gz
description :
	 Upgrade all the things
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
