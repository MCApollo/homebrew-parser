name :
	 Bat
homepage :
	 https://github.com/sharkdp/bat
url :
	 https://github.com/sharkdp/bat/archive/v0.9.0.tar.gz
description :
	 Clone of cat(1) with syntax highlighting and Git integration
build_deps :
	 cmake
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
	 man1.install "doc/bat.1"
