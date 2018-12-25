name :
	 Xsv
homepage :
	 https://github.com/BurntSushi/xsv
url :
	 https://github.com/BurntSushi/xsv/archive/0.13.0.tar.gz
description :
	 Fast CSV toolkit written in Rust
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
